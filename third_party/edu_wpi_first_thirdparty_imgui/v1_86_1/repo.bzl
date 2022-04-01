load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")

def third_party_imgui():
    wpilib_native_dependency(
        "imgui",
        "1.86-1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/thirdparty/frc2022",
        "5ebdb86a9730ce908d3cfdaa5058ab001e7fa5e5b40b108dcc2b5f31f32cd883",
        [
            ("windowsx86-64", "3106891bc46a3782d5855434dc793e37983a664fa350b5d98c472caf8b21d1b0"),
            ("linuxx86-64", "aad7696e6eadd4a528bed804a95a7890c9bb887061e5f423b97dbbeb2d0a3ec7"),
            ("osxx86-64", "a0bce7524906b9655c5eacda35040c3093dfb30ee776a2e538b71c42dbf4bcf5"),
        ],
        static_only=True,
    )
