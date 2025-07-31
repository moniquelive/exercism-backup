default rel

section .rodata
earth_seconds:
    dd 31557600

factors:
    dd 0.2408467  ; MERCURY
    dd 0.61519726 ; VENUS
    dd 1.0        ; EARTH
    dd 1.8808158  ; MARS
    dd 11.862615  ; JUPITER
    dd 29.447498  ; SATURN
    dd 84.016846  ; URANUS
    dd 164.79132  ; NEPTUNE

section .text
global age
age:
    ; rdi = enum planet
    ; rsi = int seconds
    sub rsp, 8                      ; save temp space

    finit                           ; initialize fp stack
    mov dword [rsp], esi            ; load (int) seconds
    fild dword [rsp]                ; push int on fp stack
    fild dword [earth_seconds]      ; push int on fp stack
    fdivp                           ; divide and pop

    lea rbx, [factors]              ; load factors base address
    mov eax, dword [rbx + 4*rdi]    ; eax = (float) factors[rdi]
    mov dword [rsp], eax            ; load eax into temp space
    fld dword [rsp]                 ; push (float) eax on fp stack
    fdivp                           ; divide and pop

    fst dword [rsp]                 ; load temp space with fp stack top
    movss xmm0, [rsp]               ; return value register for fp

    add rsp, 8                      ; restore temp space
    ret

