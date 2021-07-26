load("@wpi_bazel_deps//third_party:org_openjfx_javafx.bzl", "get_javafx_maven_deps")
load("@pathweaver//bazel_dependencies:maven_dependencies.bzl", "get_pathweaver_maven_deps")
load("@wpi_bazel_deps//third_party:com_fasterxml_jackson_core.bzl", "get_fasterxml_maven_deps")

def third_party_pathweaver():
    artifacts = []
    artifacts += get_pathweaver_maven_deps()
    artifacts += get_fasterxml_maven_deps()
    artifacts += get_javafx_maven_deps()

    return artifacts, []
