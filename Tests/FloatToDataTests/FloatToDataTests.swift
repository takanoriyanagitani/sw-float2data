import Foundation
import XCTest

@testable import FloatToData

final class AppendTests: XCTestCase {
  func testEmpty() throws {
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 16,
      alignment: 4
    )
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)
    var dat: Foundation.Data = Data(capacity: 16)
    FloatToData.append(raw: iraw, count: 0, dat: &dat)

    XCTAssertEqual(dat.count, 0)
  }

  func testSingle() throws {
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 16,
      alignment: 4
    )
    let buf: UnsafeMutablePointer<Float32> = raw.assumingMemoryBound(
      to: Float32.self
    )
    buf[0] = 42.0
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)
    var dat: Foundation.Data = Data(capacity: 16)
    dat.removeAll(keepingCapacity: true)
    FloatToData.append(raw: iraw, count: 1, dat: &dat)

    XCTAssertEqual(dat.count, 4)
    let rawptr: UnsafeRawBufferPointer = dat.withUnsafeBytes { ptr in ptr }
    let f0: Float32 = rawptr.load(fromByteOffset: 0, as: Float32.self)
    XCTAssertEqual(f0, 42.0)
  }

  func testDouble() throws {
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 16,
      alignment: 4
    )
    let buf: UnsafeMutablePointer<Float32> = raw.assumingMemoryBound(
      to: Float32.self
    )
    buf[0] = 333.0
    buf[1] = 634.0
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)
    var dat: Foundation.Data = Data(capacity: 16)
    dat.removeAll(keepingCapacity: true)
    FloatToData.append(raw: iraw, count: 2, dat: &dat)
    FloatToData.append(raw: iraw, count: 2, dat: &dat)

    XCTAssertEqual(dat.count, 16)
    let rawptr: UnsafeRawBufferPointer = dat.withUnsafeBytes { ptr in ptr }
    let f0: Float32 = rawptr.load(fromByteOffset: 0, as: Float32.self)
    let f1: Float32 = rawptr.load(fromByteOffset: 4, as: Float32.self)
    let f2: Float32 = rawptr.load(fromByteOffset: 8, as: Float32.self)
    let f3: Float32 = rawptr.load(fromByteOffset: 12, as: Float32.self)
    XCTAssertEqual(f0, 333.0)
    XCTAssertEqual(f1, 634.0)
    XCTAssertEqual(f2, 333.0)
    XCTAssertEqual(f3, 634.0)
  }
}

final class CopyTests: XCTestCase {
  func testEmpty() throws {
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 16,
      alignment: 4
    )
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)
    var dat: Foundation.Data = Data(capacity: 16)
    FloatToData.copy(raw: iraw, count: 0, dat: &dat)

    XCTAssertEqual(dat.count, 0)
  }

  func testSingle() throws {
    let raw: UnsafeMutableRawPointer = UnsafeMutableRawPointer.allocate(
      byteCount: 16,
      alignment: 4
    )
    let buf: UnsafeMutablePointer<Float32> = raw.assumingMemoryBound(
      to: Float32.self
    )
    buf[0] = 42.0
    let iraw: UnsafeRawPointer = UnsafeRawPointer(raw)
    var dat: Foundation.Data = Data(capacity: 16)
    FloatToData.copy(raw: iraw, count: 1, dat: &dat)
    FloatToData.copy(raw: iraw, count: 1, dat: &dat)
    FloatToData.copy(raw: iraw, count: 1, dat: &dat)
    FloatToData.copy(raw: iraw, count: 1, dat: &dat)

    XCTAssertEqual(dat.count, 4)
    let rawptr: UnsafeRawBufferPointer = dat.withUnsafeBytes { ptr in ptr }
    let f0: Float32 = rawptr.load(fromByteOffset: 0, as: Float32.self)
    XCTAssertEqual(f0, 42.0)
  }
}
