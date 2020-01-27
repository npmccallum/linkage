    .text
    .globl _start
    .type _start, @function

_start:
    call       get_msg
    mov %rax,  %r15

    call       get_len
    mov %rax,  %r14

    mov $1,    %rax /* SYS_write */
    mov $1,    %rdi /* STDOUT_FILENO */
    mov %r15,  %rsi /* string */
    mov %r14,  %rdx /* length */
    syscall

    mov $60,   %rax /* SYS_exit */
    mov $0,    %rdi /* exit status */
    syscall
