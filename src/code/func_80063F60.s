.text
.align 2
.set noreorder
.globl func_80063F60
.ent func_80063F60
func_80063F60:
    addiu       $sp, $sp, -0x40
    sw          $s4, 0x30($sp)
    addu        $s4, $a0, $zero
    sw          $s0, 0x20($sp)
    addu        $s0, $a1, $zero
    sw          $s6, 0x38($sp)
    addu        $s6, $a2, $zero
    sw          $ra, 0x3C($sp)
    sw          $s5, 0x34($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    lw          $s5, 0x8($s0)
    lw          $v0, 0x18($s0)
    lw          $v1, 0x10($s0)
    .word       0x00550018  # mult        $v0, $s5
    .word       0x00009812  # mflo        $s3
    blez        $v1, .L80064064
    addu        $s1, $zero, $zero
.L80063FAC:
    lw          $a1, 0x14($s0)
    subu        $v0, $v1, $s1
    addu        $a0, $v0, $zero
    slt         $v0, $a1, $a0
    bnel        $v0, $zero, .L80063FC4
    addu        $a0, $a1, $zero
.L80063FC4:
    lw          $v0, 0x18($s0)
    lw          $v1, 0x1C($s0)
    addu        $a1, $v0, $s1
    subu        $v1, $v1, $a1
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L80063FE0
    addu        $a0, $v1, $zero
.L80063FE0:
    lw          $v0, 0x4($s0)
    subu        $v1, $v0, $a1
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L80063FF4
    addu        $a0, $v1, $zero
.L80063FF4:
    blez        $a0, .L80064064
    nop
    .word       0x00950018  # mult        $a0, $s5
    .word       0x00009012  # mflo        $s2
    beqz        $s6, .L80064028
    sll         $v1, $s1, 2
    lw          $v0, 0x0($s0)
    sw          $s2, 0x10($sp)
    addu        $v1, $v1, $v0
    lw          $a2, 0x0($v1)
    lw          $v0, 0x34($s0)
    j .L80064040
    addu        $a0, $s4, $zero
.L80064028:
    lw          $v0, 0x0($s0)
    addu        $a0, $s4, $zero
    sw          $s2, 0x10($sp)
    addu        $v1, $v1, $v0
    lw          $a2, 0x0($v1)
    lw          $v0, 0x30($s0)
.L80064040:
    addiu       $a1, $s0, 0x30
    jalr        $v0
    addu        $a3, $s3, $zero
    lw          $v0, 0x14($s0)
    lw          $v1, 0x10($s0)
    addu        $s1, $s1, $v0
    slt         $v0, $s1, $v1
    bnez        $v0, .L80063FAC
    addu        $s3, $s3, $s2
.L80064064:
    lw          $ra, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_80063F60
