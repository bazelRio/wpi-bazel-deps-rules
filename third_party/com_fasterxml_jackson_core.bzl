def get_fasterxml_maven_deps(version = "2.10.0"):
    return [
        "com.fasterxml.jackson.core:jackson-annotations:" + version,
        "com.fasterxml.jackson.core:jackson-core:" + version,
        "com.fasterxml.jackson.core:jackson-databind:" + version,
    ]
