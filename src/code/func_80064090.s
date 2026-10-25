.text
.align 2
.set noreorder
.globl func_80064090
.ent func_80064090
func_80064090:
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
    lw          $a0, 0x10($s0)
    lw          $v0, 0x8($s0)
    lw          $v1, 0x18($s0)
    sll         $s5, $v0, 7
    .word       0x00750018  # mult        $v1, $s5
    .word       0x00009812  # mflo        $s3
    blez        $a0, .L80064198
    addu        $s1, $zero, $zero
.L800640E0:
    lw          $v1, 0x14($s0)
    subu        $v0, $a0, $s1
    addu        $a0, $v0, $zero
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L800640F8
    addu        $a0, $v1, $zero
.L800640F8:
    lw          $v0, 0x18($s0)
    lw          $v1, 0x1C($s0)
    addu        $a1, $v0, $s1
    subu        $v1, $v1, $a1
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L80064114
    addu        $a0, $v1, $zero
.L80064114:
    lw          $v0, 0x4($s0)
    subu        $v1, $v0, $a1
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L80064128
    addu        $a0, $v1, $zero
.L80064128:
    blez        $a0, .L80064198
    nop
    .word       0x00950018  # mult        $a0, $s5
    .word       0x00009012  # mflo        $s2
    beqz        $s6, .L8006415C
    sll         $v1, $s1, 2
    lw          $v0, 0x0($s0)
    sw          $s2, 0x10($sp)
    addu        $v1, $v1, $v0
    lw          $a2, 0x0($v1)
    lw          $v0, 0x34($s0)
    j .L80064174
    addu        $a0, $s4, $zero
.L8006415C:
    lw          $v0, 0x0($s0)
    addu        $a0, $s4, $zero
    sw          $s2, 0x10($sp)
    addu        $v1, $v1, $v0
    lw          $a2, 0x0($v1)
    lw          $v0, 0x30($s0)
.L80064174:
    addiu       $a1, $s0, 0x30
    jalr        $v0
    addu        $a3, $s3, $zero
    lw          $v0, 0x14($s0)
    lw          $a0, 0x10($s0)
    addu        $s1, $s1, $v0
    slt         $v0, $s1, $a0
    bnez        $v0, .L800640E0
    addu        $s3, $s3, $s2
.L80064198:
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
.end func_80064090
