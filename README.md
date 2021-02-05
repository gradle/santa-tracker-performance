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

Once these are set up you can run the `run-incremental-benchmark.sh` script.
Doing so will use Gradle Profiler from the `gradle-profiler` submodule.

You can also pass a number as a parameter to the above tests to make it run the given number of iterations, like so:

```console
$ AGP_VERSION=4.0.0-beta01 ./run-incremental-benchmark.sh 40
```

This will run 40 iterations with the default Gradle and Kotlin versions, using AGP `4.0.0-beta01`.
