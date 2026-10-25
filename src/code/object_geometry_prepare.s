.text
.align 2
.set noreorder
.globl object_geometry_prepare
.ent object_geometry_prepare
object_geometry_prepare:
    addiu       $sp, $sp, -0x90
    sw          $s5, 0x7C($sp)
    addu        $s5, $a0, $zero
    sw          $ra, 0x8C($sp)
    sw          $fp, 0x88($sp)
    sw          $s7, 0x84($sp)
    sw          $s6, 0x80($sp)
    sw          $s4, 0x78($sp)
    sw          $s3, 0x74($sp)
    sw          $s2, 0x70($sp)
    sw          $s1, 0x6C($sp)
    sw          $s0, 0x68($sp)
    sw          $a1, 0x1C($sp)
    lw          $t1, 0x1A8($s5)
    lw          $v0, 0x158($s5)
    lw          $a0, 0x13C($s5)
    lw          $t3, 0x18($t1)
    lw          $v1, 0x1C($t1)
    addiu       $v0, $v0, -0x1
    addiu       $a0, $a0, -0x1
    sw          $v0, 0x24($sp)
    slt         $v1, $t3, $v1
    beqz        $v1, .L8005B95C
    sw          $a0, 0x2C($sp)
.L8005B764:
    lw          $t0, 0x14($t1)
    lw          $t7, 0x24($sp)
    sltu        $v0, $t7, $t0
    bnez        $v0, .L8005B948
    nop
.L8005B778:
    lw          $a1, 0x160($s5)
    lw          $a0, 0x20($t1)
    sw          $t0, 0x48($sp)
    sw          $t1, 0x4C($sp)
    sw          $t3, 0x54($sp)
    jal         func_800632F4
    sll         $a1, $a1, 7
    lw          $v0, 0x1B8($s5)
    lw          $t1, 0x4C($sp)
    lw          $v0, 0x4($v0)
    addu        $a0, $s5, $zero
    jalr        $v0
    addiu       $a1, $t1, 0x20
    lw          $t0, 0x48($sp)
    lw          $t1, 0x4C($sp)
    lw          $t3, 0x54($sp)
    beqz        $v0, .L8005B998
    addu        $s7, $zero, $zero
    lw          $v0, 0x144($s5)
    blez        $v0, .L8005B934
    addu        $fp, $zero, $zero
    lw          $t5, 0x1C($sp)
    addu        $t4, $s5, $zero
.L8005B7D4:
    lw          $s1, 0x148($t4)
    lw          $v0, 0x30($s1)
    bnez        $v0, .L8005B7F0
    nop
    lw          $v0, 0x3C($s1)
    j .L8005B91C
    addu        $s7, $s7, $v0
.L8005B7F0:
    lw          $v0, 0x4($s1)
    lw          $v1, 0x1BC($s5)
    lw          $t7, 0x24($sp)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $t6, 0x4($v0)
    sltu        $v0, $t0, $t7
    beqz        $v0, .L8005B820
    nop
    lw          $s6, 0x34($s1)
    j .L8005B824
    nop
.L8005B820:
    lw          $s6, 0x44($s1)
.L8005B824:
    lw          $v0, 0x24($s1)
    .word       0x01620018  # mult        $t3, $v0
    .word       0x00001012  # mflo        $v0
    addu        $s3, $zero, $zero
    lw          $a0, 0x40($s1)
    lw          $v1, 0x0($t5)
    lw          $a1, 0x38($s1)
    .word       0x01040018  # mult        $t0, $a0
    .word       0x00005012  # mflo        $t2
    sll         $v0, $v0, 2
    blez        $a1, .L8005B91C
    addu        $s4, $v1, $v0
.L8005B854:
    lw          $v0, 0x94($s5)
    lw          $t7, 0x2C($sp)
    sltu        $v0, $v0, $t7
    bnez        $v0, .L8005B87C
    addu        $s2, $t2, $zero
    lw          $v1, 0x48($s1)
    addu        $v0, $t3, $s3
    slt         $v0, $v0, $v1
    beqz        $v0, .L8005B8F8
    nop
