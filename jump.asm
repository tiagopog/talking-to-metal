global start

section .text

start:
  jmp print

; Write to stdout
print:
  mov rax, 0x2000004
  mov rdi, 1
  mov rsi, foo
  mov rdx, len
  syscall
  jmp exit

; Exit status
exit:
  mov rax, 0x2000001
  mov rdi, 0
  syscall

section .data
  foo: db "Jumped!", 0x0a
  len: equ $ - foo
