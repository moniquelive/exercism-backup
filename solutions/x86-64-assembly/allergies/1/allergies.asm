;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;;
;; LEMBRAR DE PERGUNTAR PRO MENTOR POR QUE O TESTE ESTAVA COM
;; ENUMS SEQUENCIAIS E NAO BINARIOS COMO ABAIXO...
;;
;; enum item {
;;     EGGS=1,
;;     PEANUTS=2,
;;     SHELLFISH=4,
;;     STRAWBERRIES=8,
;;     TOMATOES=16,
;;     CHOCOLATE=32,
;;     POLLEN=64,
;;     CATS=128,
;;     MAX_ITEMS=8
;; };
;;
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

default rel
section .text
global allergic_to
; extern int allergic_to(enum item item, unsigned int score);
allergic_to:
    ; rdi = item
    ; rsi = score
    xor rax, rax
    and rsi, rdi
    jz not_allergic
    inc rax

not_allergic:
    ret

global list
; extern void list(unsigned int score, struct item_list *list);
list:
                        ; rsi = *list
    mov dword [rsi], 0  ; size
    lea rbx, [rsi+4]    ; items[]

    mov eax, 1          ; test item
    mov rcx, 8          ; # items

foreach:
    test rdi, 1         ; rdi = score
    jz continue

    mov [rbx], eax
    inc dword [rsi]
    add rbx, 4

continue:
    shr rdi, 1
    shl eax, 1
    loop foreach
    ret
