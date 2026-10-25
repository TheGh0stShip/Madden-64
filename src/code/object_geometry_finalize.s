.text
.align 2
.set noreorder
.globl object_geometry_finalize
.ent object_geometry_finalize
object_geometry_finalize:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $s0, 0x1A4($s1)
    addu        $s4, $a1, $zero
    lw          $v0, 0x30($s0)
    addu        $s2, $a2, $zero
    bnez        $v0, .L8005B2E8
    addu        $s3, $a3, $zero
    lw          $v0, 0x40($s0)
    lw          $v1, 0x1A8($s1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a1, 0x38($v0)
    lw          $v0, 0xC($v1)
    jalr        $v0
    nop
    beqz        $v0, .L8005B42C
    addiu       $v1, $zero, 0x1
    lw          $v0, 0x4C($s0)
    sw          $v1, 0x30($s0)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x4C($s0)
.L8005B2E8:
    lw          $v1, 0x44($s0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8005B3A0
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L8005B310
    addiu       $v0, $zero, 0x2
    beql        $v1, $zero, .L8005B374
    sw          $zero, 0x34($s0)
    j .L8005B42C
    nop
.L8005B310:
    bne         $v1, $v0, .L8005B42C
    addu        $a0, $s1, $zero
    lw          $v1, 0x1AC($s1)
    lw          $v0, 0x40($s0)
    sw          $s4, 0x10($sp)
    sw          $s2, 0x14($sp)
    sw          $s3, 0x18($sp)
    lw          $a3, 0x48($s0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a1, 0x38($v0)
    lw          $v0, 0x4($v1)
    jalr        $v0
    addiu       $a2, $s0, 0x34
    lw          $v0, 0x34($s0)
    lw          $v1, 0x48($s0)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8005B42C
    nop
    sw          $zero, 0x44($s0)
    lw          $v0, 0x0($s2)
    sltu        $v0, $v0, $s3
    beqz        $v0, .L8005B42C
    nop
    sw          $zero, 0x34($s0)
.L8005B374:
    lw          $v0, 0x138($s1)
    lw          $v1, 0x4C($s0)
    addiu       $v0, $v0, -0x1
    sw          $v0, 0x48($s0)
    lw          $v0, 0x13C($s1)
    bne         $v1, $v0, .L8005B39C
    addiu       $v0, $zero, 0x1
    jal         func_8005AFD0
    addu        $a0, $s1, $zero
    addiu       $v0, $zero, 0x1
.L8005B39C:
    sw          $v0, 0x44($s0)
.L8005B3A0:
    lw          $v1, 0x1AC($s1)
    lw          $v0, 0x40($s0)
    sw          $s4, 0x10($sp)
    sw          $s2, 0x14($sp)
    sw          $s3, 0x18($sp)
    lw          $a3, 0x48($s0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a1, 0x38($v0)
    lw          $v0, 0x4($v1)
    addu        $a0, $s1, $zero
    jalr        $v0
    addiu       $a2, $s0, 0x34
    lw          $v0, 0x34($s0)
    lw          $v1, 0x48($s0)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8005B42C
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x4C($s0)
    bne         $v1, $v0, .L8005B3FC
    nop
    jal         func_8005AE90
    addu        $a0, $s1, $zero
.L8005B3FC:
    lw          $v0, 0x40($s0)
    sw          $zero, 0x30($s0)
    xori        $v0, $v0, 0x1
    sw          $v0, 0x40($s0)
    lw          $v0, 0x138($s1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x34($s0)
    lw          $v0, 0x138($s1)
    addiu       $v1, $zero, 0x2
    sw          $v1, 0x44($s0)
    addiu       $v0, $v0, 0x2
    sw          $v0, 0x48($s0)
.L8005B42C:
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end object_geometry_finalize
