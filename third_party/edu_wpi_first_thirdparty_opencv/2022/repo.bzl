load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")

__YEAR = "2022"
__OPENCV_VERSION = "4.5.2-1"

def third_party_opencv():
    wpilib_native_dependency(
        "opencv-cpp",
        __OPENCV_VERSION,
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc" + __YEAR + "/opencv",
        "cae9b4b5e31c15e9f7f0223b5ed7cc8c13dc3f4135c9002e8e73c7b7bf2fcf30",
        [
            ("linuxx86-64", None),
            ("osxx86-64", None),
            ("windowsx86-64", None),
        ],
        shared_lib_srcs = 'glob(["**/*.dll", "**/*.so*", "**/*.dylib"], exclude=["**/libopencv_java347.dylib"])',
    )

def third_party_opencv_java_version():
    return "edu.wpi.first.thirdparty.frc" + __YEAR + ".opencv:opencv-java:" + __OPENCV_VERSION
