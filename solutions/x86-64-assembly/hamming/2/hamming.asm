default rel

section .text
global distance
;; int distance(const char *strand1, const char *strand2);
distance:
    mov r10, rdi            ; "push" rdi
    mov rdi, rsi
    call strlen
    mov rdi, r10            ; "pop" rdi

    mov r8, rcx             ; rcx = strlen(rsi)

    mov r10, rdi            ; "push" rdi
    call strlen
    mov rdi, r10            ; "pop" rdi

    cmp r8, rcx             ; rcx = strlen(rdi)
    je same_length

    ;; size mismatch
    mov rax, -1
    ret

same_length:
    xor rax, rax

    ;; zero length strings
    test rcx, rcx
    jz done

compare:
    mov bl, byte [rsi]
    mov bh, byte [rdi]
    cmp bl, bh
    je same_nucleotide

    inc rax                 ; count difference

same_nucleotide:
    inc rsi
    inc rdi

    loop compare

done:
    ret

strlen:
    sub rcx, rcx
    sub al, al
    not rcx
    repne scasb
    not rcx
    dec rcx                   ; rcx = strlen(name)
    ret

