.text
.align 2
.set noreorder
.globl top_bits_dispatch
.ent top_bits_dispatch
top_bits_dispatch:
    addiu $sp,$sp,-0x18
    sw $ra,0x10($sp)
    lw $v0,0($a0)
    srl $v1,$v0,30
    addiu $v0,$zero,1
    beq $v1,$v0,.Lcase1
     slti $v0,$v1,2
    beql $v0,$zero,.Lupper
     addiu $v0,$zero,2
    beqz $v1,.Lcase0
     nop
    j .Lreturn
     nop
.Lupper:
    beq $v1,$v0,.Lcase2
     addiu $v0,$zero,3
    beq $v1,$v0,.Lcase3
     nop
    j .Lreturn
     nop
.Lcase0:
    jal func_8002B624
     nop
    j .Lreturn
     nop
.Lcase1:
    jal func_8002B870
     nop
    j .Lreturn
     nop
.Lcase2:
    jal func_8002BA18
     nop
    j .Lreturn
     nop
.Lcase3:
    jal func_8002BBB0
     nop
.Lreturn:
    lw $ra,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end top_bits_dispatch
