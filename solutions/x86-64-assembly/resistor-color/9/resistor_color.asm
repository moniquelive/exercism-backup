default rel

section .rodata
black:     db "black", 0, 0
brown:     db "brown", 0, 1
red:       db "red", 0, 2
orange:    db "orange", 0, 3
yellow:    db "yellow", 0, 4
green:     db "green", 0, 5
blue:      db "blue", 0, 6
violet:    db "violet", 0, 7
grey:      db "grey", 0, 8
white:     db "white", 0, 9
sentinel:  db 0

section .data
vector:    dq black
           dq brown
           dq red
           dq orange
           dq yellow
           dq green
           dq blue
           dq violet
           dq grey
           dq white
           dq 0

section .text
global color_code
color_code:
    lea rsi, [black]

find_color_code:
    call strlen                 ; rcx = strlen

    mov r8, rdi                 ; save given color name

    repe cmpsb                  ; strcmp()
    and rcx, rcx
    jz exit_color_code          ; equal

    add rsi, rcx                ; skip remaning chars
    inc rsi                     ; skip '\0'
    inc rsi                     ; skip color code
    mov rdi, r8                 ; restore given color name

    jmp find_color_code

exit_color_code:
    inc rsi                     ; skip '\0'
    movsx rax, byte [rsi]
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
