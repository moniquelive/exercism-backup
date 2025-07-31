%macro divisible_by 1
    mov eax, edi
    mov ecx, %1
    xor edx, edx
    div ecx
    and edx, edx
%endmacro

section .text
global leap_year
leap_year:
    ;; year % 4 == 0 && year % 100 != 0 -> TRUE
    divisible_by 4
    jnz false

    divisible_by 100
    jnz true

    ;; year % 400 == 0 -> TRUE
    divisible_by 400
    jnz false

true:
    mov rax, 1
    ret

false:
    mov rax, 0
    ret
