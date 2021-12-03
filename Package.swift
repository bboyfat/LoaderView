// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoaderView",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LoaderView",
            targets: ["LoaderView"]),
    ],
    dependencies: [
        .package(name: "DeclarativeUIKit", url: "https://github.com/bboyfat/DeclarativeUIKit", from: .init(0, 0, 0))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LoaderView",
            dependencies: []),
        .testTarget(
            name: "LoaderViewTests",
            dependencies: ["LoaderView"]),
    ]
)
