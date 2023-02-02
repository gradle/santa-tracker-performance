#!/bin/bash
set -e

# Usage: ./run-incremental-benchmark.sh [<iteration count>]

ITERATION_COUNT_ARG="${1:-10}"

AGP_VERSION="${AGP_VERSION:-7.4.1}"
GRADLE_VERSION1="${GRADLE_VERSION1:-7.6}"
GRADLE_VERSION2="${GRADLE_VERSION2:-7.6}"
KOTLIN_VERSION="${KOTLIN_VERSION:-1.8.0}"
BENCHMARK="${BENCHMARK:-build-cache-ng no-build-cache-ng}"

sync

gradle-profiler/gradlew --project-dir gradle-profiler installDist

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    -DagpVersion=$AGP_VERSION \
    -DkotlinVersion=$KOTLIN_VERSION \
    --project-dir santa-tracker \
    --scenario-file santa-tracker.scenarios \
    --gradle-version "$GRADLE_VERSION1" \
    --gradle-version "$GRADLE_VERSION2" \
    --warmups 2 \
    --iterations ${ITERATION_COUNT_ARG} \
    --benchmark ${BENCHMARK} \
    --measure-gc \
    --csv-format long
