load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")

def third_party_ni_libraries():
    wpilib_native_dependency(
        "chipobject",
        "2020.10.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        "3ea073ce8cbd7a117fc944073c8ef0d1a49f356a7ac87f6beaf33a50a581abe9",
        [("linuxathena", "a676bb94039ba222de4d7888ac1c1dae54125b99e1a04b1ac20770e9e7699e5a")],
        prefix="ni-",
    )

    wpilib_native_dependency(
        "netcomm",
        "2020.10.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        "f4693644d9bc0e481e42a3f46cc781a5658e1e68085014bc38fbb626b8094ec8",
        [("linuxathena", "9a425f85a64126bbca7154beb49241a31e7aa6aba3a6f04f9c897b1385579053")],
        prefix="ni-",
    )

    wpilib_native_dependency(
        "visa",
        "2020.10.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        "909927c9b68fbc6c0955596e1faf6addf47a95675f1e881dee1fadce4436723c",
        [("linuxathena", "946aef5696c352054e4c06d3b94c647047fd9879af34b39cd7713601ef511361")],
        prefix="ni-",
    )

    wpilib_native_dependency(
        "runtime",
        "2020.10.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        None,
        [("linuxathena", "88fc73678ad6ccda60f7ccb4c66576e8e0be91b3fd3f6e238f097a931edd420a")],
        prefix="ni-",
    )
