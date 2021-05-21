def ni_version_conf_impl(repository_ctx):
    version = str(repository_ctx.attr.version)
    flattened_version = "v" + version.replace(".", "_")

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/com_ni_libraries/" + flattened_version + ":BUILD.bazel")),
        "BUILD.bazel",
    )

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/com_ni_libraries/" + flattened_version + ":repo.bzl")),
        "repo.bzl",
    )

ni_version_conf = repository_rule(
    implementation = ni_version_conf_impl,
    configure = True,
    attrs = {
        "version": attr.string(mandatory = True),
    },
)

def load_ni(version):
    ni_version_conf(name = "local_ni", version = version)
