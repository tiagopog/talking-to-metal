global start

start:
  mov rsi, 0 ; i = 0
  jmp loop   ; Jump to the loop code

loop:
  cmp rsi, 100 ; Compare i to 100
  je exit      ; Exit if i == 100
  inc rsi      ; i++
  jmp loop     ; Continue the loop

exit:
  mov rax, 0x2000001 ; Exit
  mov rdi, rsi       ; The result goes on the exit status, check it with: $ ./loop; echo $?
  syscall
