// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "PNTResolver",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14),
        .tvOS(.v13),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        // The primary product for binary distribution should be dynamic.
        // This will be the library that supports module stability.
        .library(
            name: "PNTResolver",
            type: .dynamic,
            targets: ["PNTResolver"]
        ),
        // Optional: Provide an explicitly static library.
        // SwiftPM will build this version without library evolution.
        .library(
            name: "Resolver-Static",
            type: .static,
            targets: ["PNTResolver"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PNTResolver",
            dependencies: [],
            resources: [.copy("PrivacyInfo.xcprivacy")],
            // This setting is REQUIRED for building a stable binary framework.
            swiftSettings: [
                .unsafeFlags(["-enable-library-evolution"])
            ]
        ),
        .testTarget(
            name: "ResolverTests",
            dependencies: ["PNTResolver"]
        ),
    ]
)
