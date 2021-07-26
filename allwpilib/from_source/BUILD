load("@rules_java//java:defs.bzl", "java_library")
load("@wpi_bazel_rules//rules:cc.bzl", "wpilib_cc_library")

package(default_visibility = ["//visibility:public"])

alias(
    name = "hal-java",
    actual = "@allwpilib//hal:java",
)

alias(
    name = "wpilibj-java",
    actual = "@allwpilib//wpilibj:java",
)

alias(
    name = "wpimath-java",
    actual = "@allwpilib//wpimath:java",
)

alias(
    name = "wpiutil-java",
    actual = "@allwpilib//wpiutil:java",
)

alias(
    name = "cscore-java",
    actual = "@allwpilib//cscore:java",
)

alias(
    name = "ntcore-java",
    actual = "@allwpilib//ntcore:java",
)

alias(
    name = "cameraserver-java",
    actual = "@allwpilib//cameraserver:java",
)

alias(
    name = "wpilibNewCommands-java",
    actual = "@allwpilib//wpilibNewCommands:java",
)

#wpilib_cc_library(
#    name = "ntcorejni",
#    wpi_shared_deps = [
#        "@allwpilib//ntcore:ntcorejni",
#        "@allwpilib//ntcore:ntcore",
#    ]
#)
filegroup(
    name = "ntcorejni",
    srcs = [
        "@allwpilib//ntcore",
        "@allwpilib//ntcore:ntcorejni",
    ],
)

filegroup(
    name = "cscorejni",
    srcs = [
        "@allwpilib//cscore",
        "@allwpilib//cscore:cscorejni",
    ],
)

filegroup(
    name = "wpimathjni",
    srcs = [
        "@allwpilib//wpimath",
        "@allwpilib//wpimath:wpimathjni",
    ],
)

filegroup(
    name = "wpiutiljni",
    srcs = [
        "@allwpilib//wpiutil",
        "@allwpilib//wpiutil:wpiutiljni",
    ],
)

filegroup(
    name = "wpiHaljni",
    srcs = [
        "@allwpilib//hal:wpiHal",
        "@allwpilib//hal:wpiHaljni",
    ],
)

filegroup(
    name = "wpilibj-jni_deps",
    srcs = [
        "@allwpilib//cscore",
        "@allwpilib//cscore:cscorejni",
        "@allwpilib//hal:wpiHal",
        "@allwpilib//hal:wpiHaljni",
        "@allwpilib//ntcore",
        "@allwpilib//ntcore:ntcorejni",
        "@allwpilib//wpimath",
        "@allwpilib//wpimath:wpimathjni",
        "@allwpilib//wpiutil",
        "@allwpilib//wpiutil:wpiutiljni",
    ],
)

alias(
    name = "wpimath-cpp",
    actual = "@allwpilib//wpimath:wpimath-xxif",
)

alias(
    name = "wpiutil-cpp",
    actual = "@allwpilib//wpiutil:wpiutil-xxif",
)

alias(
    name = "ntcore-cpp",
    actual = "@allwpilib//ntcore:ntcore-xxif",
)

alias(
    name = "wpigui-cpp",
    actual = "@allwpilib//wpigui:wpigui",
)

alias(
    name = "libglass",
    actual = "@allwpilib//glass:libglass",
)

alias(
    name = "libglassnt",
    actual = "@allwpilib//glass:libglassnt",
)

alias(
    name = "wpilibc-cpp",
    actual = "@allwpilib//wpilibc:wpilibc",
)

alias(
    name = "wpilibNewCommands-cpp",
    actual = "@allwpilib//wpilibNewCommands:cpp",
)

alias(
    name = "wpilibOldCommands-cpp",
    actual = "@allwpilib//wpilibOldCommands:cpp",
)

alias(
    name = "hal-cpp",
    actual = "@allwpilib//hal:wpiHal-xxif",
)

alias(
    name = "halsim_gui",
    actual = "@allwpilib//simulation/halsim_gui:halsim_gui",
)

alias(
    name = "halsim_ws_client",
    actual = "@allwpilib//simulation/halsim_ws_client:halsim_ws_client",
)

alias(
    name = "halsim_ws_server",
    actual = "@allwpilib//simulation/halsim_ws_server:halsim_ws_server",
)

alias(
    name = "halsim_ds_socket",
    actual = "@allwpilib//simulation/halsim_ds_socket:halsim_ds_socket",
)

wpilib_cc_library(
    name = "wpilibc-deps",
    raw_deps = [
        "@allwpilib//cameraserver:cpp",
    ],
    wpi_shared_deps = [
        "@allwpilib//wpimath:wpimath",
        "@allwpilib//wpiutil:wpiutil",
        "@allwpilib//wpilibc:wpilibc",
        "@allwpilib//ntcore:ntcore",
        "@allwpilib//hal:wpiHal",
        "@allwpilib//cscore:cscore",
    ],
)

java_library(
    name = "wpilibj-deps",
    exports = [
        "@allwpilib//cameraserver:java",
        "@allwpilib//cscore:java",
        "@allwpilib//hal:java",
        "@allwpilib//ntcore:java",
        "@allwpilib//wpilibj:java",
        "@allwpilib//wpimath:java",
        "@allwpilib//wpiutil:java",
    ],
)
