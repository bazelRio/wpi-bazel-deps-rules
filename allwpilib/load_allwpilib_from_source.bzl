load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_imgui:load_imgui.bzl", "load_imgui")
load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv:load_opencv.bzl", "load_opencv")
load("@wpi_bazel_deps//third_party/com_ni_libraries:load_ni_libraries.bzl", "load_ni")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def allwpilib_version_conf_from_source_impl(repository_ctx):
    build_file = Label("@wpi_bazel_deps//allwpilib/from_source:BUILD")
    repo_file = Label("@wpi_bazel_deps//allwpilib/from_source:repo.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "repo.bzl")

def __load_third_party(opencv_version, imgui_version, ni_version):
    load_opencv(version = opencv_version)
    load_imgui(version = imgui_version)
    load_ni(version = ni_version)

allwpilib_version_conf_from_source = repository_rule(
    implementation = allwpilib_version_conf_from_source_impl,
    configure = True,
)

def load_allwpilib_from_source(parent_version, local_repository_path = None, git_repository_args = None):
    if parent_version == "2021.3.1":
        __load_third_party(opencv_version = "3.4.7-5", imgui_version = "1.79-1", ni_version = "2020.10.1")
    else:
        fail("Unknown parent version")

    if local_repository_path and git_repository_args:
        fail("Only one type of source repository can be used, local or a git remote ")

    if local_repository_path:
        native.local_repository(
            name = "allwpilib",
            path = local_repository_path,
        )
    elif git_repository_args:
        git_repository(
            name = "allwpilib",
            **git_repository_args
        )
    else:
        fail("You must specify an argument")

    allwpilib_version_conf_from_source(name = "local_allwpilib")
