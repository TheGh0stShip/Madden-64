.text
.align 2
.set noreorder
.globl resource_tnmf_resolve
.ent resource_tnmf_resolve
resource_tnmf_resolve:
    addiu $sp,$sp,-0x18
    sw $s0,0x10($sp)
    move $s0,$a0
    sw $ra,0x14($sp)
    lhu $a0,0($s0)
    lhu $a1,2($s0)
    jal func_800364E4
     nop
    bgez $v0,.Llookup
     nop
    lhu $a0,0($s0)
    lhu $a1,2($s0)
    jal func_80035D7C
     nop
    j .Ldone
     nop
.Llookup:
    lhu $a0,0($s0)
    lhu $a1,2($s0)
    jal func_80035D7C
     nop
    move $s0,$v0
    lw $v1,0($v0)
    lui $v0,0x544e
    ori $v0,$v0,0x4d46
    bnel $v1,$v0,.Lzero
     move $s0,$zero
    lhu $v1,6($s0)
    addiu $v0,$zero,2
    bnel $v1,$v0,.Lzero
     move $s0,$zero
    jal func_8000E518
     move $a0,$s0
    j .Ldone
     move $v0,$s0
.Lzero:
    move $v0,$s0
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end resource_tnmf_resolve
