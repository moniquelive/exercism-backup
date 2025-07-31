default rel

%macro return 3
    mov r8, rdi

    lea rsi, [%1]
    mov rcx, %2
    repe cmpsb
    mov rax, %3

    and rcx, rcx
    jz exit_color_code

    mov rdi, r8
%endmacro

section .rodata
black:     db "black", 0
black_len  equ $-black-1
brown:     db "brown", 0
brown_len  equ $-brown-1
red:       db "red", 0
red_len    equ $-red-1
orange:    db "orange", 0
orange_len equ $-orange-1
yellow:    db "yellow", 0
yellow_len equ $-yellow-1
green:     db "green", 0
green_len  equ $-green-1
blue:      db "blue", 0
blue_len   equ $-blue-1
violet:    db "violet", 0
violet_len equ $-violet-1
grey:      db "grey", 0
grey_len   equ $-grey-1
white:     db "white", 0
white_len  equ $-white-1

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

section .text
global color_code
color_code:
    ; given a color name (string) return its value
    return black,  black_len,  0
    return brown,  brown_len,  1
    return red,    red_len,    2
    return orange, orange_len, 3
    return yellow, yellow_len, 4
    return green,  green_len,  5
    return blue,   blue_len,   6
    return violet, violet_len, 7
    return grey,   grey_len,   8
    return white,  white_len,  9
    mov rax, -1
exit_color_code:
    ret

global colors
colors:
    lea rax, [vector]
    ret
