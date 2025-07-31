%macro divisible_by 1
    mov ax, di
    mov cx, %1
    xor dx, dx
    div cx
    and dx, dx
%endmacro

section .text
global leap_year
leap_year:
    ;; year % 400 == 0 -> TRUE
    divisible_by 400
    jz true

    ;; year % 4 == 0 && year % 100 != 0 -> TRUE
    divisible_by 4
    jnz false

    divisible_by 100
    jz false

true:
    mov rax, 1
    ret

false:
    mov rax, 0
    ret
