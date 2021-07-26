load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_imgui:load_imgui.bzl", "load_imgui")
load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv:load_opencv.bzl", "load_opencv")
load("@wpi_bazel_deps//third_party/com_ni_libraries:load_ni_libraries.bzl", "load_ni")

def allwpilib_version_conf_from_maven_impl(repository_ctx):
    build_file = Label("@wpi_bazel_deps//allwpilib/from_maven/maven_2021_3_1:BUILD")
    repo_file = Label("@wpi_bazel_deps//allwpilib/from_maven/maven_2021_3_1:repo.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "repo.bzl")

def __load_third_party(opencv_version, imgui_version, ni_version):
    load_opencv(version = opencv_version)
    load_imgui(version = imgui_version)
    load_ni(version = ni_version)

allwpilib_version_conf_from_maven = repository_rule(
    implementation = allwpilib_version_conf_from_maven_impl,
    configure = True,
    attrs = {
        "version": attr.string(mandatory = True),
    },
)

def load_allwpilib_from_maven(version):
    if version == "2021.3.1":
        __load_third_party(opencv_version = "3.4.7-5", imgui_version = "1.79-1", ni_version = "2020.10.1")
    else:
        fail("Unsupported Version")

    allwpilib_version_conf_from_maven(name = "local_allwpilib", version = version)
