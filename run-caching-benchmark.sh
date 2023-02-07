#!/bin/bash
set -e

# Usage: ./run-incremental-benchmark.sh [<iteration count>]

ITERATION_COUNT_ARG="${1:-10}"

AGP_VERSION="${AGP_VERSION:-7.4.1}"
KOTLIN_VERSION="${KOTLIN_VERSION:-1.8.10}"
BENCHMARK="${BENCHMARK:-benchmark-local-change-ng}"

OP_URL="op://All Engineering/Build cache node test instance API cred"
echo "Getting data from 1Passowrd at '${OP_URL}'..."

# Generate a random ID for the cache URL each time
RANDOM_ID=$(openssl rand -hex 8)
HTTP_CACHE_URL_BASE=${HTTP_CACHE_URL_BASE:-$(op read "$OP_URL/website")}
export HTTP_CACHE_URL="$HTTP_CACHE_URL_BASE/cache/iter-$RANDOM_ID"
export HTTP_CACHE_USERNAME=${HTTP_CACHE_USERNAME:-$(op read "$OP_URL/username")}
export HTTP_CACHE_PASSWORD=${HTTP_CACHE_PASSWORD:-$(op read "$OP_URL/password")}
export HTTP_CACHE_PUSH=${HTTP_CACHE_PUSH:-true}

echo "Using HTTP cache at '${HTTP_CACHE_URL}'..."

sync

gradle-profiler/gradlew --project-dir gradle-profiler installDist

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    -DagpVersion=$AGP_VERSION \
    -DkotlinVersion=$KOTLIN_VERSION \
    --project-dir santa-tracker \
    --scenario-file santa-tracker-caching.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations ${ITERATION_COUNT_ARG} \
    --benchmark ${BENCHMARK} \
    --measure-gc \
    --measure-local-cache \
    --csv-format long
