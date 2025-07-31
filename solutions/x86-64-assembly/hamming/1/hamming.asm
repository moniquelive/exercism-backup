default rel

section .text
global distance
distance:
    mov r10, rdi
    mov rdi, rsi
    call strlen
    mov rdi, r10
    ; rcx = strlen(rsi)

    mov r8, rcx

    mov r10, rdi
    call strlen
    mov rdi, r10
    ; rcx = strlen(rdi)

    cmp r8, rcx
    je continue1

    ;; size mismatch
    mov rax, -1
    ret

continue1:
    xor rax, rax

    ;; zero length strings
    and rcx, rcx
    jz exit

scan:
    movzx r8, byte [rsi]
    movzx r9, byte [rdi]
    cmp r8, r9
    je continue2

    inc rax

continue2:
    inc rsi
    inc rdi

    loop scan
exit:
    ret

strlen:
    sub rcx, rcx
    sub al, al
    not rcx
    repne scasb
    not rcx
    dec rcx                   ; rcx = strlen(name)
    ret

