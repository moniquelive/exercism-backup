section .text
global square_of_sum
square_of_sum:
    ;; rdi == n
    ;; n(n+1) / 2

    mov rax, rdi
    inc rax         ;; rax = rdi + 1
    imul rax, rdi   ;; rax *= rdi
    shr rax, 1      ;; rax /= 2
    imul rax, rax   ;; rax *= rax
    ret

global sum_of_squares
sum_of_squares:
    ;; rdi == n
    mov rbx, rdi
    add rbx, rbx
    inc rbx         ;; (2n + 1)
    mov rax, rdi
    inc rax         ;; (n + 1)

    imul rax, rdi   ;; n(n + 1)
    imul rax, rbx   ;; n(n + 1)(2n + 1)

    mov ecx, 6
    xor rdx, rdx
    div ecx         ;; [n(n + 1)(2n + 1)]/6

    ret

global difference_of_squares
difference_of_squares:
    call sum_of_squares
    mov r8, rax

    call square_of_sum
    sub rax, r8
    ret
