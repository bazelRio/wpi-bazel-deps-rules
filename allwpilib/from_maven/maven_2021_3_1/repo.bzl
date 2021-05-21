load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_java_vendor_library", "wpilib_native_dependency")
load("@local_opencv//:repo.bzl", "third_party_opencv", "third_party_opencv_java_version")
load("@local_imgui//:repo.bzl", "third_party_imgui")

def third_party_allwpilib():
    third_party_opencv()
    third_party_imgui()

    __third_party_allwpilib_native()

    return __third_party_allwpilib_java()

def __third_party_allwpilib_java():
    artifacts = [third_party_opencv_java_version(), "org.ejml:ejml-simple:0.38"] + [
        "edu.wpi.first.wpimath:wpimath-java:2021.3.1",
        "edu.wpi.first.wpiutil:wpiutil-java:2021.3.1",
        "edu.wpi.first.ntcore:ntcore-java:2021.3.1",
        "edu.wpi.first.cscore:cscore-java:2021.3.1",
        "edu.wpi.first.hal:hal-java:2021.3.1",
        "edu.wpi.first.wpilibj:wpilibj-java:2021.3.1",
        "edu.wpi.first.cameraserver:cameraserver-java:2021.3.1",
        "edu.wpi.first.wpilibNewCommands:wpilibNewCommands-java:2021.3.1",
    ]

    repositories = ["https://frcmaven.wpi.edu/artifactory/release"]

    return artifacts, repositories

