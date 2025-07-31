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

    lea rsi, [one_for]
    mov rcx, one_for_len
    rep movsb                 ; "One for "

    test r8, r8               ; name == NULL ?
    jnz not_null

    lea r8, [you]
    mov rcx, you_len
    jmp print_name

not_null:
    mov r9, rdi               ; save rdi for repne scasb
    mov rdi, r8               ; rdi = name
    xor rcx, rcx
    xor al, al
    not rcx
    cld
    repne scasb
    not rcx
    dec rcx                   ; rcx = strlen(name)
    mov rdi, r9
    mov rsi, r8               ; rsi = name

print_name:
    mov rsi, r8               ; rsi = "you" || name
    rep movsb                 ; "you" || name

    lea rsi, [one_for_me]
    mov rcx, one_for_me_len
    rep movsb                 ; ", one for me."

    ret
