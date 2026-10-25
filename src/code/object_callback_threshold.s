.text
.align 2
.set noreorder
.globl object_callback_threshold
.ent object_callback_threshold
object_callback_threshold:
    addiu $sp,$sp,-0x18
    sw $ra,0x14($sp)
    sw $s0,0x10($sp)
    lw $s0,0($a0)
    bgez $a1,.Lpositive
     nop
    lw $v0,0x6c($s0)
    beqz $v0,.Lcall_negative
     nop
    lw $v0,0x68($s0)
    slti $v0,$v0,3
    bnez $v0,.Lincrement
     nop
.Lcall_negative:
    lw $v0,8($s0)
    jalr $v0
     nop
.Lincrement:
    lw $v0,0x6c($s0)
    addiu $v0,$v0,1
    j .Ldone
     sw $v0,0x6c($s0)
.Lpositive:
    lw $v0,0x68($s0)
    slt $v0,$v0,$a1
    bnez $v0,.Ldone
     nop
    lw $v0,8($s0)
    jalr $v0
     nop
.Ldone:
    lw $ra,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x18
    jr $ra
     nop
.end object_callback_threshold
