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
    popa ; Pops all registers back
    ret

print_hex:
    pusha ; Pushes all registers to the stack
    mov ah, 0x0e ; Bios tele-type output
    mov al, '0' ; al = '0'
    int 0x10 ; print(al)
    mov al, 'x' ; al = 'x'
    int 0x10 ; print(al)

    mov word bx, dx ; bx = dx
    shr bx, 12
    call ascii_value

    mov word bx, dx ; bx = dx
    shr bx, 8
    call ascii_value

    mov word bx, dx ; bx = dx
    shr bx, 4
    call ascii_value

    mov word bx, dx ; bx = dx
    call ascii_value
    popa ; Pops all registers back
    ret

ascii_value:
    and bx, 0x0F ; removes the first 8 bits
    cmp bl, 0x09
    jle ascii_for_number
    jmp ascii_for_letter
print_ascii_value:
    mov al, bl ; al = bl
    int 0x10 ; print(al)
    ret

ascii_for_number:
    add bx, 0x0030
    jmp print_ascii_value

ascii_for_letter:
    add bx, 0x0037
    jmp print_ascii_value

