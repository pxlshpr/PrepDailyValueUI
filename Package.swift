// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PrepDailyValueUI",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "PrepDailyValueUI",
            targets: ["PrepDailyValueUI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pxlshpr/PrepShared", from: "0.0.141"),
        .package(url: "https://github.com/pxlshpr/PrepDailyValue", from: "0.0.9"),
        .package(url: "https://github.com/pxlshpr/PrepSettings", from: "0.0.1"),
        .package(url: "https://github.com/pxlshpr/PrepSettingsUI", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "PrepDailyValueUI",
            dependencies: [
                .product(name: "PrepShared", package: "PrepShared"),
                .product(name: "PrepDailyValue", package: "PrepDailyValue"),
                .product(name: "PrepSettings", package: "PrepSettings"),
                .product(name: "PrepSettingsUI", package: "PrepSettingsUI"),
            ]
        ),
        .testTarget(
            name: "PrepDailyValueUITests",
            dependencies: ["PrepDailyValueUI"]),
    ]
)
