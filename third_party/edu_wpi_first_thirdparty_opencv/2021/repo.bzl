load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")

__YEAR = "2021"
__OPENCV_VERSION = "3.4.7-5"

def third_party_opencv():
    wpilib_native_dependency(
        "opencv-cpp",
        __OPENCV_VERSION,
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc" + __YEAR + "/opencv",
        "48852219062e2f9f4b348996d4e23bda3cad6a777a97ee9efa33031115780c44",
        [
            ("linuxx86-64", "b4f80e276e12b940f450740cd05c3c9c0e6e879153660b3ef1c3297af7dad12f"),
            ("osxx86-64", "bf6321427b66a31f4330398e7cfd9a78209fd769ac898dd8264f914561c023f8"),
            ("windowsx86-64", "d8723747f4d5a69c693951ec6cf0fb649f8a644786783b936bc15148cceebb38"),
            ("linuxathena", None),
            ("linuxraspbiandebug", None),
            ("linuxaarch64bionic", None),
        ],
        shared_lib_srcs = 'glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/libopencv_java347.dylib"])',
    )

def third_party_opencv_java_version():
    return "edu.wpi.first.thirdparty.frc" + __YEAR + ".opencv:opencv-java:" + __OPENCV_VERSION
