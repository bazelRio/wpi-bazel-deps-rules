
# import requests
import json
from jinja2 import Template

def get_jni_hash(dep, platform):
    return ""

def get_cpp_header_sha(dep):
    return "None"

def get_cpp_library_sha(dep, platform):
    return ""

def get_cpp_subfolder(dep):
    return dep['groupId'].replace(".", "/")


def main():

    # url = "https://devsite.ctr-electronics.com/maven/release/com/ctre/phoenix/Phoenix-latest.json"
    # short_name = "ctre"

    url = "http://www.revrobotics.com/content/sw/max/sdk/REVRobotics.json"
    short_name = "rev"

    from urllib.request import urlopen
    vendor_dep = json.loads(urlopen(url).read())

    template = Template(__TEMPLATE)
    template.globals['get_jni_hash'] = get_jni_hash
    template.globals['get_cpp_header_sha'] = get_cpp_header_sha
    template.globals['get_cpp_subfolder'] = get_cpp_subfolder
    template.globals['get_cpp_library_sha'] = get_cpp_library_sha

    contents = template.render(vendor_dep=vendor_dep, short_name=short_name)
    print(contents)

    # java_dependencies = []
    # for java_dep in vendor_dep["javaDependencies"]:
    #     java_dependencies.append(java_dep["groupId"], java_dep["artifactId"])
    #     print(java_dep)
    #
    # jni_deps = []


    # print(html)
    # response = json.loads(requests.get(url).text)
    # print(response)




__TEMPLATE = """

load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "wpilib_native_dependency", "wpilib_java_vendor_library")
load("@wpi_bazel_rules//rules:wpilib_repo.bzl", "make_cpp_alias")

__MAVEN_URL = "{{vendor_dep.mavenUrls[0]}}"
__VERSION = "{{vendor_dep.version}}"

def third_party_{{short_name}}_java():
    return wpilib_java_vendor_library(
        vendor_name = "{{short_name}}",
        url = __MAVEN_URL,
        version = __VERSION,
        java_deps = [
        {%- for dep in vendor_dep["javaDependencies"] %}
            ("{{dep['groupId']}}", "{{dep['artifactId']}}"),
        {%- endfor %}
        ],
        jni_deps = [
        {%- for dep in vendor_dep["jniDependencies"] %}
           {%- for platform in dep.validPlatforms %}
            ("{{dep['groupId']}}", "{{dep['artifactId']}}", "{{platform}}", "{{get_jni_hash(dep, platform)}}"),
            {%- endfor %}
        {%- endfor %}
        ])


def third_party_{{short_name}}_native():

    {%- for dep in vendor_dep["cppDependencies"] %}
    wpilib_native_dependency(
        artifact_base_name = "{{dep['artifactId']}}",
        version = __VERSION,
        url = __MAVEN_URL + "{{get_cpp_subfolder(dep)}}",
        sha = {{get_cpp_header_sha(dep)}},
        platform_libraries = [
            {%- for platform in dep["binaryPlatforms"] %}
            ("{{platform}}", "{{get_cpp_library_sha(dep, platform)}}"),
            {%- endfor %}
        ],
        static_only = {{not dep.sharedLibrary}}
    )
    {%- endfor %}

"""


if __name__ == "__main__":
    main()