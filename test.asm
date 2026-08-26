section .data
    greeting1 db 'Hello', 0x0a
    greeting1Len equ $ - greeting1
    greeting2 db 'World!', 0x0a
    greeting2Len equ $ - greeting2
    newline db 0x0a

section .text
    global _start

_start:
    mov rsi, greeting1
    mov rdx, greeting1Len
    call print

    mov rsi, greeting2
    mov rdx, greeting2Len
    call print

    mov rsi, newline
    mov rdx, 1 
    call print

    mov rax, 60
    mov rdi, 0
    syscall

print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret