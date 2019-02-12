;;;
; $ nasm -f macho64 fibonacci.asm
; $ ld -macosx_version_min 10.7.0 -lSystem -o fibonacci fibonacci.o
; $ ./fibonacci; echo $?
;;;
global start

start:
  mov rax, 8       ; position = {{fibonacci position e.g. 8}}
  cmp rax, 1       ; if position <= 1
  jle first_values ; then jump to "first_values"

  mov rdi, 0 ; first = 0
  mov rdx, 1 ; second = 1
  jmp loop   ; jump to "loop"

first_values:
  mov rsi, rax ; current = position
  jmp exit     ; jump to "exit"

loop:
  mov rsi, rdi ; current = first
  add rsi, rdx ; currrent += second

  mov rdi, rdx ; first = second
  mov rdx, rsi ; second = current

  dec rax    ; position--
  cmp rax, 1 ; if position > 1
  jg loop    ; then jump to "loop"
  jmp exit   ; else jump to "exit"

exit:
  mov rax, 0x2000001 ; exit syscall
  mov rdi, rsi       ; exit status = current
  syscall            ; call