.L8005B87C:
    blez        $s6, .L8005B8F8
    addu        $s0, $zero, $zero
    addu        $a0, $s5, $zero
.L8005B888:
    addu        $v0, $s7, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t1
    sw          $s2, 0x10($sp)
    lw          $a2, 0x20($v0)
    addu        $a1, $s1, $zero
    addu        $a3, $s4, $zero
    sw          $t0, 0x48($sp)
    sw          $t1, 0x4C($sp)
    sw          $t2, 0x50($sp)
    sw          $t3, 0x54($sp)
    sw          $t4, 0x58($sp)
    sw          $t5, 0x5C($sp)
    jalr        $t6
    sw          $t6, 0x60($sp)
    lw          $v0, 0x24($s1)
    addiu       $s0, $s0, 0x1
    lw          $t0, 0x48($sp)
    lw          $t1, 0x4C($sp)
    lw          $t2, 0x50($sp)
    lw          $t3, 0x54($sp)
    lw          $t4, 0x58($sp)
    lw          $t5, 0x5C($sp)
    lw          $t6, 0x60($sp)
    addu        $s2, $s2, $v0
    slt         $v0, $s0, $s6
    bnez        $v0, .L8005B888
    addu        $a0, $s5, $zero
.L8005B8F8:
    lw          $v0, 0x34($s1)
    addiu       $s3, $s3, 0x1
    lw          $v1, 0x24($s1)
    addu        $s7, $s7, $v0
    lw          $v0, 0x38($s1)
    sll         $v1, $v1, 2
    slt         $v0, $s3, $v0
    bnez        $v0, .L8005B854
    addu        $s4, $s4, $v1
.L8005B91C:
    addiu       $t5, $t5, 0x4
    lw          $v0, 0x144($s5)
    addiu       $fp, $fp, 0x1
    slt         $v0, $fp, $v0
    bnez        $v0, .L8005B7D4
    addiu       $t4, $t4, 0x4
.L8005B934:
    lw          $t7, 0x24($sp)
    addiu       $t0, $t0, 0x1
    sltu        $v0, $t7, $t0
    beqz        $v0, .L8005B778
    nop
.L8005B948:
    lw          $v0, 0x1C($t1)
    addiu       $t3, $t3, 0x1
    slt         $v0, $t3, $v0
    bnez        $v0, .L8005B764
    sw          $zero, 0x14($t1)
.L8005B95C:
    lw          $v0, 0x9C($s5)
    lw          $v1, 0x94($s5)
    lw          $a0, 0x13C($s5)
    addiu       $v0, $v0, 0x1
    addiu       $v1, $v1, 0x1
    sw          $v1, 0x94($s5)
    sltu        $v1, $v1, $a0
    bnez        $v1, .L8005B9A8
    sw          $v0, 0x9C($s5)
    lw          $v0, 0x1B0($s5)
    lw          $v0, 0xC($v0)
    jalr        $v0
    addu        $a0, $s5, $zero
    j .L8005B9B4
    addiu       $v0, $zero, 0x4
.L8005B998:
    addu        $v0, $zero, $zero
    sw          $t3, 0x18($t1)
    j .L8005B9B4
    sw          $t0, 0x14($t1)
.L8005B9A8:
    jal         func_8005B618
    addu        $a0, $s5, $zero
    addiu       $v0, $zero, 0x3
.L8005B9B4:
    lw          $ra, 0x8C($sp)
    lw          $fp, 0x88($sp)
    lw          $s7, 0x84($sp)
    lw          $s6, 0x80($sp)
    lw          $s5, 0x7C($sp)
    lw          $s4, 0x78($sp)
    lw          $s3, 0x74($sp)
    lw          $s2, 0x70($sp)
    lw          $s1, 0x6C($sp)
    lw          $s0, 0x68($sp)
    addiu       $sp, $sp, 0x90
    jr          $ra
    nop
.end object_geometry_prepare
