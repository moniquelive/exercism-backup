default rel

section .text

global square
square:
    xor rax, rax

    mov rcx, rdi        ; bellow 64
    cmp ecx, 64
    ja done

    test ecx, ecx       ; above 0
    jbe done

    mov rax, 1
    dec cl
    shl rax, cl

done:
    ret

global total
total:
    mov rax, -1
    ret
