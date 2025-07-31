class EmptyBufferException() extends Exception {}
class FullBufferException() extends Exception {}

class CircularBuffer(var capacity: Int) {
  private var start: Int = 0
  private var end: Int = 0
  private var size: Int = 0
  private val values: Array[Int] = Array.fill[Int](capacity)(0)

  def write(value: Int) = {
    if (size == capacity) {
      throw new FullBufferException()
    } else {
      values(start) = value
      start = (start + 1) % capacity
      size += 1
    }
  }

  def read(): Int = {
    if (size == 0) {
      throw new EmptyBufferException()
    } else {
      val value = values(end)
      end = (end + 1) % capacity
      size -= 1
      value
    }
  }

  def overwrite(value: Int) = {
    if (size < capacity) {
      write(value)
    } else {
      values(start) = value
      start = (start + 1) % capacity
      end = (end + 1) % capacity
    }
  }

  def clear() = {
    start = 0
    end = 0
    size = 0
  }
}

  // def write(value: Int) = ???
  // def read(): Int = ???
  // def overwrite(value: Int) = ???
  // def clear() = ???
// }