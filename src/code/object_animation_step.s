.text
.align 2
.set noreorder
.globl object_animation_step
.ent object_animation_step
object_animation_step:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s3, 0x14($s2)
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
    bnez        $s0, .L80057910
    nop
    lw          $v0, 0xC($s3)
    jalr        $v0
    nop
    beqz        $v0, .L80057A84
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80057910:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80057940
    sll         $s6, $v0, 8
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80057A84
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80057940:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addu        $s6, $s6, $v0
    addiu       $s6, $s6, -0x2
    blez        $s6, .L80057A78
    addiu       $s1, $s1, 0x1
.L80057958:
    bnez        $s0, .L8005797C
    nop
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80057A84
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L8005797C:
    lbu         $s4, 0x0($s1)
    addiu       $s0, $s0, -0x1
    bnez        $s0, .L800579A8
    addiu       $s1, $s1, 0x1
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80057A84
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L800579A8:
    lbu         $s5, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    addiu       $s6, $s6, -0x2
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x4E
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    sw          $s4, 0x18($v0)
    lw          $v0, 0x0($s2)
    sw          $s5, 0x1C($v0)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x4($v0)
    addu        $a0, $s2, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
    sltiu       $v0, $s4, 0x20
    bnez        $v0, .L80057A1C
    slti        $v0, $s4, 0x10
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x1A
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    sw          $s4, 0x18($v0)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
    slti        $v0, $s4, 0x10
.L80057A1C:
    bnez        $v0, .L80057A30
    addu        $v1, $s2, $s4
    addu        $v0, $s2, $s4
    j .L80057A70
    sb          $s5, 0xF4($v0)
.L80057A30:
    andi        $v0, $s5, 0xF
    sb          $v0, 0xE4($v1)
    lbu         $a0, 0xE4($v1)
    sra         $v0, $s5, 4
    sb          $v0, 0xF4($v1)
    sltu        $v0, $v0, $a0
    beqz        $v0, .L80057A70
    addiu       $v0, $zero, 0x1B
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    sw          $s5, 0x18($v0)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80057A70:
    bgtz        $s6, .L80057958
    nop
.L80057A78:
    addiu       $v0, $zero, 0x1
    sw          $s1, 0x0($s3)
    sw          $s0, 0x4($s3)
.L80057A84:
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end object_animation_step
