load("@wpi_bazel_rules//rules:cc.bzl", "wpilib_cc_library", "wpilib_cc_test")
load("@wpi_bazel_rules//rules:halsim_binary.bzl", "wpilib_cc_halsim_binary")

def wpilibc_robot(
        name,
        non_wpi_deps = [],
        test_deps = [],
        halsim_projects_info = {}):
    wpilib_cc_library(
        name = "lib",
        srcs = native.glob(["src/main/cpp/**/*.cpp"]),
        hdrs = native.glob(["src/main/include/**/*.h"]),
        strip_include_prefix = "src/main/include",
        raw_deps = non_wpi_deps + [
            "@local_allwpilib//:wpilibc-deps",
        ],
    )

    test_srcs = native.glob(["src/test/cpp/**/*.cpp"])
    print(name, test_srcs)
    if test_srcs:
        wpilib_cc_test(
            name = "test",
            srcs = test_srcs,
            raw_deps = [
                ":lib",
            ],
        )

    for name, halsim_deps in halsim_projects_info.items():
        wpilib_cc_halsim_binary(
            name = name,
            halsim_deps = halsim_deps,
            raw_deps = [":lib"],
        )
