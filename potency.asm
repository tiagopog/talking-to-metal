;;;
; $ nasm -f macho64 potency.asm
; $ ld -macosx_version_min 10.7.0 -lSystem -o potency potency.o
; $ ./potency; echo $?
;;;
global start

start:
  mov rax, 3 ; exponent = 3
  mov rsi, 2 ; base = 2

  cmp rax, 0 ; if exponent == 0
  je one     ; then jump to "one"

  mov rdx, rsi ; result = base
  jmp loop     ; jump to "loop"

one:
 mov rdx, 1 ; result = 1
 jmp exit   ; jump to "exit"

loop:
  dec rax    ; exponent--
  cmp rax, 0 ; if exponenet == 0
  je exit    ; then jump to "exit"

  imul rdx, rsi ; result *= base
  jmp loop      ; jump to "loop"

exit:
  mov rax, 0x2000001 ; exit syscall
  mov rdi, rdx       ; exit status = result
  syscall            ; call

