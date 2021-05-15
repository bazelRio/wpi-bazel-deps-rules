load("//allwpilib:deps.bzl", "CPP_DEPS", "HALSIM_DEPS", "JAVA_DEPS", "JNI_DEPS")

def __get_or_default(dep, variable_name, default):
    if hasattr(dep, variable_name):
        return getattr(dep, variable_name)
    return default

def load_source_template():
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
    return ""

def __java_alias():
    contents = ""

    for java_dep in JAVA_DEPS:
        folder_name = java_dep.folder_name
        library_name = __get_or_default(java_dep, "source_library_name", folder_name)

        contents += """
alias(
    name = "{folder_name}-java",
    actual = "@allwpilib//{folder_name}:java",
)
        """.format(folder_name = folder_name, library_name = library_name)

    return contents

def __jni_deps():
    return ""

def __jni_alias():
    contents = ""

    jni_deps = []
    for jni_dep in JNI_DEPS:
        folder_name = jni_dep.folder_name
        library_name = __get_or_default(jni_dep, "source_library_name", folder_name)

        jni_deps.append("@allwpilib//" + folder_name + ":" + library_name)
        jni_deps.append("@allwpilib//" + folder_name + ":" + library_name + "jni")

        contents += """
#wpilib_cc_library(
#    name = "{library_name}jni",
#    wpi_shared_deps = [
#        "@allwpilib//{folder_name}:{library_name}jni",
#        "@allwpilib//{folder_name}:{library_name}",
#    ]
#)
filegroup(
    name = "{library_name}jni",
    srcs = [
        "@allwpilib//{folder_name}:{library_name}jni",
        "@allwpilib//{folder_name}:{library_name}",
    ]
)
""".format(library_name = library_name, folder_name = folder_name)

    return contents + """
filegroup(
    name = "wpilibj-jni_deps",
    srcs = {jni_deps},
)
""".format(jni_deps = jni_deps)

def __halsim_deps():
    return ""

def __halsim_alias():
    contents = ""
    for halsim_dep in HALSIM_DEPS:
        contents += """
alias(
    name = "{halsim_dep}",
    actual = "@allwpilib//simulation/{halsim_dep}:{halsim_dep}",
)
""".format(halsim_dep = halsim_dep)

    return contents

def __cpp_deps():
    return ""

def __cpp_alias():
    contents = ""

    for cpp_def in CPP_DEPS:
        parent_folder = cpp_def.parent_folder
        libname = cpp_def.library_name
        link_shared = cpp_def.link_shared
        source_target_name = __get_or_default(cpp_def, "source_target_name", libname)

        suffix = "-xxif" if link_shared else ""
        contents += """
alias(
    name = "{libname}-cpp",
    actual = "@allwpilib//{parent_folder}:{source_target_name}{suffix}",
)
        """.format(libname = libname, suffix = suffix, parent_folder = parent_folder, source_target_name = source_target_name)

    return contents

def __robot_project_deps():
    contents = ""

    contents = """
wpilib_cc_library(
    name = "wpilibc-deps",
    wpi_shared_deps = [
        "@allwpilib//wpimath:wpimath",
        "@allwpilib//wpiutil:wpiutil",
        "@allwpilib//wpilibc:wpilibc",
        "@allwpilib//ntcore:ntcore",
        "@allwpilib//hal:wpiHal",
        "@allwpilib//cscore:cscore",
        "@allwpilib//cameraserver:cameraserver",

        #":wpimath-cpp",
        #":wpiutil-cpp",
        #":wpilibc-cpp",
        #":ntcore-cpp",
        #":hal-cpp",
        #":cscore-cpp",
        #":hal-cpp",
        #":cameraserver",
    ],
)

java_library(
    name = "wpilibj-deps",
    exports = [
        "@allwpilib//wpilibj:java",
        "@allwpilib//wpimath:java",
#        "@allwpilib//wpiutil",
#        "@allwpilib//ntcore",
#        "@allwpilib//cscore",
#        "@allwpilib//hal",
#        "@allwpilib//cameraserver",
    ],
)
    """

    return contents
