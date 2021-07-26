load("@shuffleboard//bazel_dependencies:maven_dependencies.bzl", "get_shuffleboard_maven_deps", "setup_shuffleboard_manual_maven_deps")
load("@wpi_bazel_deps//third_party:org_openjfx_javafx.bzl", "get_javafx_maven_deps")

def third_party_shuffleboard():
    setup_shuffleboard_manual_maven_deps()

    artifacts = get_shuffleboard_maven_deps()
    artifacts += get_javafx_maven_deps()

    return artifacts, []
