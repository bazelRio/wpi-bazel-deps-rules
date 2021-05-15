load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")

def third_party_imgui():
    wpilib_native_dependency(
        "imgui",
        "1.82-1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2022",
        "cf7cc7a23285c9c450720d298ae6f398c9f2076563a17c4d921a5b352f3d3d4c",
        [
            ("windowsx86-64", None),
            ("linuxx86-64", "5559ff376ba2a7807b3c6a280a596f2cb34726aa260ed84772d4c95777566de8"),
            ("osxx86-64", None),
        ],
        static_only = True,
    )
