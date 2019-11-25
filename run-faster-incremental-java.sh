#!/bin/sh
rm -rf santa-tracker-java/.instant-execution-state
sync

gradle-profiler \
    --project-dir santa-tracker-java \
    --scenario-file santa-tracker-java.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations 100 \
    --benchmark noOptimizations onlyPartialInvalidation onlyVfsRetention onlyInstantExecution allOptimizations \
    --csv-format long
