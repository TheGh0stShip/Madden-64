.text
.align 2
.set noreorder
.globl func_800412DC
.ent func_800412DC
func_800412DC:
    addiu       $sp, $sp, -0x38
    sw          $fp, 0x30($sp)
    addu        $fp, $a1, $zero
    sw          $s7, 0x2C($sp)
    sw          $ra, 0x34($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s4, 0x8($a0)
    blez        $fp, .L80041404
    addu        $s7, $zero, $zero
.L80041318:
    lw          $v0, 0x8($s4)
    lw          $s1, 0xC($v0)
    beqz        $s1, .L80041354
    nop
.L80041328:
    lw          $v0, 0x8($s1)
    lhu         $v1, 0x16($s4)
    lh          $v0, 0x16($v0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L80041348
    nop
    jal         func_8001A520
    addu        $a0, $s1, $zero
.L80041348:
    lw          $s1, 0x0($s1)
    bnez        $s1, .L80041328
    nop
.L80041354:
    lw          $v0, 0x0($s4)
    lw          $v1, 0x4($s4)
    lh          $a0, 0x4($v0)
    lh          $v0, 0x6($v0)
    lw          $s1, 0xC($v1)
    addu        $s0, $a0, $v0
    addu        $v0, $s0, $zero
    beqz        $v0, .L800413E4
    addiu       $s0, $s0, -0x1
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $s5, $v0, 4
    sll         $v1, $s0, 2
    addu        $v1, $v1, $s0
    sll         $v0, $v1, 3
    addu        $v0, $v0, $s0
    sll         $s3, $v0, 2
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    addiu       $s2, $v1, 0x8
.L800413A8:
    lw          $a0, 0x0($s4)
    lw          $a1, 0x10($s4)
    lw          $a2, 0xC($s4)
    addu        $s6, $s0, $zero
    addu        $a0, $a0, $s2
    addu        $a1, $a1, $s3
    jal         func_80040F60
    addu        $a2, $a2, $s5
    beqz        $s1, .L800413D4
    addiu       $s5, $s5, -0x30
    lw          $s1, 0x0($s1)
.L800413D4:
    addiu       $s3, $s3, -0xA4
    addiu       $s2, $s2, -0x54
    bnez        $s6, .L800413A8
    addiu       $s0, $s0, -0x1
.L800413E4:
    lhu         $v0, 0x16($s4)
    addiu       $s7, $s7, 0x1
    addiu       $v0, $v0, 0x1
    sh          $v0, 0x16($s4)
    andi        $v0, $s7, 0xFF
    slt         $v0, $v0, $fp
    bnez        $v0, .L80041318
    nop
.L80041404:
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800412DC
