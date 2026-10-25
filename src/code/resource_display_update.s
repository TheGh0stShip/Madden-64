.text
.align 2
.set noreorder
.globl resource_display_update
.ent resource_display_update
resource_display_update:
    addiu       $sp, $sp, -0x40
    sw          $s3, 0x24($sp)
    addu        $s3, $a0, $zero
    sw          $s0, 0x18($sp)
    addu        $s0, $a1, $zero
    sw          $s6, 0x30($sp)
    lw          $s6, 0x50($sp)
    addiu       $a1, $sp, 0x10
    addiu       $a2, $zero, 0x2
    sw          $s1, 0x1C($sp)
    addu        $s1, $a3, $zero
    addu        $a3, $zero, $zero
    sw          $ra, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    jal         func_80019868
    sw          $s2, 0x20($sp)
    lhu         $v0, 0x10($sp)
    andi        $s0, $s0, 0xFFFF
    .word       0x00500018  # mult        $v0, $s0
    .word       0x00001012  # mflo        $v0
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x12
    addiu       $a2, $zero, 0x2
    addu        $a3, $zero, $zero
    jal         func_80019868
    sw          $v0, 0x0($s1)
    lhu         $v0, 0x12($sp)
    addu        $s5, $zero, $zero
    beqz        $v0, .L80019FA4
    addu        $s2, $zero, $zero
    addu        $s7, $s0, $zero
.L80019E54:
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x14
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lbu         $v0, 0x14($sp)
    beqz        $v0, .L80019F78
    addu        $s4, $zero, $zero
    addu        $a0, $s3, $zero
.L80019E78:
    addiu       $a1, $sp, 0x15
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lbu         $v0, 0x15($sp)
    lw          $v1, 0x0($s1)
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x16
    addu        $v1, $v1, $v0
    sw          $v1, 0x0($s1)
    lbu         $v0, 0x15($sp)
    addiu       $a2, $zero, 0x1
    addiu       $a3, $zero, 0x2
    jal         func_80019868
    addu        $s0, $s2, $v0
    lb          $a2, 0x16($sp)
    blez        $a2, .L80019EFC
    addu        $s2, $s0, $zero
    addu        $a0, $s3, $zero
    lw          $a1, 0x0($s1)
    andi        $a2, $a2, 0xFFFF
    addiu       $a3, $zero, 0x2
    jal         func_80019868
    addu        $a1, $s6, $a1
    lb          $v1, 0x16($sp)
    lw          $v0, 0x0($s1)
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($s1)
    lbu         $v0, 0x16($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    j .L80019F60
    addu        $s2, $v0, $s0
.L80019EFC:
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x17
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lb          $v0, 0x16($sp)
    bltzl       $v0, .L80019F1C
    negu        $v0, $v0
.L80019F1C:
    blez        $v0, .L80019F60
    addu        $a0, $zero, $zero
.L80019F24:
    lw          $v0, 0x0($s1)
    lbu         $v1, 0x17($sp)
    addu        $v0, $s6, $v0
    sb          $v1, 0x0($v0)
    lw          $v0, 0x0($s1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x0($s1)
    lb          $v1, 0x16($sp)
    addiu       $a0, $a0, 0x1
    andi        $v0, $a0, 0xFFFF
    bltzl       $v1, .L80019F54
    negu        $v1, $v1
.L80019F54:
    slt         $v0, $v0, $v1
    bnez        $v0, .L80019F24
    addiu       $s2, $s2, 0x1
.L80019F60:
    lbu         $v1, 0x14($sp)
    addiu       $s4, $s4, 0x1
    andi        $v0, $s4, 0xFFFF
    sltu        $v0, $v0, $v1
    bnel        $v0, $zero, .L80019E78
    addu        $a0, $s3, $zero
.L80019F78:
    andi        $v0, $s2, 0xFFFF
    lw          $v1, 0x0($s1)
    subu        $v0, $s7, $v0
    addu        $v1, $v1, $v0
    sw          $v1, 0x0($s1)
    lhu         $v1, 0x12($sp)
    addiu       $s5, $s5, 0x1
    andi        $v0, $s5, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80019E54
    addu        $s2, $zero, $zero
.L80019FA4:
    lw          $ra, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end resource_display_update
