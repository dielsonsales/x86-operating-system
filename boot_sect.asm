; A simple boot sector that prints a string

[org 0x7c00] ; Tell the assembler where this code will be loaded
             ; Automatically offsets the addresses with this value

mov bx, HELLO_MSG ; bx = &HELLO_MSG
call print_string

mov bx, LINE_BREAK ; bx = &LINE_BREAK
call print_string

mov bx, GOODBYE_MSG ; bx = &GOODBYE_MSG
call print_string

jmp $ ; Halts forever

%include "print_string.asm"

HELLO_MSG:
    db 'Hello, World!', 0

LINE_BREAK:
    db 0x000A, 0 ; Line break character

GOODBYE_MSG:
    db 'Goodbye', 0

times 510-($-$$) db 0 ; Pads the boot sector with zeroes and adds BIOS bootable number
dw 0xaa55 ; Lets BIOS know this is a boot sector