#!/usr/bin/awk -f

# Function to convert plant character to name
function plant(c) {
    if (c == "C") return "clover"
    if (c == "G") return "grass"
    if (c == "R") return "radishes"
    if (c == "V") return "violets"
    return "unknown"
}

# Function to get plants for a student
function get_plants(diagram, student) {
    split(diagram, rows, "\n")
    first_row = rows[1]
    second_row = rows[2]
    
    student_index = 2 * (index("ABCDEFGHIJKLMNOPQRSTUVWXYZ", substr(student, 1, 1)) - 1)
    
    result = plant(substr(first_row, student_index + 1, 1)) " " \
             plant(substr(first_row, student_index + 2, 1)) " " \
             plant(substr(second_row, student_index + 1, 1)) " " \
             plant(substr(second_row, student_index + 2, 1))
    
    return result
}

# Main processing
{
    diagram = (diagram == "" ? $0 : diagram "\n" $0)
}

END {
    print get_plants(diagram, name)
}