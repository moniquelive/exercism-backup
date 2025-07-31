class EmptyBufferException extends Exception {}
class FullBufferException extends Exception {}

class CircularBuffer {
    private int start = 0
    private int end = 0
    private int capacity
    private int size = 0
    private int[] values

    CircularBuffer(int capacity) {
        this.capacity = capacity
        this.values = new int[capacity]
    }

    def write(int value) {
        if (size == capacity)
            throw new FullBufferException()
        values[start] = value
        start = (start + 1) % capacity
        size++
    }

    def read() {
        if (size == 0)
            throw new EmptyBufferException()
        int value = values[end]
        end = (end + 1) % capacity
        size--
        return value
    }

    def overwrite(int value) {
        if (size < capacity) {
            return write(value)
        }
        values[start] = value
        start = (start + 1) % capacity
        end = (end + 1) % capacity
    }

    def clear() {
        start = 0
        end = 0
        size = 0
    }
}
