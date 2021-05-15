CPP_DEPS = [
    struct(parent_folder = "wpimath", library_name = "wpimath", maven_has_cpp_suffix = True, link_shared = True),
    struct(parent_folder = "wpiutil", library_name = "wpiutil", maven_has_cpp_suffix = True, link_shared = True),
    struct(parent_folder = "ntcore", library_name = "ntcore", maven_has_cpp_suffix = True, link_shared = True),
    struct(parent_folder = "wpigui", library_name = "wpigui", maven_has_cpp_suffix = True, link_shared = False, static_only = True),
    struct(parent_folder = "glass", library_name = "libglass", maven_has_cpp_suffix = False, link_shared = False, static_only = True),
    struct(parent_folder = "glass", library_name = "libglassnt", maven_has_cpp_suffix = False, link_shared = False, static_only = True),
    struct(parent_folder = "wpilibc", library_name = "wpilibc", maven_has_cpp_suffix = True, link_shared = False),
    struct(parent_folder = "hal", library_name = "hal", maven_has_cpp_suffix = True, link_shared = True, source_target_name = "wpiHal"),
]

HALSIM_DEPS = [
    "halsim_gui",
    "halsim_ws_client",
    "halsim_ws_server",
    "halsim_ds_socket",
]

JNI_DEPS = [
    struct(folder_name = "ntcore"),
    struct(folder_name = "cscore"),
    struct(folder_name = "wpimath"),
    struct(folder_name = "wpiutil"),
    struct(folder_name = "hal", source_library_name = "wpiHal"),
]

JAVA_DEPS = [
    struct(folder_name = "hal", source_library_name = "wpiHal"),
    struct(folder_name = "wpilibj"),
    struct(folder_name = "wpimath"),
    struct(folder_name = "wpiutil"),
    struct(folder_name = "cscore"),
    struct(folder_name = "ntcore"),
    struct(folder_name = "cameraserver"),
    struct(folder_name = "wpilibNewCommands"),
]
