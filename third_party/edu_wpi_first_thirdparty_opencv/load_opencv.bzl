load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")
#load("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv:repo2021.bzl", "third_party_opencv_2021", "third_party_opencv_java_version_2021")

def opencv_version_conf_impl(repository_ctx):
    year = str(repository_ctx.attr.year)

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv/" + year + ":BUILD.bazel")),
        "BUILD.bazel",
    )

    repository_ctx.symlink(
        repository_ctx.path(Label("@wpi_bazel_deps//third_party/edu_wpi_first_thirdparty_opencv/" + year + ":repo.bzl")),
        "repo.bzl",
    )

opencv_version_conf = repository_rule(
    implementation = opencv_version_conf_impl,
    configure = True,
    attrs = {
        "year": attr.int(mandatory = True),
    },
)

def load_opencv(year):
    opencv_version_conf(name = "local_opencv", year = year)
