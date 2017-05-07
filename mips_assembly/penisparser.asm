# s0: file descriptor for input file
# s1: file descriptor for output file
# s2: previous character
# s3: current character

.data
one_arg: .asciiz "Only one command line argument por favor\n"
error: .asciiz "Error"
out: .asciiz "result.txt"
penis: .ascii "penis"
buf: .space 1

.text
main:
	addi $a0, $a0, -1 # Checks if there's exactly one command line argument
	bne $a0, $zero, only_one_arg

	li $v0, 13	# Opens input file for reading
	lw $a0, 0($a1)
	li $a1, 0
	li $a2, 0
	syscall
	blt $v0, $zero, exit_error # Error check
	move $s0, $v0
	
	li $v0, 13	# Opens output file for writing
	la $a0, out
	li $a1, 1
	li $a2, 0
	syscall
	blt $v0, $zero, exit_error # Error check
	move $s1, $v0
	
	li $s2, 0x20
	
read_loop: # Loops through every character and writes penis when appropriate
	li $v0, 14	# Reads 1 character from input file
	move $a0, $s0
	la $a1, buf
	li $a2, 1
	syscall
	
	beqz $v0, end	# End of file
	blt $v0, $zero, exit_error # Error
	
	lb $s3, 0($a1)	# $a1 already has the address to the buffer
	
	# Here's the interesting part:
	# For this part, I will refer to a character as anything but whitespace
	# a.k.a. ASCII codes 33-255 in decimal
	# - If we have a character before a character, do nothing
	# - If we have a character before a whitespace, do nothing
	# - If we have a whitespace before a character, write "penis" then the whitespace
	# - If we have a whitespace before a whitespace, write just the whitespace
	# - If we reach the end of the file and the previous character is a character,
	#   write penis
	# - If we reach the end of file and a whitespace was before it, do nothing

character: # Deals with characters
	ble $s3, 0x20, whitespace # You're a whitespace GTFO
	move $s2, $s3
	j read_loop

whitespace: # Deals with whitespace
	ble $s2, 0x20, w_w
	jal write_penis

w_w:	# Whitespace before whitespace
	li $v0, 15 	# Write whitespace to the output file
	move $a0, $s1
	la $a1, buf
	li $a2, 1
	syscall
	bne $v0, 1, exit_error # Must write exactly 1 whitespace, error otherwise
	move $s2, $s3
	j read_loop

write_penis: # Write penis to the output file
	li $v0, 15	
	move $a0, $s1
	la $a1, penis
	li $a2, 5
	syscall
	bne $v0, 5, exit_error # Must write exactly 5 characters, error otherwise
	jr $ra

end:	# End of file
	ble $s3, 0x20, exit
	jal write_penis

exit: 	# Exit without error
	li $v0, 17
	li $a0, 0
	syscall

only_one_arg: # Tells the user to enter only one command line argument
	li $v0, 4
	la $a0, one_arg
	syscall

exit_error: # Exit with error
	li $v0, 4
	la $a0, error
	syscall
	li $v0, 17
	li $a0, 1
	syscall
