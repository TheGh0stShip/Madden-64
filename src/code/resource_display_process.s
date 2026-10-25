.text
.align 2
.set noreorder
.globl resource_display_process
.ent resource_display_process
resource_display_process:
    addiu       $sp, $sp, -0x48
    sw          $s3, 0x2C($sp)
    addu        $s3, $a0, $zero
    sw          $s1, 0x24($sp)
    addu        $s1, $a1, $zero
    sw          $s7, 0x3C($sp)
    lw          $s7, 0x58($sp)
    addiu       $a1, $sp, 0x10
    addiu       $a2, $zero, 0x2
    sw          $s0, 0x20($sp)
    addu        $s0, $a3, $zero
    addu        $a3, $zero, $zero
    sw          $ra, 0x44($sp)
    sw          $fp, 0x40($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    jal         func_80019868
    sw          $s2, 0x28($sp)
    lhu         $v0, 0x10($sp)
    beqz        $v0, .L80019D9C
    addu        $s5, $zero, $zero
    andi        $s1, $s1, 0xFFFF
    sw          $s1, 0x1C($sp)
    addu        $a0, $s3, $zero
.L80019B74:
    addiu       $a1, $sp, 0x12
    addiu       $a2, $zero, 0x2
    jal         func_80019868
    addu        $a3, $zero, $zero
    lhu         $a0, 0x12($sp)
    ori         $v0, $zero, 0x8000
    andi        $v1, $a0, 0xC000
    beq         $v1, $v0, .L80019BE0
    slt         $v0, $v0, $v1
    bnez        $v0, .L80019BB4
    ori         $v0, $zero, 0xC000
    addiu       $v0, $zero, 0x4000
    beq         $v1, $v0, .L80019D88
    nop
    j .L80019BF8
    nop
.L80019BB4:
    bne         $v1, $v0, .L80019BF8
    sll         $v0, $a0, 16
    lw          $t0, 0x1C($sp)
    sra         $v0, $v0, 16
    bltzl       $v0, .L80019BCC
    negu        $v0, $v0
.L80019BCC:
    .word       0x00480018  # mult        $v0, $t0
    .word       0x00001012  # mflo        $v0
    lw          $v1, 0x0($s0)
    j .L80019D7C
    addu        $v1, $v1, $v0
.L80019BE0:
    lw          $v0, 0x0($s0)
    lw          $t0, 0x1C($sp)
    addu        $v0, $s7, $v0
    addu        $v0, $v0, $t0
    j .L80019D88
    sb          $a0, 0x0($v0)
.L80019BF8:
    lhu         $s6, 0x12($sp)
    addu        $s4, $zero, $zero
    andi        $v0, $s6, 0xFFFF
    beqz        $v0, .L80019D84
    addu        $s2, $zero, $zero
    lhu         $v1, 0x10($sp)
    andi        $a0, $s5, 0xFFFF
    sltu        $v0, $zero, $v0
    sltu        $v1, $a0, $v1
    and         $v1, $v1, $v0
    beqz        $v1, .L80019D64
    addu        $fp, $a0, $zero
    addu        $a0, $s3, $zero
.L80019C2C:
    addiu       $a1, $sp, 0x14
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lbu         $v0, 0x14($sp)
    lw          $v1, 0x0($s0)
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x15
    addu        $v1, $v1, $v0
    sw          $v1, 0x0($s0)
    lbu         $v0, 0x14($sp)
    addiu       $a2, $zero, 0x1
    addiu       $a3, $zero, 0x2
    jal         func_80019868
    addu        $s1, $s2, $v0
    lb          $a2, 0x15($sp)
    blez        $a2, .L80019CB4
    addu        $s2, $s1, $zero
    addu        $a0, $s3, $zero
    lw          $a1, 0x0($s0)
    sll         $a2, $a2, 1
    andi        $a2, $a2, 0xFFFE
    addiu       $a3, $zero, 0x2
    jal         func_80019868
    addu        $a1, $s7, $a1
    lb          $v0, 0x15($sp)
    lw          $v1, 0x0($s0)
    sll         $v0, $v0, 1
    addu        $v1, $v1, $v0
    sw          $v1, 0x0($s0)
    lb          $v0, 0x15($sp)
    sll         $v0, $v0, 1
    j .L80019D44
    addu        $s2, $s1, $v0
.L80019CB4:
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x16
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    addu        $a0, $s3, $zero
    addiu       $a1, $sp, 0x17
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lb          $v0, 0x15($sp)
    bltzl       $v0, .L80019CE8
    negu        $v0, $v0
.L80019CE8:
    blez        $v0, .L80019D44
    addu        $a0, $zero, $zero
.L80019CF0:
    lw          $v0, 0x0($s0)
    lbu         $v1, 0x16($sp)
    addu        $v0, $s7, $v0
    sb          $v1, 0x0($v0)
    lw          $v0, 0x0($s0)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x0($s0)
    lbu         $v1, 0x17($sp)
    addu        $v0, $s7, $v0
    sb          $v1, 0x0($v0)
    lw          $v0, 0x0($s0)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x0($s0)
    lb          $v1, 0x15($sp)
    addiu       $a0, $a0, 0x1
    andi        $v0, $a0, 0xFFFF
    bltzl       $v1, .L80019D38
    negu        $v1, $v1
.L80019D38:
    slt         $v0, $v0, $v1
    bnez        $v0, .L80019CF0
    addiu       $s2, $s2, 0x2
.L80019D44:
    lhu         $v1, 0x10($sp)
    addiu       $s4, $s4, 0x1
    andi        $v0, $s4, 0xFFFF
    sltu        $v0, $v0, $s6
    sltu        $v1, $fp, $v1
    and         $v1, $v1, $v0
    bnez        $v1, .L80019C2C
    addu        $a0, $s3, $zero
.L80019D64:
    addiu       $s5, $s5, 0x1
    lw          $t0, 0x1C($sp)
    lw          $v1, 0x0($s0)
    andi        $v0, $s2, 0xFFFF
    subu        $v0, $t0, $v0
    addu        $v1, $v1, $v0
.L80019D7C:
    j .L80019D88
    sw          $v1, 0x0($s0)
.L80019D84:
    addiu       $s5, $s5, 0x1
.L80019D88:
    lhu         $v1, 0x10($sp)
    andi        $v0, $s5, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80019B74
    addu        $a0, $s3, $zero
.L80019D9C:
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end resource_display_process
