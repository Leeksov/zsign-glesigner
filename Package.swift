// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZSignApple",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "ZSignApple",
            targets: ["ZSign"]),
    ],
    targets: [
        .target(
            name: "ZSign",
            dependencies: ["OpenSSL"],
            exclude: [
                "common/archive.cpp",
                "zsign.cpp"
            ],
            sources: [
                "archo.cpp",
                "bundle.cpp",
                "macho.cpp",
                "openssl.cpp",
                "openssl_tools.mm",
                "signing.cpp",
                "zsign.mm",
                "common/base64.cpp",
                "common/fs.cpp",
                "common/json.cpp",
                "common/log.cpp",
                "common/sha.cpp",
                "common/timer.cpp",
                "common/util.cpp"
            ],
            publicHeadersPath: "./Includes",
            cxxSettings: [
                .headerSearchPath("."),
                .headerSearchPath("common"),
            ],
            linkerSettings: [
                .linkedFramework("OpenSSL"),
            ]
        ),
        .binaryTarget(
            name: "OpenSSL",
            path: "Binaries/OpenSSL.xcframework"
        ),
    ],
    cxxLanguageStandard: .cxx17
)
