load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency", "wpilib_java_vendor_library")
load("@local_opencv//:repo.bzl", "third_party_opencv_java_version")
load("@local_opencv//:repo.bzl", "third_party_opencv")
load("@local_imgui//:repo.bzl", "third_party_imgui")

def third_party_allwpilib():
    third_party_opencv()
    third_party_imgui()

    {CPP_DEPS}
    {HALSIM_DEPS}
    {JNI_DEPS}

def third_party_allwpilib_maven():
    return [third_party_opencv_java_version()] + ["org.ejml:ejml-simple:0.38", {JAVA_DEPS}]