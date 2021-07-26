def pathweaver_version_conf_impl(repository_ctx):
    version = repository_ctx.attr.version

    supported_versions = ["2021.3.1"]

    if version not in supported_versions:
        fail("Unsupported version " + version)

    flattened_version = version.replace(".", "_")

    build_file = Label("@wpi_bazel_deps//pathweaver/from_maven/maven_" + flattened_version + ":BUILD.bazel")
    repo_file = Label("@wpi_bazel_deps//pathweaver/from_maven/maven_" + flattened_version + ":repo.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "repo.bzl")

pathweaver_version_conf = repository_rule(
    implementation = pathweaver_version_conf_impl,
    configure = True,
    attrs = {
        "version": attr.string(mandatory = True),
    },
)

def load_pathweaver_from_maven(version):
    pathweaver_version_conf(name = "local_pathweaver", version = version)
