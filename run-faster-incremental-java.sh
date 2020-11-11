#!/bin/bash

AGP_VERSION="${AGP_VERSION:-4.2.0-alpha16}"
GRADLE_VERSION="${GRADLE_VERSION:-6.8-20201110230043+0000}"

sync

gradle-profiler/gradlew --project-dir gradle-profiler install

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    -DagpVersion=$AGP_VERSION \
    --project-dir santa-tracker-java \
    --scenario-file santa-tracker-java.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations ${1:-100} \
    --benchmark no-optimizations only-file-system-watching only-configuration-cache all-optimizations \
    --csv-format long