def __third_party_allwpilib_native():
    wpilib_native_dependency(
        "wpimath-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpimath",
        "dac88ad40484aaa6721d190c23b33668fa11a86e32877458285c2ea678db54d3",
        [
            ("windowsx86-64", "2ec3dcf69a2b0500aea1d5037aa79912a252c5c7f8aefd113c974e1559d88cf9"),
            ("linuxx86-64", "d5edb77e3ed15df710c7895636190ee2f89e47429f2925e015bd7b0025af4612"),
            ("osxx86-64", "4d61ca32079050b825d5ee543a8293f52fb0cfca0d71d7c4bdd3f58cc689b73d"),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "wpiutil-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpiutil",
        "b2a96f7ce07198b139face9dc341c6550d5044fa32f48435b50d986ea5c8ee55",
        [
            ("windowsx86-64", "5e85e0a32ed520c1ea075087b3701769f2007fe8a9385831b1d947f70179cf8f"),
            ("linuxx86-64", "4a20ec638981025c0e41678ac7cea691d5a40121987b1309e6907255636d02cf"),
            ("osxx86-64", "09c7914e5fcf4b26967e0bddb501c79d054de276a5724a9089b0e04d9e13e640"),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "ntcore-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/ntcore",
        "2451d44dc2a3d16ee315738336b792642a7b8dd8c4aef0f6b7b0fb80c0a527d2",
        [
            ("windowsx86-64", "cd69aba9cc0b16fda738dcde53b1c8c138c616fd4af2e2de1877f66973fcc6d3"),
            ("linuxx86-64", "d6aedae1639db0fd538f7c519b97cf45441a6ec7c8220c3f564d7c3a7de71294"),
            ("osxx86-64", "8daf5d2b4cf3e16db6b3ad3a309aade6315b9458abeb40b94d59cbb21ddac087"),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "cscore-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/cscore",
        "4ff4560b32aaa664ca0869412c5ddd2bc2ed48ce9d9c771ece7a74c7df787e40",
        [
            ("windowsx86-64", "02f8bdc027ac0779f7a97f2ac0996cf4884600868564a6534edef4eed45cf426"),
            ("linuxx86-64", "457668d0e9833e96e25c3581b47d6855cecdf137f79f906cd8c104dba0415791"),
            ("osxx86-64", "e54461b678c838320304a28341c8031ff5d5d80cdd851cc525a1daa0f394cb1e"),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "hal-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/hal",
        "81b4d98d7ae4f92b2887180aea29ef1e780c5570e3fdbe08e02183e54952bd62",
        [
            ("windowsx86-64", "18d860d1be5dfcf104f9609f9bb2af666fda13e8d3608ef9b9e890b5c4c56785"),
            ("linuxx86-64", "48ca6f22deb800170c801944531557c8d109be4501418c719349519405ae6cc2"),
            ("osxx86-64", "46f76a6ba82f395e19ba48c12c56b1d864b03f46498a0f42b6a15fe12d3aaa6a"),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "wpigui-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpigui",
        "f89b492a3133858c5ef8e0b4d9f4aa19dc31ebc5bc1e7de9e8433b6b366d2bde",
        [
            ("windowsx86-64", "fdd794efbbb8f88873ef26f765c267db6c20a34da69cd1b2e6f497c5bfeb61a7"),
            ("linuxx86-64", "7f2ec9441a91f0e8d2909a2b26ef07e1fcc08be9d61538efe075331f5b4f0119"),
            ("osxx86-64", "f0eab427cf29ff3fd274c82269691e72a3955b041f70eaa848cd97eb7ec08b6a"),
        ],
        static_only = True,
    )

    wpilib_native_dependency(
        "libglass",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/glass",
        "e1f18caa10f34cbb24de8fd257fd2364247088f06bf07bc6d0b3e97ce49012d2",
        [
            ("windowsx86-64", "b1831b8a74f5f55c5717f6ffa5f0e628436de1429ff007bddaa6d1911a289442"),
            ("linuxx86-64", "2a9bb7268287ed74632a1ede063cbd9d63820e628804d6b70695f2bcb3d192e4"),
            ("osxx86-64", "2a6bfd7166693806ccf52d4c1da3a4e5095ecdb17567d30980d4bde29269b8ad"),
        ],
        static_only = True,
    )

    wpilib_native_dependency(
        "libglassnt",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/glass",
        "e4ee9cfbe3d93bc967a0d1e332776d262dd8e28f048cd21d79ea71d7f2f0fa89",
        [
            ("windowsx86-64", "6c6ab16b6f292e607dd3d6d1e42c9771322d183f47a5174660b96df899104326"),
            ("linuxx86-64", "3e47196214e2ffe262341598371b49d27b1966e0be6ee6a929d62c916eef0f12"),
            ("osxx86-64", "b479361616b5aa0dfc1797e9e52d4e9edab9060f0e3cee79dba22322cfa3c93e"),
        ],
        static_only = True,
    )

    wpilib_native_dependency(
        "wpilibc-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibc",
        "c1bb5ba16138be092c52664147d26b45347d68fdb086c483c7ca8f6383bcab87",
        [
            ("windowsx86-64", "b3f3e6d4958a8f4b72e49df6658f5f3fcdc5114537b49f26263b04cc2c94edf4"),
            ("linuxx86-64", "8f4cc72163713512fcaddfc9f3f1790376659f6aaa2ed55c47155ca0b52a7169"),
            ("osxx86-64", "9a0a8ac63c4d645d938e37ca4da0a040fc48a38e6d5f8689aa9c8eddec024600"),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "wpilibNewCommands-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibNewCommands",
        None,
        [
            ("windowsx86-64", None),
            ("linuxx86-64", None),
            ("osxx86-64", None),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "wpilibOldCommands-cpp",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/wpilibOldCommands",
        None,
        [
            ("windowsx86-64", None),
            ("linuxx86-64", None),
            ("osxx86-64", None),
        ],
        static_only = False,
    )

    wpilib_native_dependency(
        "halsim_gui",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/halsim",
        "a36b26dedc5735a52c3dc705e46b754e9c7da7c006848d41e87da0c37cf9c780",
        [
            ("windowsx86-64", "6f7c04b1f1a17fced091b9057579837ca82909e17565140be77ffbd9eb6db679"),
            ("linuxx86-64", "d77274cc63b382163b7c24ea54ff2b54570d23e109f7d3488785d6b9c263023f"),
            ("osxx86-64", "e5da5864c4c75367e7627f074b3351a2031c1fc56f3a05f2ec42dc20e819aa4e"),
        ],
    )

    wpilib_native_dependency(
        "halsim_ws_client",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/halsim",
        "7a083d8811d5abf23e1b77778e8b84aef8ceda8eb4de4cc234d3e69abd345660",
        [
            ("windowsx86-64", "80071475655a31cfe3c49cc1dd76cbf1136c12935789c279ff6727bc3dba238a"),
            ("linuxx86-64", "da3cbc93ac263b2ccf4de7945d31861b3f247b7c42089cc9317c96c627c68537"),
            ("osxx86-64", "e4ec269f9f26240bfd4c7711ed232340477c2e11be8594dc8a7c2c1a7591b39d"),
        ],
    )

    wpilib_native_dependency(
        "halsim_ws_server",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/halsim",
        "6cff127f2f5446f3d965c7d7923fe343f1eae958e2bfd6ee324a6f788a4a1540",
        [
            ("windowsx86-64", "89e3c28065a95adb925ea24813838450da10a585d4aaa837d18fe70c3c1db61a"),
            ("linuxx86-64", "ccbc351ded760015279e74ef0cbc216073714cb72b1f2ef04253ab38861d19e0"),
            ("osxx86-64", "4810a7254c60d1b90eb840c705aa30f0a326964b16eaac70aac70bf51d691eae"),
        ],
    )

    wpilib_native_dependency(
        "halsim_ds_socket",
        "2021.3.1",
        "https://frcmaven.wpi.edu/artifactory/release/edu/wpi/first/halsim",
        "236c4c1ef3e4d9c7bba0ce718fb1606af4c51ea2025d8cb89c5b41dcd65e7500",
        [
            ("windowsx86-64", "ece35a6e537c278d4e723d06f38b70248d268e77ff03642446e3ef407b3c6ba0"),
            ("linuxx86-64", "fed2c510c7d1306914fcac1e07b8b0b09d61ea12d92afc70714d6843122f8128"),
            ("osxx86-64", "72906f39507b6babe5864929d0c32d40b4f688615a36113ceefc07c323429b10"),
        ],
    )

    wpilib_java_vendor_library(
        vendor_name = "wpi_native",
        url = "https://frcmaven.wpi.edu/artifactory/release",
        version = "2021.3.1",
        java_deps = [],
        jni_deps = [
            ("edu.wpi.first.wpimath", "wpimath-cpp", "windowsx86-64", None),
            ("edu.wpi.first.wpiutil", "wpiutil-cpp", "windowsx86-64", None),
            ("edu.wpi.first.ntcore", "ntcore-cpp", "windowsx86-64", None),
            ("edu.wpi.first.cscore", "cscore-cpp", "windowsx86-64", None),
            ("edu.wpi.first.hal", "hal-cpp", "windowsx86-64", None),
        ],
    )
