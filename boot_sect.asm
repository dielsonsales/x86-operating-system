; A simple boot sector that prints "Hello World"

mov bx, 0x0032

cmp bx, 0x0004 ; Compares with 4
jle block_less_than_or_equal_4 ; If less than or equal to 4, jumps to block_less_than_4
cmp bx, 0x0028 ; Compares with 40
jl block_less_than_40 ; If less than 40, jumps to block block_less_than_40
jmp block_else ; If none of the above, jumps to block block_else

block_less_than_or_equal_4:
    mov al, 'A' ; Makes al = 'A'
	jmp block_end

block_less_than_40:
    mov al, 'B' ; Makes al = 'B'
	jmp block_end

block_else:
    mov al, 'C' ; Makes al = 'C'
	jmp block_end

block_end:
    mov ah, 0x0e ; Scrolling teletype BIOS routine
	int 0x10 ; print character in al

times 510-($-$$) db 0 ; Pads the boot sector with zeroes and adds BIOS bootable number
dw 0xaa55 ; Lets BIOS know this is a boot sector