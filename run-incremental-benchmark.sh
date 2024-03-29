#!/bin/bash
set -e

# Usage: ./run-incremental-benchmark.sh [<iteration count>]

ITERATION_COUNT_ARG="${1:-100}"

AGP_VERSION="${AGP_VERSION:-7.2.2}"
GRADLE_VERSION="${GRADLE_VERSION:-7.5.1}"
KOTLIN_VERSION="${KOTLIN_VERSION:-1.4.30}"
BENCHMARK="${BENCHMARK:-no-optimizations only-file-system-watching only-configuration-cache all-optimizations}"

sync

gradle-profiler/gradlew --project-dir gradle-profiler installDist

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    -DagpVersion=$AGP_VERSION \
    -DkotlinVersion=$KOTLIN_VERSION \
    --project-dir santa-tracker \
    --scenario-file santa-tracker.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations ${ITERATION_COUNT_ARG} \
    --benchmark ${BENCHMARK} \
    --csv-format long
