default rel

section .rodata
black:     db "black", 0
brown:     db "brown", 0
red:       db "red", 0
orange:    db "orange", 0
yellow:    db "yellow", 0
green:     db "green", 0
blue:      db "blue", 0
violet:    db "violet", 0
grey:      db "grey", 0
white:     db "white", 0
sentinel:  db 0

section .data
vector:    dq black, brown, red, orange, yellow, \
              green, blue, violet, grey, white, 0

section .text
global color_code
color_code:
    lea rsi, [black]
    xor r9,r9

find_color_code:
    call strlen                 ; rcx = strlen

    mov r8, rdi                 ; save given color name

    repe cmpsb                  ; strcmp()
    and rcx, rcx
    jz exit_color_code          ; equal

    add rsi, rcx                ; skip remaning chars
    inc rsi                     ; skip '\0'
    mov rdi, r8                 ; restore given color name

    inc r9

    jmp find_color_code

exit_color_code:
    mov rax, r9
    ret

strlen:
    mov r10, rdi              ; save rdi for repne scasb
    mov rdi, rsi              ; rsi = char*
    sub rcx, rcx
    sub al, al
    not rcx
    repne scasb
    not rcx
    dec rcx                   ; rcx = strlen(name)
    mov rdi, r10
    ret


global colors
colors:
    lea rax, [vector]
    ret
