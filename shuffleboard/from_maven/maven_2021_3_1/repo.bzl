load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")
load("@wpi_bazel_deps//third_party:org_openjfx_javafx.bzl", "get_javafx_maven_deps")

def third_party_shuffleboard():
    print("Shuffleboard")

    jvm_maven_import_external(
        name = "shuffleboard_api",
        artifact = "edu.wpi.first.shuffleboard:api:2021.3.1",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )

    jvm_maven_import_external(
        name = "shuffleboard_app",
        artifact = "edu.wpi.first.shuffleboard:api:2021.3.1",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )

    maven_artifacts = []
    maven_artifacts += get_javafx_maven_deps()
    maven_artifacts += [
        "com.google.guava:guava:21.0",
        "org.fxmisc.easybind:easybind:1.0.3",
    ]

    return maven_artifacts, []
