    #==============================
    # data segment
    #==============================
    .data

y:  .asciiz "y"

    .globl main    # Required by MARS

    #==============================
    # text segment
    #==============================
    .text

    #------------------------------
    # MAIN function
    #------------------------------
    # $a0 = argc, $a1 = argv.

main:
    bne $a0, $zero, main_else      # If given command-line args, goto main_else    
    la $s0, y                      # Else, we want to print "y" --- recall syscall might not preserve temporary registers, so best to use $s0 for the address 
    j main_loop                    # goto main_loop

main_else:
    lw $s0, 0($a1)                 # Point $s0 at argv[0] ---- Note in MIPS/MARS this is not the file name itself
    j main_loop                    # goto main_loop    

main_loop:
    add $a0, $s0, $zero            # Load address into syscall arg
    li $v0, 4                      # Syscall op for print string
    syscall                        # Call the OS

    li $a0, 10                     # Also print newline
    li $v0, 11                     
    syscall

    j main_loop                    # goto main_loop

    li $v0, 10                     # Standard way to end the program (though in this case, it is unreachable)
    syscall
