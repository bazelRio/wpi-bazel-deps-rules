load("@rules_java//java:defs.bzl", "java_library")
load("@wpi_bazel_rules//rules:java.bzl", "wpilib_java_binary", "wpilib_junit5_test")
load("@wpi_bazel_rules//rules:halsim_binary.bzl", "wpilib_java_halsim_binary")

def wpilibj_robot(
        name,
        non_wpi_deps = [],
        non_wpi_raw_jni_deps = [],
        data = [],
        test_deps = [],
        main_class = None,
        test_package = "edu",
        halsim_projects_info = {}):
    java_library(
        name = "lib",
        srcs = native.glob(["src/main/java/**/*.java"]),
        deps = non_wpi_deps + [
            "@local_allwpilib//:wpilibj-deps",
        ],
        runtime_deps = ["@maven//:org_ejml_ejml_simple"],
        visibility = ["//visibility:public"],
    )

    wpilib_java_binary(
        name = name,
        main_class = main_class,
        data = data,
        runtime_deps = [
            ":lib",
        ],
        raw_jni_deps = non_wpi_raw_jni_deps + [
            "@local_opencv//:opencv-cpp-shared-libs",
        ],
        wpi_shared_deps = [
            "@local_allwpilib//:wpilibj-jni_deps",
        ],
    )

    test_files = native.glob(["src/test/java/**/*.java"])
    if test_files:
        wpilib_junit5_test(
            name = name + "-test",
            srcs = native.glob(["src/test/java/**/*.java"]),
            deps = test_deps + [
                ":lib",
            ],
            raw_jni_deps = non_wpi_raw_jni_deps + [
                "@local_opencv//:opencv-cpp-shared-libs",
            ],
            wpi_shared_deps = ["@local_allwpilib//:wpilibj-jni_deps"],
            package = test_package,
        )

    for name, halsim_deps in halsim_projects_info.items():
        wpilib_java_halsim_binary(
            name = name,
            halsim_deps = halsim_deps,
            raw_jni_deps = non_wpi_raw_jni_deps + [
                "@local_opencv//:opencv-cpp-shared-libs",
            ],
            wpi_shared_deps = ["@local_allwpilib//:wpilibj-jni_deps"],
            runtime_deps = [":lib"],
            main_class = main_class,
            visibility = ["//visibility:public"],
        )
