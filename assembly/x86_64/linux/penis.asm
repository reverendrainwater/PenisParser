section .data

    usage_message db "I WROTE THIS BULLSHIT IN FUCKING RAW x86 THE LEAST YOU COULD DO IS GIVE ME A FUCKING FILENAME YOU LAZY FUCK", 0xA, 0
    invalid_file_message db "THAT ISN'T EVEN A VALID FILE YOU MORONIC PIECE OF SHIT", 0xA, 0
    io_error_message db "OH SHIT IO ERROR", 0xA, 0
    penis db "penis", 0

section .bss

    char_buffer: resb 1

section .text

global _start

_start:

    pop	rax         ; pop first item off stack (number of args)
    cmp rax,    2   ; compare number of arguments to 2
    jl  usage       ; if fewer than two arguments given, go to usage label

    pop rdi         ; pop first argument (program path) off stack

    mov rax,    2   ; syscall 2 = open
    pop rdi         ; pop second argument (name of file to work with) into rdi
    xor rsi,    rsi ; zero-out rsi (flags = 0 = O_RDONLY)
    xor rdx,    rdx ; zero-out rdx (don't care about mode);
    syscall

    cmp rax,    0   ; check to see if the syscall succeeded
    jl  invalid_file    ; if the resulting file descriptor is less than 0, the syscall failed

    mov rbx,    rax ; save the file descriptor in rbx for the rest of the program

read_write_loop:
    call read_char  ; read a single character from the file
    call test_is_whitespace ; determine whether or not the character is whitespace
    cmp rax,    1
    jne consume_word

print_char_buffer:
    mov rax,    1   ; syscall 1 = write
    mov rdi,    1   ; file descriptor 1 = stdout
    mov rsi,    char_buffer
    mov rdx,    1
    syscall         ; print our single-character buffer, which should currently contain whitespace

    jmp read_write_loop

consume_word:
    call read_char  ; read a new character
    call test_is_whitespace ; test whether or not it's whitespace
    cmp rax,    1
    jne consume_word    ; keep reading until a whitespace character is read

    mov rax,    1   ; syscall 1 = write
    mov rdi,    1   ; file descriptor 1 = stdout
    mov rsi,    penis   ; want to print out penis
    mov rdx,    5   ; know penis is five bytes long
    syscall

    jmp print_char_buffer

test_is_whitespace: ; 90% sure there's a better way to do this but oh well
    cmp rax,    9
    je whitespace_true
    cmp rax,    10
    je whitespace_true
    cmp rax,    11
    je whitespace_true
    cmp rax,    12
    je whitespace_true
    cmp rax,    13
    je whitespace_true
    cmp rax,    32
    je whitespace_true
whitespace_false:
    mov rax,    0
    ret
whitespace_true:
    mov rax,    1
    ret

success_exit:
    mov rax,    60
    mov rdi,    0
    syscall

read_char:
    mov rax,    0   ; syscall 0 = read
    mov rdi,    rbx ; move rbx (the descriptor for the source file) into rdi
    mov rsi,    char_buffer ; specify the location of our buffer
    mov rdx,    1    ; our buffer is only a single byte long
    syscall         ; read a single character into our buffer

    cmp rax,    0   ; compare the number of bytes read to 0
    jl  io_error        ; if we read fewer than 0 bytes, an IO error occurred

    cmp rax,    0   ; again compare the number of bytes read to 0
    je  success_exit    ; if we read 0 bytes, we reached the end of the file

    mov rax,    [char_buffer] ; otherwise, return the character that was read
    ret

usage:
    mov rsi,    usage_message   ; writing the usage message
    mov rdx,    108 ; know that the message is 108 bytes long
    jmp error_message

invalid_file:
    mov rsi,    invalid_file_message    ; writing the invalid file message
    mov rdx,    55  ; know that the message is 55 bytes long
    jmp error_message

io_error:
    mov rsi,    io_error_message    ; writing the IO error message
    mov rdx,    17  ; know that the message is 17 bytes long
    ; jmp error_message

error_message:
    mov rax,    1   ; syscall 1 = write
    mov rdi,    2   ; file descriptor 2 = stderr
    syscall         ; print the message (assuming rsi and rdx are already populated)
    ; jmp error_exit

error_exit:
    mov rax,    60  ; syscall 60 = exit
    mov rdi,    69  ; non-zero exit status to indicate an error occurred
    syscall
