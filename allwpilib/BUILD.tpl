load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "make_cpp_alias", "make_jni_alias")
load("@wpi_bazel_rules//rules:cc.bzl", "wpilib_cc_library")

package(default_visibility = ["//visibility:public"])

{JAVA_ALIAS}
{JNI_ALIAS}
{CPP_ALIAS}
{HALSIM_ALIAS}

{ROBOT_PROJECT_DEPS}