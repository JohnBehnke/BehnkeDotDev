// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "PersonalSite",
    products: [
        .executable(name: "PersonalSite", targets: ["PersonalSite"])
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "PersonalSite",
            dependencies: ["Publish"]
        )
    ]
)