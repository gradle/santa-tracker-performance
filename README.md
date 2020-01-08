# Santa Tracker Performance

_Performance tests for Santa Tracker Android project._

The project contains [Gradle Profiler](http://github.com/gradle/gradle-profiler) benchmark scenarios to test the performance of different kinds of behavior using the Santa Tracker Android app.

The repo has two submodules pointing to the same Gradle fork of the [official Santa Trakcer](https://github.com/google/santa-tracker-android) repository.
One submodule points to an older branch of the original repository that is kept more or less up-to-date by Gradle, and uses Java sources only.
The other submodule is derived from the `master` branch of the main repo.
This variant is in large part written in Kotlin.

Respectively, there are separate performance tests scenarios for the Java and Kotlin.

There is also a submodule pointing to Gradle Profiler itself.

## Running a benchmark

To run a benchmark set the following environment variables:

- `JAVA_HOME`
- `ANDROID_HOME`
- `GRADLE_VERSION` (this is the version used for testing)

Once these are set up you can run either of the shell scripts:

- `run-faster-incremental-java.sh` for Java, or
- `run-faster-incremental-kotlin.sh` for the Kotlin variant (duh!)

Doing so will use Gradle Profiler from the `gradle-profiler` submodule.
