load("@local_opencv//:repo.bzl", "third_party_opencv", "third_party_opencv_java_version")
load("@local_imgui//:repo.bzl", "third_party_imgui")

def third_party_allwpilib():
    third_party_opencv()
    third_party_imgui()

    return __third_party_allwpilib_java()

def __third_party_allwpilib_java():
    artifacts = [third_party_opencv_java_version(), "org.ejml:ejml-simple:0.38"]
    return artifacts, ["https://frcmaven.wpi.edu/artifactory/release/"]
