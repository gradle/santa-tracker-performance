#!/bin/sh
sync

gradle-profiler/gradlew --project-dir gradle-profiler install

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    --project-dir santa-tracker-java \
    --scenario-file santa-tracker-java.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations ${1:-100} \
    --benchmark noOptimizations onlyPartialInvalidation onlyVfsRetention onlyInstantExecution allOptimizations \
    --csv-format long
