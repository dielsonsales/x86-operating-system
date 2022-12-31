; A simple boot sector that prints "Hello World"

mov ah, 0x0e ; Teletype BIOS routine

mov al, 'H'
int 0x10 ; Interrupt instruction
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10
mov al, ' '
int 0x10
mov al, 'W'
int 0x10
mov al, 'o'
int 0x10
mov al, 'r'
int 0x10
mov al, 'l'
int 0x10
mov al, 'd'
int 0x10

jmp $ ; Jump to the current address forever

times 510-($-$$) db 0 ; Pad the boot sector with zeroes

dw 0xaa55 ; Lets BIOS know this is a boot sector