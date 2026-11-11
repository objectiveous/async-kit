// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "async-kit",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(name: "AsyncKit", targets: ["AsyncKit"]),
    ],
    dependencies: [
        .package(path: "../swift-nio"),
        .package(path: "../swift-log"),
        .package(path: "../swift-collections"),
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.1.0"),
    ],
    targets: [
        .target(
            name: "AsyncKit",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
                .product(name: "NIOCore", package: "swift-nio"),
                .product(name: "NIOEmbedded", package: "swift-nio"),
                .product(name: "NIOPosix", package: "swift-nio"),
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            swiftSettings: swiftSettings
        ),
        .testTarget(
            name: "AsyncKitTests",
            dependencies: [
                .target(name: "AsyncKit"),
            ],
            swiftSettings: swiftSettings
        ),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    //.enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("MemberImportVisibility"),
    //.enableExperimentalFeature("StrictConcurrency=complete"),
] }
