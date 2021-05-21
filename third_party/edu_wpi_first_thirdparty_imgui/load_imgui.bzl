def imgui_version_conf_impl(repository_ctx):
    year = str(repository_ctx.attr.year)

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_imgui:BUILD.bazel")),
        "BUILD.bazel",
    )

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_imgui/" + year + ":repo.bzl")),
        "repo.bzl",
    )

imgui_version_conf = repository_rule(
    implementation = imgui_version_conf_impl,
    configure = True,
    attrs = {
        "year": attr.int(mandatory = True),
    },
)

def load_imgui(year):
    imgui_version_conf(name = "local_imgui", year = year)
