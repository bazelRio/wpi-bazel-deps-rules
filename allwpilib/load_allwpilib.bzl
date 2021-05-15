load("//allwpilib/from_maven:load_template.bzl", "load_maven_template")
load("//allwpilib/from_source:load_template.bzl", "load_source_template")
load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_imgui:load_imgui.bzl", "load_imgui")
load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv:load_opencv.bzl", "load_opencv")

def allwpilib_version_conf_impl(repository_ctx):
    #    subfolder = "from_source" if repository_ctx.attr.build_from_source else "from_maven"

    if repository_ctx.attr.build_from_source:
        substitutions = load_source_template()
    else:
        substitutions = load_maven_template()

    repository_ctx.template(
        "BUILD.bazel",
        Label("@wpi_bazel_deps//allwpilib:BUILD.tpl"),
        substitutions = substitutions,
    )

    repository_ctx.template(
        "repo.bzl",
        Label("@wpi_bazel_deps//allwpilib:repo.tpl"),
        substitutions = substitutions,
    )

allwpilib_version_conf = repository_rule(
    implementation = allwpilib_version_conf_impl,
    configure = True,
    attrs = {
        "build_from_source": attr.bool(mandatory = True),
    },
)

def load_allwpilib(build_from_source, year):
    allwpilib_version_conf(name = "local_allwpilib", build_from_source = build_from_source)
    load_opencv(year)
    load_imgui(year)
