all:
	nasm boot_sect.asm -f bin -o boot_sect.bin

clean:
	rm boot_sect.bin
