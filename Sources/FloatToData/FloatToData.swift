import Foundation

public func append(buf: UnsafeBufferPointer<Float32>, dat: inout Data) {
  dat.append(buf)
}

public func append(ptr: UnsafePointer<Float32>, count: Int, dat: inout Data) {
  let buf: UnsafeBufferPointer<Float32> = UnsafeBufferPointer(
    start: ptr,
    count: count
  )
  append(buf: buf, dat: &dat)
}

/// Appends raw byte values to the given `Data`.
/// - parameter raw: The pointer to data to be appended.
/// - parameter count: The number of values(not bytes) to be appended.
/// - parameter dat: The data to append byte values.
public func append(raw: UnsafeRawPointer, count: Int, dat: inout Data) {
  let ptr: UnsafePointer<Float32> = raw.assumingMemoryBound(
    to: Float32.self
  )
  append(ptr: ptr, count: count, dat: &dat)
}

/// Copies raw byte values to the given `Data`.
/// - parameter raw: The pointer to data to be copied.
/// - parameter count: The number of values(not bytes) to be copied.
/// - parameter dat: The data to copy byte values.
public func copy(raw: UnsafeRawPointer, count: Int, dat: inout Data) {
  dat.removeAll(keepingCapacity: true)
  append(raw: raw, count: count, dat: &dat)
}
