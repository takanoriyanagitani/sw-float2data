// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "Benchmarks",
  dependencies: [
    .package(path: ".."),
    .package(
      url: "https://github.com/ordo-one/package-benchmark",
      .upToNextMajor(from: "1.22.4")
    ),
  ],
  targets: [
    .executableTarget(
      name: "Benchmarks",
      dependencies: [
        .product(name: "Benchmark", package: "package-benchmark"),
        "FloatToData",
      ],
      path: "Benchmarks/Simple",
      plugins: [
        .plugin(name: "BenchmarkPlugin", package: "package-benchmark")
      ]
    )
  ]
)
