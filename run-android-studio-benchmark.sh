#!/bin/bash

AGP_VERSION="${AGP_VERSION:-7.1.0-beta04}"
GRADLE_VERSION="${GRADLE_VERSION:-7.3.1}"
KOTLIN_VERSION="${KOTLIN_VERSION:-1.4.30}"
BENCHMARK="${BENCHMARK:-no-op-sync first-import-sync-scenario app-build-script-change-sync app-dependency-change-sync library-dependency-change-sync}"
ANDROID_STUDIO_SANDBOX_DIR="${ANDROID_STUDIO_SANDBOX_DIR:-studio-sandbox}"

if [ -z ${ANDROID_STUDIO_INSTALL_DIR+x} ]; then
    echo "Env. variable ANDROID_STUDIO_INSTALL_DIR should be set with the location of the Android Studio"
    exit 1
fi

sync

gradle-profiler/gradlew --project-dir gradle-profiler installDist

gradle-profiler/build/install/gradle-profiler/bin/gradle-profiler \
    -DagpVersion=$AGP_VERSION \
    -DkotlinVersion=$KOTLIN_VERSION \
    --project-dir santa-tracker \
    --studio-install-dir "$ANDROID_STUDIO_INSTALL_DIR" \
    --studio-sandbox-dir "$ANDROID_STUDIO_SANDBOX_DIR" \
    --scenario-file santa-tracker-android-studio.scenarios \
    --gradle-version "$GRADLE_VERSION" \
    --warmups 2 \
    --iterations ${1:-10} \
    --benchmark ${BENCHMARK} \
    --csv-format long
