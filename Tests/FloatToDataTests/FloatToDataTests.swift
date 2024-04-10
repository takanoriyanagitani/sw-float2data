import Foundation
import XCTest

@testable import FloatToData

final class FloatToDataTests: XCTestCase {
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
    FloatToData.append(raw: iraw, count: 1, dat: &dat)

    XCTAssertEqual(dat.count, 4)
    let rawptr: UnsafeRawBufferPointer = dat.withUnsafeBytes { ptr in ptr }
    let bufptr: UnsafeBufferPointer<Float32> = rawptr.assumingMemoryBound(
      to: Float32.self
    )
    XCTAssertEqual(bufptr[0], 42.0)
  }
}
