load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_imgui:load_imgui.bzl", "load_imgui")
load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv:load_opencv.bzl", "load_opencv")
load("@wpi_bazel_deps//third_party/com_ni_libraries:load_ni_libraries.bzl", "load_ni")

def allwpilib_version_conf_impl(repository_ctx):
    if repository_ctx.attr.build_from_source:
        build_file = Label("@wpi_bazel_deps//allwpilib/from_source:BUILD")
        repo_file = Label("@wpi_bazel_deps//allwpilib/from_source:repo.bzl")
    else:
        build_file = Label("@wpi_bazel_deps//allwpilib/from_maven/maven_2021_3_1:BUILD")
        repo_file = Label("@wpi_bazel_deps//allwpilib/from_maven/maven_2021_3_1:repo.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "repo.bzl")

allwpilib_version_conf = repository_rule(
    implementation = allwpilib_version_conf_impl,
    configure = True,
    attrs = {
        "build_from_source": attr.bool(mandatory = True),
    },
)

def load_allwpilib(build_from_source, year, local_repository_location = None):
    if build_from_source:
        if local_repository_location:
            native.local_repository(
                name = "allwpilib",
                path = local_repository_location,
            )

    allwpilib_version_conf(name = "local_allwpilib", build_from_source = build_from_source)
    load_opencv(version="3.4.7-5" if year == 2021 else "4.5.2-1")
    load_imgui(version="1.79-1" if year == 2021 else "1.82-1")
    load_ni("2020.10.1")
