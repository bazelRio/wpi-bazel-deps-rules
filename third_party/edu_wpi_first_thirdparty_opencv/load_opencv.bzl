def opencv_version_conf_impl(repository_ctx):
    version = str(repository_ctx.attr.version)
    flattened_version = "v" + version.replace(".", "_").replace("-", "_")

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv/" + flattened_version + ":BUILD.bazel")),
        "BUILD.bazel",
    )

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv/" + flattened_version + ":repo.bzl")),
        "repo.bzl",
    )

opencv_version_conf = repository_rule(
    implementation = opencv_version_conf_impl,
    configure = True,
    attrs = {
        "version": attr.string(mandatory = True),
    },
)

def load_opencv(version):
    opencv_version_conf(name = "local_opencv", version = version)
