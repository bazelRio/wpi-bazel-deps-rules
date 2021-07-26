load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def third_party_pathweaver():
    jvm_maven_import_external(
        name = "pathweaver_app",
        artifact = "edu.wpi.first:pathweaver:2021.3.1",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )

    return [], []
