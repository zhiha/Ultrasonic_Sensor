ThisBuild / version := "1.0"
ThisBuild / scalaVersion := "2.12.16"
ThisBuild / organization := "org.example"

val spinalVersion = "1.7.3"
val spinalCore = "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion
val spinalLib = "com.github.spinalhdl" %% "spinalhdl-lib" % spinalVersion
val spinalIdslPlugin = compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion)

lazy val mylib = (project in file("."))
  .settings(
    name := "Spinal-ZHIHA",
    libraryDependencies ++= Seq(spinalCore, spinalLib, spinalIdslPlugin) ,
    Compile / unmanagedSourceDirectories += baseDirectory.value / "tools" / "crypto" / "crypto" / "src" / "main" / "scala",
    Compile / unmanagedSourceDirectories += baseDirectory.value / "src" / "test" / "scala",
    Compile / unmanagedSourceDirectories += baseDirectory.value / "tools" / "sigmadelta" / "src" / "main" / "scala"
  )

fork := true

