default rel

section .rodata
one_for: db "One for "
one_for_len equ $-one_for

you: db "you"
you_len equ $-you

one_for_me: db ", one for me.", 0
one_for_me_len equ $-one_for_me

section .text
global two_fer
two_fer:
    mov r8, rdi               ; name
    mov rdi, rsi              ; buffer

    ; append "One for "
    lea rsi, [one_for]
    mov rcx, one_for_len
    rep movsb                 ; "One for "

    test r8, r8               ; r8 = name || "you"
    jnz len
    lea r8, [you]
    mov rcx, you_len
    jmp append_name

len:
    mov r9, rdi               ; save rdi for repne scasb
    mov rdi, r8               ; rdi = name
    sub rcx, rcx
    sub al, al
    not rcx
    repne scasb
    not rcx
    dec rcx                   ; rcx = strlen(name)
    mov rdi, r9

append_name:
    ; append "you" || name
    mov rsi, r8               ; rsi = "you" || name
    rep movsb

    ; append ", one for me."
    lea rsi, [one_for_me]
    mov rcx, one_for_me_len
    rep movsb                 ; ", one for me."

    ret
