load("@rules_java//java:defs.bzl", "java_library")
load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "make_cpp_alias", "make_jni_alias")
load("@wpi_bazel_rules//rules:cc.bzl", "wpilib_cc_library")

package(default_visibility = ["//visibility:public"])

make_cpp_alias(name = "allwpilib-wpimath-cpp")

make_cpp_alias(name = "allwpilib-wpiutil-cpp")

make_cpp_alias(name = "allwpilib-ntcore-cpp")

make_cpp_alias(name = "allwpilib-cscore-cpp")

make_cpp_alias(name = "allwpilib-hal-cpp")

make_cpp_alias(name = "allwpilib-wpigui-cpp")

make_cpp_alias(name = "allwpilib-libglass")

make_cpp_alias(name = "allwpilib-libglassnt")

make_cpp_alias(name = "allwpilib-wpilibc-cpp")

make_cpp_alias(name = "allwpilib-wpilibNewCommands-cpp")

make_cpp_alias(name = "allwpilib-wpilibOldCommands-cpp")

make_cpp_alias(name = "allwpilib-halsim_gui")

make_cpp_alias(name = "allwpilib-halsim_ws_client")

make_cpp_alias(name = "allwpilib-halsim_ws_server")

make_cpp_alias(name = "allwpilib-halsim_ds_socket")

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

alias(
    name = "wpilibOldCommands-java",
    actual = "@maven//:edu_wpi_first_wpilibOldCommands_wpilibOldCommands_java",
)

make_jni_alias(name = "allwpilib-java-native__edu_wpi_first_wpimath__wpimath_cpp")

make_jni_alias(name = "allwpilib-java-native__edu_wpi_first_wpiutil__wpiutil_cpp")

make_jni_alias(name = "allwpilib-java-native__edu_wpi_first_ntcore__ntcore_cpp")

make_jni_alias(name = "allwpilib-java-native__edu_wpi_first_cscore__cscore_cpp")

make_jni_alias(name = "allwpilib-java-native__edu_wpi_first_hal__hal_cpp")


alias(
    name = "wpimathjni",
    actual = ":allwpilib-java-native__edu_wpi_first_wpimath__wpimath_cpp-jni-lib",
)

alias(
    name = "wpiutiljni",
    actual = ":allwpilib-java-native__edu_wpi_first_wpiutil__wpiutil_cpp-jni-lib",
)

alias(
    name = "ntcorejni",
    actual = ":allwpilib-java-native__edu_wpi_first_ntcore__ntcore_cpp-jni-lib",
)

alias(
    name = "cscorejni",
    actual = ":allwpilib-java-native__edu_wpi_first_cscore__cscore_cpp-jni-lib",
)

alias(
    name = "haljni",
    actual = ":allwpilib-java-native__edu_wpi_first_hal__hal_cpp-jni-lib",
)

wpilib_cc_library(
    name = "wpimath-cpp",
    srcs = [
        ":allwpilib-wpimath-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-wpimath-cpp-headers//:headers",
        ":allwpilib-wpimath-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "wpiutil-cpp",
    srcs = [
        ":allwpilib-wpiutil-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-wpiutil-cpp-headers//:headers",
        ":allwpilib-wpiutil-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "ntcore-cpp",
    srcs = [
        ":allwpilib-ntcore-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-ntcore-cpp-headers//:headers",
        ":allwpilib-ntcore-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "cscore-cpp",
    srcs = [
        ":allwpilib-cscore-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-cscore-cpp-headers//:headers",
        ":allwpilib-cscore-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "hal-cpp",
    srcs = [
        ":allwpilib-hal-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-hal-cpp-headers//:headers",
        ":allwpilib-hal-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "wpilibc-cpp",
    srcs = [
        ":allwpilib-wpilibc-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-wpilibc-cpp-headers//:headers",
        ":allwpilib-wpilibc-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "wpilibNewCommands-cpp",
    srcs = [
        ":allwpilib-wpilibNewCommands-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-wpilibNewCommands-cpp-headers//:headers",
        ":allwpilib-wpilibNewCommands-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "wpilibOldCommands-cpp",
    srcs = [
        ":allwpilib-wpilibOldCommands-cpp-shared-libs",
    ],
    raw_deps = [
        "@allwpilib-wpilibOldCommands-cpp-headers//:headers",
        ":allwpilib-wpilibOldCommands-cpp-libs",
    ],
    linkstatic=1,
)

wpilib_cc_library(
    name = "wpigui-cpp",
    raw_deps = [
        "@allwpilib-wpigui-cpp-headers//:headers",
        ":allwpilib-wpigui-cpp-libs",
    ],
)

wpilib_cc_library(
    name = "libglass",
    raw_deps = [
        "@allwpilib-libglass-headers//:headers",
        ":allwpilib-libglass-libs",
    ],
)

wpilib_cc_library(
    name = "libglassnt",
    raw_deps = [
        "@allwpilib-libglassnt-headers//:headers",
        ":allwpilib-libglassnt-libs",
    ],
)


alias(
    name = "halsim_gui",
    actual = ":allwpilib-halsim_gui-shared-libs",
)

alias(
    name = "halsim_ws_client",
    actual = ":allwpilib-halsim_ws_client-shared-libs",
)

alias(
    name = "halsim_ws_server",
    actual = ":allwpilib-halsim_ws_server-shared-libs",
)

alias(
    name = "halsim_ds_socket",
    actual = ":allwpilib-halsim_ds_socket-shared-libs",
)

filegroup(
    name = "wpilibj-jni_deps",
    srcs = [
        ":cscorejni",
        ":haljni",
        ":ntcorejni",
        ":wpimathjni",
        ":wpiutiljni",
    ],
)

wpilib_cc_library(
    name = "wpilibc-deps",
    raw_deps = [
        ":wpimath-cpp",
        ":wpiutil-cpp",
        ":wpilibc-cpp",
        ":ntcore-cpp",
        ":cscore-cpp",
        ":hal-cpp",
    ],
)

java_library(
    name = "wpilibj-deps",
    exports = [
        ":cameraserver-java",
        ":cscore-java",
        ":ntcore-java",
        ":wpilibj-java",
        ":wpimath-java",
        ":wpiutil-java",
        ":hal-java",
    ],
)
