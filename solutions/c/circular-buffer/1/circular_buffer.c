#include "circular_buffer.h"

circular_buffer_t * new_circular_buffer(size_t capacity) {
    circular_buffer_t* buffer = calloc(sizeof(circular_buffer_t), 1);
    buffer->values = calloc(sizeof(buffer_value_t), capacity);
    buffer->capacity = capacity;
    return buffer;
}

void delete_buffer(circular_buffer_t *buffer) {
    free(buffer->values);
    free(buffer);
}

int16_t read(circular_buffer_t *buffer, buffer_value_t *out_value) {
    if (buffer->size == 0) {
        errno = ENODATA;
        return EXIT_FAILURE;
    }
    *out_value = buffer->values[buffer->end];
    buffer->end = (buffer->end + 1) % buffer->capacity;
    buffer->size--;
    return EXIT_SUCCESS;
}

int16_t write(circular_buffer_t *buffer, buffer_value_t value) {
    if (buffer->size == buffer->capacity) {
        errno = ENOBUFS;
        return EXIT_FAILURE;
    }
    buffer->values[buffer->start] = value;
    buffer->start = (buffer->start + 1) % buffer->capacity;
    buffer->size++;
    return EXIT_SUCCESS;
}

int16_t overwrite(circular_buffer_t *buffer, buffer_value_t value) {
    if (buffer->size < buffer->capacity) {
        return write(buffer, value);
    }
    buffer->values[buffer->start] = value;
    buffer->start = (buffer->start + 1) % buffer->capacity;
    buffer->end = (buffer->end + 1) % buffer->capacity;
    return EXIT_SUCCESS;
}

void clear_buffer(circular_buffer_t *buffer) {
    buffer->start = 0;
    buffer->end = 0;
    buffer->size = 0;
}
