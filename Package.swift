// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Category",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Category",
            targets: ["Category"]),
    ],
    dependencies: [
        // 1. Konsisten dengan versi stabil Realm (dari 10.47.0)
        .package(url: "https://github.com/realm/realm-swift.git", .upToNextMajor(from: "10.47.0")),
        // 2. Konsisten dengan versi stabil Alamofire (dari 5.9.1)
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1")),
        .package(url: "https://github.com/nunutech40/MealsAppCore.git", from: "1.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Category",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift"),
                .product(name: "Core", package: "MealsAppCore"),
                "Alamofire"
            ]
        ),
        
    ]
)
