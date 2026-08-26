section .data
    greeting1 db 'Hello', 0x0a, 0
    greeting1Len equ $ - greeting1
    greeting2 db 'World!', 0x0a
    greeting2Len equ $ - greeting2
    newline db 0x0a

section .text
    global _start

_start:
    mov rdi, greeting1
    call strlen

    ;mov rdi, greeting1
    ;mov rsi, greeting1Len
    ;call print

    ;mov rdi, greeting2
    ;mov rsi, greeting2Len
    ;call print

    ;mov rdi, newline
    ;mov rsi, 1 
    ;call print

    mov rdi, rax
    mov rax, 60
    syscall

print:
    ;RDI = address of string
    ;RSI = length of string
    mov rdx, rsi
    mov rsi, rdi
    mov rax, 1
    mov rdi, 1
    syscall
    ret

strlen:
    ;RDI = address of null-terminated string
    ;RAX = resulting length
    mov rax, 0

.loop:
    mov bl, [rdi]
    cmp bl, 0
    je .done

    inc rax
    inc rdi
    jmp .loop

.done:
    ret