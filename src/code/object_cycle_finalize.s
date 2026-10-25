.text
.align 2
.set noreorder
.globl object_cycle_finalize
.ent object_cycle_finalize
object_cycle_finalize:
    addiu       $sp, $sp, -0x30
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a1, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a2, $zero
    sw          $s6, 0x28($sp)
    sw          $ra, 0x2C($sp)
    sw          $s5, 0x24($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
    slti        $v0, $s3, 0x19
    beqz        $v0, .L800592A8
    addu        $s6, $a3, $zero
    addiu       $s5, $zero, 0xFF
.L8005919C:
    lw          $v0, 0x8($s2)
    bnel        $v0, $zero, .L80059244
    slt         $v0, $s3, $s6
    bnez        $s0, .L800591DC
    nop
    lw          $a0, 0x14($s2)
    lw          $v0, 0x14($a0)
    lw          $v0, 0xC($v0)
    jalr        $v0
    nop
    beqz        $v0, .L800592BC
    addu        $v0, $zero, $zero
    lw          $v0, 0x14($s2)
    lw          $v0, 0x14($v0)
    lw          $s1, 0x0($v0)
    lw          $s0, 0x4($v0)
.L800591DC:
    lbu         $v1, 0x0($s1)
    addiu       $s0, $s0, -0x1
    bne         $v1, $s5, .L80059290
    addiu       $s1, $s1, 0x1
.L800591EC:
    bnez        $s0, .L80059220
    nop
    lw          $a0, 0x14($s2)
    lw          $v0, 0x14($a0)
    lw          $v0, 0xC($v0)
    jalr        $v0
    nop
    beqz        $v0, .L800592BC
    addu        $v0, $zero, $zero
    lw          $v0, 0x14($s2)
    lw          $v0, 0x14($v0)
    lw          $s1, 0x0($v0)
    lw          $s0, 0x4($v0)
.L80059220:
    lbu         $v1, 0x0($s1)
    addiu       $s0, $s0, -0x1
    beq         $v1, $s5, .L800591EC
    addiu       $s1, $s1, 0x1
    bnel        $v1, $zero, .L80059240
    sw          $v1, 0x8($s2)
    j .L80059290
    addiu       $v1, $zero, 0xFF
.L80059240:
    slt         $v0, $s3, $s6
.L80059244:
    beqz        $v0, .L800592AC
    addiu       $v0, $zero, 0x1
    lw          $v0, 0x18($s2)
    lw          $v0, 0x0($v0)
    bnez        $v0, .L80059290
    addu        $v1, $zero, $zero
    lw          $v0, 0x14($s2)
    lw          $v1, 0x0($v0)
    addiu       $v0, $zero, 0x71
    sw          $v0, 0x14($v1)
    lw          $a0, 0x14($s2)
    lw          $v0, 0x0($a0)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addiu       $a1, $zero, -0x1
    lw          $v1, 0x18($s2)
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x0($v1)
    addu        $v1, $zero, $zero
.L80059290:
    sll         $v0, $s4, 8
    or          $s4, $v0, $v1
    addiu       $s3, $s3, 0x8
    slti        $v0, $s3, 0x19
    bnez        $v0, .L8005919C
    nop
.L800592A8:
    addiu       $v0, $zero, 0x1
.L800592AC:
    sw          $s1, 0x0($s2)
    sw          $s0, 0x4($s2)
    sw          $s4, 0xC($s2)
    sw          $s3, 0x10($s2)
.L800592BC:
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
.end object_cycle_finalize
