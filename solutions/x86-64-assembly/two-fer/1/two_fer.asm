default rel

section .rodata
for_you: db "One for "
for_you_len equ $-for_you

for_me: db ", one for me.", 0
for_me_len equ $-for_me

you: db "you"
you_len equ $-you

section .text
global two_fer
two_fer:
; rdi = name
; rsi = buffer
    push rdi
    push rsi
    pop rdi ; buffer
    pop r8 ; name

    lea rsi, [for_you]
    mov rcx, for_you_len
    rep movsb ; "One for "

    test r8, r8 ; name == NULL ?
    jnz cont

    lea r8, [you]
    mov rcx, you_len
    jmp print_name

cont:
    xor rcx, rcx ; rcx = 0
    mov rsi, r8  ; rsi = name
cont1:
    lodsb        ; al = [rsi]; inc rsi
    test al,al   ; al == 0 ?
    jz print_name
    inc rcx
    jmp cont1    ; warn: could become infinite

print_name:
    mov rsi, r8  ; rsi = "you" || name
    rep movsb    ; "you" || name

    lea rsi, [for_me]
    mov rcx, for_me_len
    rep movsb ; ", one for me."

    ret
