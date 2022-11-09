ThisBuild / version := "1.0"
ThisBuild / scalaVersion := "2.12.16"
ThisBuild / organization := "org.example"


val spinalVersion = "1.7.2"
val spinalCore = "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion
val spinalLib = "com.github.spinalhdl" %% "spinalhdl-lib" % spinalVersion
val spinalIdslPlugin = compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion)
val breeze = "org.scalanlp" %% "breeze" % "2.1.0"
val scalactic = "org.scalactic" %% "scalactic" % "3.2.9"
val scalatest = "org.scalatest" %% "scalatest" % "3.2.9"

lazy val mylib = (project in file("."))
  .settings(
    name := "Spinal-ZHIHA",
    libraryDependencies ++= Seq(spinalCore, spinalLib, spinalIdslPlugin,breeze,scalactic,scalatest),
    Compile / unmanagedSourceDirectories += baseDirectory.value / "tools" / "crypto" / "crypto" / "src" / "main" / "scala",
    Compile / unmanagedSourceDirectories += baseDirectory.value / "src" / "test" / "scala",
    Compile / unmanagedSourceDirectories += baseDirectory.value / "tools" / "sigmadelta" / "src" / "main" / "scala",
  )

fork := true

