# Santa Tracker Performance

_Performance tests for Santa Tracker Android project._

The project contains [Gradle Profiler](http://github.com/gradle/gradle-profiler) benchmark scenarios to test the performance of different kinds of behavior using the Santa Tracker Android app.
The repo has a submodule pointing to the Gradle fork of the [official Santa Tracker](https://github.com/google/santa-tracker-android) repository.
There is also a submodule pointing to Gradle Profiler itself.

## Running a benchmark

To run a benchmark set the following environment variables:

- `JAVA_HOME`
- `ANDROID_HOME`

You can customize the tool versions for the following:

- `GRADLE_VERSION` for the Gradle distribution to use to run the tests
- `AGP_VERSION` for the Android Gradle plugin version
- `KOTLIN_VERSION` for the Kotlin Gradle plugin version

Note that if you don't set these environment variables explicitly, then the defaults from the respective scripts will be used.

You can run the incremental benchmark with the `run-incremental-benchmark.sh` script and the Android Studio sync benchmark with the `run-android-studio-benchmark.sh`.
Doing so will use Gradle Profiler from the `gradle-profiler` submodule.

You can also pass a number as a parameter to the above tests to make it run the given number of iterations, like so:

```console
$ AGP_VERSION=4.0.0-beta01 ./run-incremental-benchmark.sh 40
```

This will run 40 iterations with the default Gradle and Kotlin versions, using AGP `4.0.0-beta01`.

To run just a specific set of benchmarks you can set BENCHMARK environment variable, like so:

```console
$ BENCHMARK="no-optimizations only-file-system-watching" ./run-incremental-benchmark.sh
```

This will run just `no-optimizations` and `only-file-system-watching` scenario.

### Android Studio benchmark specifics

For Android Studio sync Android Studio Bumblebee (2021.1.1) or later is required. Additionally, you have to set `ANDROID_STUDIO_INSTALL_DIR` environment variable with a location of the Android Studio. On the macOS that is normally `/Applications/Android Studio.app/`.

Android Studio benchmark will create an Android Studio sandbox folder in the `studio-sandbox` directory. This can be modified by setting `ANDROID_STUDIO_SANDBOX_DIR` environment variable.
