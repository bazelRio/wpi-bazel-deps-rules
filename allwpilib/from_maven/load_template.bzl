load("//allwpilib:deps.bzl", "CPP_DEPS", "HALSIM_DEPS", "JAVA_DEPS", "JNI_DEPS")

__VERSION = "2021.3.1"

def __get_or_default(dep, variable_name, default):
    if hasattr(dep, variable_name):
        return getattr(dep, variable_name)
    return default

def load_maven_template():
    substitutions = {
        "{CPP_DEPS}": __cpp_deps(),
        "{CPP_ALIAS}": __cpp_alias(),
        "{HALSIM_DEPS}": __halsim_deps(),
        "{HALSIM_ALIAS}": __halsim_alias(),
        "{ROBOT_PROJECT_DEPS}": __robot_project_deps(),
        "{JAVA_DEPS}": __java_deps(),
        "{JAVA_ALIAS}": __java_alias(),
        "{JNI_DEPS}": __jni_deps(),
        "{JNI_ALIAS}": __jni_alias(),
    }

    return substitutions

def __java_deps():
    contents = ""
    maven_deps = []
    for java_dep in JAVA_DEPS:
        folder_name = java_dep.folder_name
        contents += '"edu.wpi.first.{folder_name}:{folder_name}-java:{version}",\n'.format(folder_name = folder_name, version = __VERSION)

    return contents

def __java_alias():
    contents = ""

    for java_dep in JAVA_DEPS:
        folder_name = java_dep.folder_name
        library_name = __get_or_default(java_dep, "source_library_name", folder_name)

        contents += """
alias(
    name = "{folder_name}-java",
    actual = "@maven//:edu_wpi_first_{folder_name}_{folder_name}_java",
)
        """.format(folder_name = folder_name, library_name = library_name)

    return contents

def __jni_deps():
    contents = """

    wpilib_java_vendor_library(
        vendor_name = "wpi_native",
        url = "https://frcmaven.wpi.edu/artifactory/release/",
        version = "{version}",
        java_deps = [],
        jni_deps = [
            ("edu.wpi.first.hal", "hal-cpp", "windowsx86-64", None),
            ("edu.wpi.first.wpimath", "wpimath-cpp", "windowsx86-64", None),
            ("edu.wpi.first.wpiutil", "wpiutil-cpp", "windowsx86-64", None),
            ("edu.wpi.first.ntcore", "ntcore-cpp", "windowsx86-64", None),
            ("edu.wpi.first.cscore", "cscore-cpp", "windowsx86-64", None),
        ])
""".format(version = __VERSION)

    return contents

def __jni_alias():
    jni_deps = []
    for jni_dep in JNI_DEPS:
        folder_name = jni_dep.folder_name
        library_name = __get_or_default(jni_dep, "source_library_name", folder_name)

        jni_deps.append("@wpi_native__edu_wpi_first_" + folder_name + "__" + folder_name + "_cpp//:shared_libs")

    return """
filegroup(
    name = "wpilibj-jni_deps",
    srcs = [{jni_deps}],
)
""".format(jni_deps = ",".join(['"' + x + '"' for x in jni_deps]))

def __halsim_deps():
    contents = ""

    for lib in HALSIM_DEPS:
        contents += """
    wpilib_native_dependency(
        "{lib}",
        "{version}",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/halsim/",
        None,
        [
            ("windowsx86-64", None),
            ("linuxx86-64", None),
            ("osxx86-64", None),
        ],
    )
""".format(lib = lib, version = __VERSION)

    return contents

def __halsim_alias():
    contents = ""

    for lib in HALSIM_DEPS:
        contents += """
make_cpp_alias("{lib}")
alias(
    name = "{lib}",
    actual = ":{lib}-shared-libs",
)
""".format(lib = lib)

    return contents

def __cpp_deps():
    contents = ""

    for cpp_def in CPP_DEPS:
        parent_folder = cpp_def.parent_folder
        libname = cpp_def.library_name
        has_cpp_suffix = cpp_def.maven_has_cpp_suffix
        static_only = False if not hasattr(cpp_def, "static_only") else cpp_def.static_only

        suffix = "-cpp" if has_cpp_suffix else ""
        subfolder = libname if parent_folder == libname else parent_folder
        contents += """
    wpilib_native_dependency(
        "{libname}{suffix}",
        "{version}",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/{subfolder}",
        None,
        [
            ("windowsx86-64", None),
        ],
        disable_sha = True,
        static_only = {static_only},
    )
""".format(
            version = __VERSION,
            libname = libname,
            suffix = suffix,
            subfolder = subfolder,
            static_only = str(static_only),
        )

    return contents

def __cpp_alias():
    contents = ""

    for cpp_def in CPP_DEPS:
        parent_folder = cpp_def.parent_folder
        libname = cpp_def.library_name
        has_cpp_suffix = cpp_def.maven_has_cpp_suffix

        suffix = "-cpp" if has_cpp_suffix else ""
        contents += """
make_cpp_alias("{libname}{suffix}")
wpilib_cc_library(
    name = "{libname}-cpp",
    raw_deps = [
        "@{libname}{suffix}-headers//:headers",
        ":{libname}{suffix}-libs"
    ],
)
        """.format(libname = libname, suffix = suffix, parent_folder = parent_folder)

    return contents

def __robot_project_deps():
    contents = """
java_library(
    name = "wpilibj-deps",
    exports = [
        "@maven//:edu_wpi_first_wpimath_wpimath_java",
        "@maven//:edu_wpi_first_wpiutil_wpiutil_java",
        "@maven//:edu_wpi_first_ntcore_ntcore_java",
        "@maven//:edu_wpi_first_cscore_cscore_java",
        "@maven//:edu_wpi_first_cameraserver_cameraserver_java",
    ],
)
"""

    return contents
