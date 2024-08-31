// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "DynamicIcon",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "DynamicIcon", targets: ["DynamicIcon"]),
    ],
    targets: [
        .target(name: "DynamicIcon"),
    ]
)
