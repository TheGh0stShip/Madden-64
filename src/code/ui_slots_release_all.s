.text
.align 2
.set noreorder
.globl ui_slots_release_all
.ent ui_slots_release_all
ui_slots_release_all:
    lui $v0,%hi(D_800692AC)
    lw $v0,%lo(D_800692AC)($v0)
    addiu $sp,$sp,-0x28
    sw $s3,0x1c($sp)
    move $s3,$a0
    sw $ra,0x20($sp)
    sw $s2,0x18($sp)
    sw $s1,0x14($sp)
    beqz $v0,.Ldone
     sw $s0,0x10($sp)
    addiu $s0,$v0,-1
    lui $v1,%hi(D_8007947C)
    addiu $v1,$v1,%lo(D_8007947C)
    sll $v0,$s0,2
    addu $s1,$v0,$v1
.Lloop:
    lw $a0,0($s1)
    lw $v0,8($a0)
    lw $v0,0x24($v0)
    beqz $v0,.Lnext
     move $s2,$s0
    jal ui_slot_release
     move $a1,$s3
.Lnext:
    addiu $s1,$s1,-4
    bnez $s2,.Lloop
     addiu $s0,$s0,-1
.Ldone:
    lw $ra,0x20($sp)
    lw $s3,0x1c($sp)
    lw $s2,0x18($sp)
    lw $s1,0x14($sp)
    lw $s0,0x10($sp)
    addiu $sp,$sp,0x28
    jr $ra
     nop
.end ui_slots_release_all
