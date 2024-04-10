// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "FloatToData",
  products: [
    .library(
      name: "FloatToData",
      targets: ["FloatToData"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0")
  ],
  targets: [
    .target(
      name: "FloatToData",
      dependencies: []
    ),
    .testTarget(
      name: "FloatToDataTests",
      dependencies: ["FloatToData"]),
  ]
)
