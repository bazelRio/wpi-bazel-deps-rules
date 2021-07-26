load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")
load("@bazel_tools//tools/build_defs/repo:jvm.bzl", "jvm_maven_import_external")

def third_party_opencv():
    wpilib_native_dependency(
        "opencv-cpp",
        "4.5.2-1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2022/opencv",
        "cae9b4b5e31c15e9f7f0223b5ed7cc8c13dc3f4135c9002e8e73c7b7bf2fcf30",
        [
            ("windowsx86-64", "583bd691a28ad689f98ac9633c1e0a93847d66b3b31f310edf0f4615ac79b9dc"),
            ("linuxx86-64", "f036f133d849dffed867b1ca235be85152ec25f3ec56fd412693390840fa5009"),
            ("osxx86-64", "b0edd2df6dad473983d92fa0ea65aa8497a98f1ccbe04ab758c6910a1cda9958"),
            ("linuxathena", "92edb18cc8fb9872c6b2dd83f7c4b3fdb8353ab1807d1202b120063ec338f39a"),
            ("linuxraspbian", "17c9cfcccf2599137adb0b1973d28580d102f55f21a4bc3f8c9673c2e4b3f3a6"),
            ("linuxaarch64bionic", "9baf066738417fd31700b80d3ec586715888ccf36723d67f2ac6418be5c3f28c"),
        ],
        shared_lib_srcs = 'glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/libopencv_java452.dylib"])',
    )

    jvm_maven_import_external(
        name = "opencv-java",
        artifact = "edu.wpi.first.thirdparty.frc2022.opencv:opencv-java:4.5.2-1",
        server_urls = ["https://frcmaven.wpi.edu/artifactory/release"],
    )
