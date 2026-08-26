section .data
    greeting1 db 'Hello', 0x0a, 0
    greeting2 db 'World!', 0x0a, 0
    newline db 0x0a

section .text
    global _start

_start:
    mov rdi, greeting1
    call print

    mov rdi, greeting2
    call print

    mov rdi, newline
    call print

    mov rdi, rax
    mov rax, 60
    syscall

print:
    ;RDI = address of string
    ;RSI = length of string
    mov rcx, rdi
    call strlen
    mov rdx, rax
    mov rsi, rcx
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