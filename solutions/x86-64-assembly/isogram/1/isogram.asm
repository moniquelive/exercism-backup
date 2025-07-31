default rel


section .bss
alphabet    resb 26


section .text

global is_isogram
is_isogram:
    mov rsi, rdi
    mov ecx, 26
    xor rax, rax
    lea rdi, [alphabet]
    rep stosb              ; memset(alphabet, 0, 26)

    lea rdi, [alphabet]

repeat:
    lodsb
    test al, al
    jz done

    and al, 05fh           ; toupper
    cmp al, 'A'
    jb repeat
    cmp al, 'Z'
    ja repeat              ; if (al < 'A' || al > 'Z') continue;

    sub al, 'A'
    inc byte [rdi + rax]   ; *alphabet[al-'A']++

    jmp repeat

done:
    mov rsi, rdi
    mov ecx, 26
scan:
    lodsb
    cmp al, 1
    ja not_iso
    loop scan

    mov rax, 1
    ret

not_iso:
    xor rax, rax
    ret

