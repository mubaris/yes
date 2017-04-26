global _main
global _start
extern _puts

section .text
_main:
  add rsi, 8
_start:
  push rdi
  push rsi
comp:
  sub rsp, 8
  cmp rdi, 1
  jg nz
  je zero
nz:
  mov rdi, [rsi]
  jmp loop
zero:
  mov rdi, y
loop:
  call _puts
  add rsp, 8
  pop rsi
  pop rdi
  jmp _start
  ret

section .data
y: db 'y'
