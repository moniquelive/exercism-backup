default rel

%macro swap 2
    cmp al, %1
    jne %%continue
    mov al, %2
    jmp next
%%continue:
%endmacro

section .text

global to_rna
to_rna:
    xchg rdi, rsi  ; RSI -> strand
                   ; RDI -> buffer

repeat:
    lodsb          ; al = *rsi++
    test al, al
    jz done

    swap 'G', 'C'
    swap 'C', 'G'
    swap 'T', 'A'
    swap 'A', 'U'

next:
    stosb          ; *rdi++ = al
    jmp repeat

done:
    xor al, al
    stosb          ; string terminator

    ret
