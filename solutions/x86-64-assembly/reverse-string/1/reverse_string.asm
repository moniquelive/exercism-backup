default rel

section .text

global reverse
reverse:
    ; rdi = str
    call strlen
    test rcx, rcx
    jz done

    mov rsi, rdi
    add rsi, rcx ; rsi = str[ len-1 ]
    dec rsi

    shr rcx, 1   ; rcx = len / 2

repeat:
    mov al, byte [rdi]
    xchg al, byte [rsi]

    mov byte[rdi], al

    inc rdi
    dec rsi

    loop repeat

done:
    ret

strlen:
    mov r10, rdi              ; save rdi
    sub rcx, rcx
    sub al, al
    not rcx
    repne scasb
    not rcx
    dec rcx                   ; rcx = strlen(name)
    mov rdi, r10              ; restore rdi
    ret
