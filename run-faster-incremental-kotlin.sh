#!/bin/sh
sync

time gradle-profiler \
    --project-dir santa-tracker-kotlin \
    --scenario-file santa-tracker-kotlin.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations 100 \
    --benchmark noOptimizations onlyPartialInvalidation onlyVfsRetention
