enum CircularBufferError: Error { case bufferEmpty, bufferFull }

struct CircularBuffer {
  var capacity: Int
  private var buffer: [Int]

  init(capacity: Int) {
    self.capacity = capacity
    self.buffer = [Int]()
  }

  mutating func clear() { buffer.removeAll() }

  mutating func overwrite(_ value: Int) {
    if buffer.count >= capacity { buffer.removeFirst() }
    try! write(value)
  }

  mutating func write(_ value: Int) throws {
    guard buffer.count < capacity else { throw CircularBufferError.bufferFull }
    buffer.append(value)
  }

  mutating func read() throws -> Int {
    guard !buffer.isEmpty else { throw CircularBufferError.bufferEmpty }
    return buffer.removeFirst()
  }
}
