// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tw_keychain",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(name: "tw-keychain", targets: ["tw_keychain"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/kishikawakatsumi/UICKeyChainStore.git", from: "2.2.1")
    ],
    targets: [
        .target(
            name: "tw_keychain",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "UICKeyChainStore", package: "UICKeyChainStore")
            ]
        )
    ]
)
