# Santa Tracker Performance

_Performance tests for Santa Tracker Android project._

The project contains [Gradle Profiler](http://github.com/gradle/gradle-profiler) benchmark scenarios to test the performance of different kinds of behavior using the Santa Tracker Android app.
The repo has two submodules pointing to the same Gradle fork of the [official Santa Trakcer](https://github.com/google/santa-tracker-android) repository.
One submodule points to an older branch of the original repository that is kept more or less up-to-date by Gradle, and uses Java sources only.
The other submodule is derived from the `master` branch of the main repo.
This variant is in large part written in Kotlin.

Respectively, there are separate performance tests scenarios for the Java and Kotlin.

You can run a benchmark for Java like this:

```text
$ gradle-profiler \
  --project-dir santa-tracker-java \
  --scenario-file santa-tracker-java.scenarios \
  --benchmark nonAbiChangeWithSnapshottingOps
```

Replacing `-java` with `-kotlin` results in the benchmark being executed with the Kotlin variant.
