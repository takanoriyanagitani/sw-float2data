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

public func append(raw: UnsafeRawPointer, count: Int, dat: inout Data) {
  let ptr: UnsafePointer<Float32> = raw.assumingMemoryBound(
    to: Float32.self
  )
  append(ptr: ptr, count: count, dat: &dat)
}
