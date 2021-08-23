// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "BehnkeDotDev",
    products: [
        .executable(name: "BehnkeDotDev", targets: ["BehnkeDotDev"])
    ],
    dependencies: [
      .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.3.0"),
      .package(name: "S3PublishDeploy", url: "https://github.com/johnbehnke/s3publishdeploy", from: "0.1.0")
        
    ],
    targets: [
        .target(
            name: "BehnkeDotDev",
            dependencies: ["Publish", "S3PublishDeploy"]
        )
    ]
)
