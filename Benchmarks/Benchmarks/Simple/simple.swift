import Benchmark
import FloatToData
import Foundation

let benchmarks = {

  Benchmark("append raw, small") { benchmark in
    var dat: Foundation.Data = Data(capacity: 128)
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 128,
      alignment: 4
    )
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)

    for _ in benchmark.scaledIterations {
      dat.removeAll(keepingCapacity: true)
      FloatToData.append(raw: iraw, count: 32, dat: &dat)
    }
  }

  Benchmark("append raw, medium") { benchmark in
    var dat: Foundation.Data = Data(capacity: 16384)
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 16384,
      alignment: 4
    )
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)

    for _ in benchmark.scaledIterations {
      dat.removeAll(keepingCapacity: true)
      FloatToData.append(raw: iraw, count: 4096, dat: &dat)
    }
  }

  Benchmark("append raw, large") { benchmark in
    var dat: Foundation.Data = Data(capacity: 1_048_576)
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 1_048_576,
      alignment: 4
    )
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)

    for _ in benchmark.scaledIterations {
      dat.removeAll(keepingCapacity: true)
      FloatToData.append(raw: iraw, count: 262144, dat: &dat)
    }
  }

}
