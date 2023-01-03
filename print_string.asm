print_string:
    pusha ; Pushes all registers to the stack
    mov ah, 0x0e ; BIOS tele-type output
print_compare:
    cmp byte [bx], 0x0000 ; if (&bx == null) { return }
    je return_print_string
    mov al, [bx] ; al = &bx
    inc bx ; bx++
    int 0x10 ; print(al)
    jmp print_compare
return_print_string:
    popa
    ret
