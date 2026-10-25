.text
.align 2
.set noreorder
.globl func_800C4FE0
.ent func_800C4FE0
func_800C4FE0:
    addiu       $sp, $sp, -0x58
    sw          $s1, 0x3C($sp)
    addu        $s1, $a0, $zero
    sw          $s4, 0x48($sp)
    addu        $s4, $a1, $zero
    sw          $s6, 0x50($sp)
    addu        $s6, $a2, $zero
    sw          $s3, 0x44($sp)
    addu        $s3, $a3, $zero
    sw          $ra, 0x54($sp)
    sw          $s5, 0x4C($sp)
    sw          $s2, 0x40($sp)
    sw          $s0, 0x38($sp)
    lw          $a1, 0x24($s1)
    addu        $s5, $s3, $zero
    sra         $t6, $s3, 8
    sra         $t7, $s3, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00009812  # mflo        $s3
    nop
    nop
    addu        $s2, $zero, $zero
    lw          $v0, 0x14($a1)
    lui         $a0, 0x8009
    lhu         $a0, -0x5A4C($a0)
    addiu       $v1, $zero, -0x21
    and         $v0, $v0, $v1
    blez        $a0, .L800C51DC
    sw          $v0, 0x14($a1)
.L800C5054:
    lw          $v0, 0x24($s1)
    lw          $v0, 0x2C($v0)
    sw          $v0, 0x10($sp)
    lw          $v0, 0x24($s1)
    lw          $t0, 0x10($sp)
    lw          $t1, 0x10($sp)
    lw          $v0, 0x30($v0)
    sw          $v0, 0x14($sp)
    sra         $t6, $t0, 8
    sra         $t7, $t1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    lw          $t0, 0x14($sp)
    lw          $t1, 0x14($sp)
    sra         $t6, $t0, 8
    sra         $t7, $t1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    jal         func_8002E99C
    addu        $a0, $v0, $a0
    addu        $s0, $v0, $zero
    jal         func_800B9208
    addiu       $a0, $sp, 0x10
    addu        $a0, $s0, $zero
    addu        $a1, $s5, $zero
    sll         $s0, $v0, 16
    jal         func_8002E7A0
    sra         $s0, $s0, 16
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x20
    sra         $t6, $v0, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    sra         $t6, $v0, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00003012  # mflo        $a2
    nop
    nop
    jal         func_800B9274
    nop
    lw          $v1, 0x10($sp)
    lw          $a0, 0x20($sp)
    lw          $v0, 0x14($sp)
    lw          $a1, 0x24($sp)
    subu        $v1, $v1, $a0
    subu        $v0, $v0, $a1
    sw          $v1, 0x10($sp)
    sw          $v0, 0x14($sp)
    lw          $v0, 0x24($s1)
    sw          $v1, 0x2C($v0)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x14($sp)
    sw          $v0, 0x30($v1)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x0($s4)
    addu        $a0, $v1, $v0
    lw          $v0, 0x14($sp)
    sw          $a0, 0x10($sp)
    lw          $v1, 0x4($s4)
    lw          $t0, 0x10($sp)
    lw          $t1, 0x10($sp)
    addu        $v0, $v0, $v1
    sra         $t6, $t0, 8
    sra         $t7, $t1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001812  # mflo        $v1
    nop
    nop
    sw          $v0, 0x14($sp)
    sra         $t6, $v0, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    addu        $s0, $v1, $v0
    slt         $v0, $s3, $s0
    bnez        $v0, .L800C51C4
    nop
    lw          $v0, 0x24($s1)
    sw          $a0, 0x2C($v0)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x14($sp)
    sw          $v0, 0x30($v1)
.L800C51C4:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addiu       $s2, $s2, 0x1
    slt         $v0, $s2, $v0
    bnez        $v0, .L800C5054
    nop
.L800C51DC:
    lw          $ra, 0x54($sp)
    lw          $s6, 0x50($sp)
    lw          $s5, 0x4C($sp)
    lw          $s4, 0x48($sp)
    lw          $s3, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_800C4FE0
