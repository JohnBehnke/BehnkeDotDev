// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "BehnkeDotDev",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "BehnkeDotDev", targets: ["BehnkeDotDev"])
    ],
    dependencies: [
      .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "BehnkeDotDev",
            dependencies: ["Publish"]
        )
    ]
)
