global start

; Main code
section .text

start:
  ; Write to stdout
  mov rax, 0x2000004 ; syscall: write
  mov rdi, 1         ; "rdi" tells where to write (stdout file descriptor: 1)
  mov rsi, msg       ; "rsi" stores the byte string to be used
  mov rdx, len       ; "rdx" stores the string length
  syscall

  ; Exit status
  mov rax, 0x2000001 ; syscall: exit
  mov rdi, 0         ; exit status
  syscall

; Inline data
section .data                   ; allow to create inline data tha can be referenced in the code by name
  msg: db "Hello, world!", 0x0a ; stores and name the string of bytes as "msg"
                                ; 0x0a (10) is the hex for the ASCII's new line char
  len: equ $ - msg              ; takes the length of the string by substracting its initial and final location

