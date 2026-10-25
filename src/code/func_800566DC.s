.text
.align 2
.set noreorder
.globl func_800566DC
.ent func_800566DC
func_800566DC:
    addiu       $sp, $sp, -0x38
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    lw          $v0, 0x144($s0)
    blez        $v0, .L800567E0
    addu        $s3, $zero, $zero
    addiu       $s5, $zero, 0x33
    addu        $s4, $s0, $zero
.L80056714:
    lw          $s2, 0x148($s4)
    lw          $v0, 0x4C($s2)
    bnez        $v0, .L800567CC
    nop
    lw          $s1, 0x10($s2)
    sltiu       $v0, $s1, 0x4
    beqz        $v0, .L80056744
    sll         $v0, $s1, 2
    addu        $v0, $v0, $s0
    lw          $v0, 0xA4($v0)
    bnez        $v0, .L80056764
    nop
.L80056744:
    lw          $v0, 0x0($s0)
    sw          $s5, 0x14($v0)
    lw          $v0, 0x0($s0)
    sw          $s1, 0x18($v0)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80056764:
    lw          $v0, 0x4($s0)
    addu        $a0, $s0, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x84
    sll         $v1, $s1, 2
    addu        $v1, $v1, $s0
    lw          $a2, 0xA4($v1)
    addu        $t1, $v0, $zero
    addu        $a3, $t1, $zero
    addiu       $t0, $a2, 0x80
.L80056794:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L80056794
    addiu       $a3, $a3, 0x10
    lw          $v0, 0x0($a2)
    sw          $v0, 0x0($a3)
    sw          $t1, 0x4C($s2)
.L800567CC:
    lw          $v0, 0x144($s0)
    addiu       $s3, $s3, 0x1
    slt         $v0, $s3, $v0
    bnez        $v0, .L80056714
    addiu       $s4, $s4, 0x4
.L800567E0:
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800566DC
