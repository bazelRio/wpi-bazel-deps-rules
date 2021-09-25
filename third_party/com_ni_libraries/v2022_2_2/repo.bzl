load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency")

def third_party_ni_libraries():
    wpilib_native_dependency(
        "chipobject",
        "2022.2.2",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        "f99ac43ba7b85489a2f0ff8faf6619c65bdfbb10df696902a0c2f43533c78907",
        [
            ("linuxathena", "e4adaf5badfd370a03c1309eb6812e9016d166f4c258357ed62e0c86a2da15ab"),
        ],
        prefix = "ni-",
    )

    wpilib_native_dependency(
        "netcomm",
        "2022.2.2",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        "5b8a2f44eadec05619a3961dbba9c38f8cd5076e7c82076aadb4d05fe0745ea5",
        [
            ("linuxathena", "ae5e21bcda2947d8b35a8cee0db2d63d966a0efca65f73e7b3f8b2616d338854"),
        ],
        prefix = "ni-",
    )

    wpilib_native_dependency(
        "visa",
        "2022.2.2",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        "ace624fbd66dfb56a9014a17d4877cae98391c2b14f5d5a1fb489130ea5cb82e",
        [
            ("linuxathena", "d513bb717181031874d96e1f2b7bff4d850292038469e6a510448f6b055d7d5d"),
        ],
        prefix = "ni-",
    )

    wpilib_native_dependency(
        "runtime",
        "2022.2.2",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ni-libraries",
        None,
        [
            ("linuxathena", "cdfae245d31b527a709a25fcc5d89bb47875d512989aa147fc002dabacb263d7"),
        ],
        prefix = "ni-",
    )
