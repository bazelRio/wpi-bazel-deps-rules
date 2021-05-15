def get_junit5_maven_deps(jupiter_version = "5.6.1", platform_version = "1.6.1"):
    artifacts = [
        "org.junit.jupiter:junit-jupiter-api:" + jupiter_version,
        "org.junit.jupiter:junit-jupiter-params:" + jupiter_version,
        "org.junit.jupiter:junit-jupiter-engine:" + jupiter_version,
        "org.junit.platform:junit-platform-commons:" + platform_version,
        "org.junit.platform:junit-platform-console:" + platform_version,
        "org.junit.platform:junit-platform-engine:" + platform_version,
        "org.junit.platform:junit-platform-launcher:" + platform_version,
        "org.junit.platform:junit-platform-suite-api:" + platform_version,
    ]

    return artifacts
