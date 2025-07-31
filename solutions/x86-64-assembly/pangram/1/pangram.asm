default rel

section .text

_26_ones            equ 11111111111111111111111111b
TO_UPPERCASE_MASK   equ 5fh

global is_pangram

is_pangram:
    mov rsi, rdi            ; for lodsb
    xor edi, edi            ; bloom filter
    xor eax, eax

repeat:
    lodsb
    test al, al
    jz done

    and al, TO_UPPERCASE_MASK
    cmp al, 'A'             ; sanity check
    jb repeat
    cmp al, 'Z'
    ja repeat

    sub al, 'A'
    mov cl, al
    mov ebx, 1
    shl ebx, cl
    or edi, ebx             ; set filter bit
    jmp repeat

done:
    xor rax, rax
    cmp edi, _26_ones
    jz true
    ret

true:
    inc rax
    ret
