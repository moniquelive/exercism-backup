default rel

section .text
global find
find:
; extern int find(int *array, int size, int value);
    xor r8, r8
    call rec_find
    ret

rec_find:
; int rec_find(int *array, int from, int to, int value);
    ; rdi = array of 32 bits ints
    ; r8 = from
    ; rsi = to
    ; rdx = value

    ; recursion base case (empty array)
    mov rax, rsi
    sub rax, r8             ;; to - from
    test rax, rax
    jnz .if_ne_val

    dec rax                 ;; return -1
    ret

.if_ne_val:
    mov rbx, rax
    shr rbx, 1              ;; rbx = middle = (to - from) / 2

    mov r9, rbx
    add r9, r8              ;; r9 = from + middle
    lea rax, [rdi+4*r9]     ;; rax = array[r9]
    cmp [rax], edx          ;; *rax == edx ?
    jne .if_gt_val
    mov rax, r9
    ret                     ;; return from+middle

.if_gt_val:
    jle .if_lte_val
    mov rsi, r8
    add rsi, rbx            ;; new to = from + middle
    jmp rec_find            ;; recursive call

.if_lte_val:
    add r8, rbx
    inc r8                  ;; new from = from + middle + 1
    jmp rec_find            ;; recursive call

;; int rec_find(int *array, int from, int to, int value) {
;;   //printf("array = %p, from = %d, to = %d, value = %d\n", array, from, to, value);
;;   if (to-from == 0) return -1;
;;
;;   const int middle = (to-from)/2;
;;   if (array[from+middle] == value) return from+middle;
;;
;;   if (array[from+middle] > value) {
;;     return rec_find(array, from, from+middle, value);
;;   }
;;   return rec_find(array, from+middle+1, to, value);
;; }

