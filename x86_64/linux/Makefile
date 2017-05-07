all: assemble link

assemble: penis.asm
	nasm -f elf64 -o penis.o penis.asm

link: penis.o
	ld -o penis penis.o

clean:
	rm -f penis penis.o
