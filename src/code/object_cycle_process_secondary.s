.text
.align 2
.set noreorder
.globl object_cycle_process_secondary
.ent object_cycle_process_secondary
object_cycle_process_secondary:
    addu        $s0, $a0, $zero
    sw          $ra, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    lw          $v0, 0x18C($s0)
    lw          $s4, 0x1B8($s0)
    bnez        $v0, .L80058DD8
    addiu       $v0, $zero, 0x3F
    lw          $v1, 0x190($s0)
    bne         $v1, $v0, .L80058DD8
    nop
    lw          $v0, 0x194($s0)
    bnez        $v0, .L80058DD8
    nop
    lw          $v0, 0x198($s0)
    beqz        $v0, .L80058DF8
    nop
.L80058DD8:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x76
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $zero, -0x1
.L80058DF8:
    lw          $v0, 0x144($s0)
    blez        $v0, .L80058EE8
    addu        $s3, $zero, $zero
    addiu       $s7, $zero, 0x31
    addu        $s6, $s4, $zero
    addu        $s5, $s0, $zero
.L80058E10:
    lw          $v0, 0x148($s5)
    lw          $s1, 0x14($v0)
    lw          $s2, 0x18($v0)
    sltiu       $v0, $s1, 0x4
    beqz        $v0, .L80058E38
    sll         $v0, $s1, 2
    addu        $v0, $v0, $s0
    lw          $v0, 0xB4($v0)
    bnez        $v0, .L80058E5C
    sltiu       $v0, $s2, 0x4
.L80058E38:
    lw          $v0, 0x0($s0)
    sw          $s7, 0x14($v0)
    lw          $v0, 0x0($s0)
    sw          $s1, 0x18($v0)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    sltiu       $v0, $s2, 0x4
.L80058E5C:
    beqz        $v0, .L80058E74
    sll         $v0, $s2, 2
    addu        $v0, $v0, $s0
    lw          $v0, 0xC4($v0)
    bnez        $v0, .L80058E98
    addu        $a0, $s0, $zero
.L80058E74:
    lw          $v0, 0x0($s0)
    sw          $s7, 0x14($v0)
    lw          $v0, 0x0($s0)
    sw          $s2, 0x18($v0)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
.L80058E98:
    sll         $a2, $s1, 2
    addu        $v0, $a2, $s0
    lw          $a1, 0xB4($v0)
    addiu       $a2, $a2, 0x28
    addu        $a2, $s4, $a2
    jal         func_80058F2C
    addiu       $s5, $s5, 0x4
    addu        $a0, $s0, $zero
    sll         $a2, $s2, 2
    addu        $v0, $a2, $s0
    lw          $a1, 0xC4($v0)
    addiu       $a2, $a2, 0x38
    jal         func_80058F2C
    addu        $a2, $s4, $a2
    sw          $zero, 0x14($s6)
    lw          $v0, 0x144($s0)
    addiu       $s3, $s3, 0x1
    slt         $v0, $s3, $v0
    bnez        $v0, .L80058E10
    addiu       $s6, $s6, 0x4
.L80058EE8:
    sw          $zero, 0xC($s4)
    sw          $zero, 0x8($s4)
    sw          $zero, 0x10($s4)
    lw          $v0, 0x114($s0)
    sw          $v0, 0x24($s4)
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
.end object_cycle_process_secondary
