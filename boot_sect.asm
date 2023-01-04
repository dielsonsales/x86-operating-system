; A simple boot sector that prints a string

[org 0x7c00] ; Tell the assembler where this code will be loaded
             ; Automatically offsets the addresses with this value

; mov bx, HELLO_MSG ; bx = &HELLO_MSG
; call print_string

; mov bx, GOODBYE_MSG ; bx = &GOODBYE_MSG
; call print_string

mov dx, 0x1fb6 ; 0001 1111 1011 0110
call print_hex

jmp $ ; Halts forever

%include "print_string.asm"

HELLO_MSG:
    db 'Hello, World!', 0

LINE_BREAK:
    db 0x000A, 0 ; Line break character

GOODBYE_MSG:
    db 'Goodbye', 0

HEX_OUT:
    db '0x0000', 0

times 510-($-$$) db 0 ; Pads the boot sector with zeroes and adds BIOS bootable number
dw 0xaa55 ; Lets BIOS know this is a boot sector

; 0001 1111 1011 0110 >> 8
; 0000 0000 0001 1111
; 