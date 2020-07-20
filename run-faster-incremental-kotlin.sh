#!/bin/bash

AGP_VERSION="${AGP_VERSION:-4.2.0-alpha04}"
GRADLE_VERSION="${GRADLE_VERSION:-6.6-rc-1}"
KOTLIN_VERSION="${KOTLIN_VERSION:-1.3.72}"

sync

gradle-profiler/gradlew --project-dir gradle-profiler install

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    -DagpVersion=$AGP_VERSION \
    -DkotlinVersion=$KOTLIN_VERSION \
    --project-dir santa-tracker-kotlin \
    --scenario-file santa-tracker-kotlin.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations ${1:-100} \
    --benchmark no-optimizations only-file-system-watching \
    --csv-format long
