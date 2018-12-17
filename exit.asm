global start         ; Make the identifier "start" accessible to the linker;
start:               ; Create a label for the code with the identifier "start";
  mov rax, 0x2000001 ; The "rax" register value defines which system call will be made, in this case: exit;
  mov rdi, 62        ; The "rdi" register will store the exit status code;
  sub rdi, 20        ; Just an example of a substraction on the "rdi" register value
  syscall            ; Interrupt and gives control to an interrupt handler, in this case the handler is a sytem call ("syscall" or "int 0x80").
                     ;   The system call it makes is determined by the "rax" register.
                     ;   This is the same as doing the "exit(42)" system call.
