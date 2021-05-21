load("@rules_java//java:defs.bzl", "java_library")
load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "make_cpp_alias", "make_jni_alias")
load("@wpi_bazel_rules//rules:cc.bzl", "wpilib_cc_library")

package(default_visibility = ["//visibility:public"])

make_cpp_alias(name = "wpimath-cpp")

make_cpp_alias(name = "wpiutil-cpp")

make_cpp_alias(name = "ntcore-cpp")

make_cpp_alias(name = "cscore-cpp")

make_cpp_alias(name = "hal-cpp")

make_cpp_alias(name = "wpigui-cpp")

make_cpp_alias(name = "libglass")

make_cpp_alias(name = "libglassnt")

make_cpp_alias(name = "wpilibc-cpp")

make_cpp_alias(name = "halsim_gui")

make_cpp_alias(name = "halsim_ws_client")

make_cpp_alias(name = "halsim_ws_server")

make_cpp_alias(name = "halsim_ds_socket")

make_cpp_alias(name = "wpilibNewCommands-cpp")

make_cpp_alias(name = "wpilibOldCommands-cpp")

alias(
    name = "wpimath-java",
    actual = "@maven//:edu_wpi_first_wpimath_wpimath_java",
)

alias(
    name = "wpiutil-java",
    actual = "@maven//:edu_wpi_first_wpiutil_wpiutil_java",
)

alias(
    name = "ntcore-java",
    actual = "@maven//:edu_wpi_first_ntcore_ntcore_java",
)

alias(
    name = "cscore-java",
    actual = "@maven//:edu_wpi_first_cscore_cscore_java",
)

alias(
    name = "hal-java",
    actual = "@maven//:edu_wpi_first_hal_hal_java",
)

alias(
    name = "wpilibj-java",
    actual = "@maven//:edu_wpi_first_wpilibj_wpilibj_java",
)

alias(
    name = "cameraserver-java",
    actual = "@maven//:edu_wpi_first_cameraserver_cameraserver_java",
)

alias(
    name = "wpilibNewCommands-java",
    actual = "@maven//:edu_wpi_first_wpilibNewCommands_wpilibNewCommands_java",
)

make_jni_alias(name = "wpi_native__edu_wpi_first_ntcore__ntcore_cpp")

make_jni_alias(name = "wpi_native__edu_wpi_first_cscore__cscore_cpp")

make_jni_alias(name = "wpi_native__edu_wpi_first_wpimath__wpimath_cpp")

make_jni_alias(name = "wpi_native__edu_wpi_first_wpiutil__wpiutil_cpp")

make_jni_alias(name = "wpi_native__edu_wpi_first_hal__hal_cpp")

alias(
    name = "ntcorejni",
    actual = ":wpi_native__edu_wpi_first_ntcore__ntcore_cpp-jni-lib",
)

alias(
    name = "cscorejni",
    actual = ":wpi_native__edu_wpi_first_cscore__cscore_cpp-jni-lib",
)

alias(
    name = "wpimathjni",
    actual = ":wpi_native__edu_wpi_first_wpimath__wpimath_cpp-jni-lib",
)

alias(
    name = "wpiutiljni",
    actual = ":wpi_native__edu_wpi_first_wpiutil__wpiutil_cpp-jni-lib",
)

alias(
    name = "haljni",
    actual = ":wpi_native__edu_wpi_first_hal__hal_cpp-jni-lib",
)

filegroup(
    name = "wpilibj-jni_deps",
    srcs = [
        ":cscore-jni",
        ":hal-jni",
        ":ntcore-jni",
        ":wpimath-jni",
        ":wpiutil-jni",
    ],
)

wpilib_cc_library(
    name = "wpimath-cpp",
    raw_deps = [
        "@wpimath-cpp-headers//:headers",
        ":wpimath-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "wpilibNewCommands-cpp",
    raw_deps = [
        "@wpilibNewCommands-cpp-headers//:headers",
        ":wpilibNewCommands-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "wpilibOldCommands-cpp",
    raw_deps = [
        "@wpilibOldCommands-cpp-headers//:headers",
        ":wpilibOldCommands-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "wpiutil-cpp",
    raw_deps = [
        "@wpiutil-cpp-headers//:headers",
        ":wpiutil-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "ntcore-cpp",
    raw_deps = [
        "@ntcore-cpp-headers//:headers",
        ":ntcore-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "wpigui-cpp",
    raw_deps = [
        "@wpigui-cpp-headers//:headers",
        ":wpigui-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "libglass",
    raw_deps = [
        "@libglass-headers//:headers",
        ":libglass-libs",
    ],
)

wpilib_cc_library(
    name = "libglassnt",
    raw_deps = [
        "@libglassnt-headers//:headers",
        ":libglassnt-libs",
    ],
)

wpilib_cc_library(
    name = "wpilibc-cpp",
    raw_deps = [
        "@wpilibc-cpp-headers//:headers",
        ":wpilibc-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "hal-cpp",
    raw_deps = [
        "@hal-cpp-headers//:headers",
        ":hal-cpp-libs",
    ],
)

alias(
    name = "halsim_gui",
    actual = ":halsim_gui-shared-libs",
)

alias(
    name = "halsim_ws_client",
    actual = ":halsim_ws_client-shared-libs",
)

alias(
    name = "halsim_ws_server",
    actual = ":halsim_ws_server-shared-libs",
)

alias(
    name = "halsim_ds_socket",
    actual = ":halsim_ds_socket-shared-libs",
)

wpilib_cc_library(
    name = "wpilibc-deps",
    raw_deps = [
        ":wpimath-cpp",
        ":wpiutil-cpp",
        ":wpilibc-cpp",
        ":ntcore-cpp",
        ":hal-cpp",
    ],
)

java_library(
    name = "wpilibj-deps",
    exports = [
        "@maven//:edu_wpi_first_cameraserver_cameraserver_java",
        "@maven//:edu_wpi_first_cscore_cscore_java",
        "@maven//:edu_wpi_first_ntcore_ntcore_java",
        "@maven//:edu_wpi_first_wpilibj_wpilibj_java",
        "@maven//:edu_wpi_first_wpimath_wpimath_java",
        "@maven//:edu_wpi_first_wpiutil_wpiutil_java",
    ],
)
