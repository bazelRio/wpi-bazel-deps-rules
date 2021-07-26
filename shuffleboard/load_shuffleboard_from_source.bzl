load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def shuffleboard_version_conf_impl(repository_ctx):
    build_file = Label("@wpi_bazel_deps//shuffleboard/from_source:BUILD.bazel")
    repo_file = Label("@wpi_bazel_deps//shuffleboard/from_source:repo.bzl")

    repository_ctx.symlink(repository_ctx.path(build_file), "BUILD.bazel")
    repository_ctx.symlink(repository_ctx.path(repo_file), "repo.bzl")

shuffleboard_version_conf = repository_rule(
    implementation = shuffleboard_version_conf_impl,
    configure = True,
)

def load_shuffleboard_from_source(local_repository_path = None, git_repository_args = None):
    if local_repository_path and git_repository_args:
        fail("Only one type of source repository can be used, local or a git remote ")

    if local_repository_path:
        print("Cloning...")
        native.local_repository(
            name = "shuffleboard",
            path = local_repository_path,
        )
    elif git_repository_args:
        git_repository(
            name = "shuffleboard",
            **git_repository_args
        )
    else:
        fail("You must specify an argument")

    shuffleboard_version_conf(name = "local_shuffleboard")
