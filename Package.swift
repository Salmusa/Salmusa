// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Salmusa",
    products: [
        .library(
            name: "Salmusa",
            targets: ["Salmusa"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Salmusa",
            dependencies: []),
        .testTarget(
            name: "SalmusaTests",
            dependencies: ["Salmusa"]),
    ]
)
