.text
.align 2
.set noreorder
.globl func_800BEE28
.ent func_800BEE28
func_800BEE28:
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $v1, 0x30($s4)
    lw          $v0, 0x30($s2)
    lw          $t0, 0x2C($s4)
    lw          $a3, 0x2C($s2)
    lw          $a1, 0x1C($s2)
    lw          $a0, 0x1C($s4)
    subu        $fp, $v1, $v0
    lw          $v1, 0x20($s2)
    lw          $v0, 0x20($s4)
    subu        $s3, $t0, $a3
    subu        $s6, $a1, $a0
    subu        $s7, $v1, $v0
    sra         $t6, $fp, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00008812  # mflo        $s1
    nop
    nop
    sra         $t6, $s3, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00008012  # mflo        $s0
    nop
    nop
    addu        $s1, $s1, $s0
    bgez        $s1, .L800BEEA8
    addu        $s0, $a2, $zero
    j           func_800BAA4C
    addu        $v0, $zero, $zero
.L800BEEA8:
    sra         $t6, $s6, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    sra         $t6, $s7, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    jal         func_8002E99C
    addu        $a0, $v0, $a0
    addu        $s5, $v0, $zero
    slti        $v0, $s5, 0x800
    bnel        $v0, $zero, .L800BEEF0
    addiu       $s5, $zero, 0x800
.L800BEEF0:
    addu        $a0, $s1, $zero
    jal         func_8002E7A0
    addu        $a1, $s5, $zero
    lui         $v1, 0x1B4E
    ori         $v1, $v1, 0x81B5
    addu        $s1, $v0, $zero
    .word       0x02230018  # mult        $s1, $v1
    sra         $v1, $s1, 31
    .word       0x00004810  # mfhi        $t1
    sra         $v0, $t1, 9
    subu        $v0, $v0, $v1
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xA
    bnel        $v0, $zero, .L800BEF34
    addiu       $a0, $zero, 0xA
.L800BEF34:
    lw          $v0, 0x48($s2)
    lhu         $v0, 0x16($v0)
    addiu       $a1, $zero, 0x2
    bne         $v0, $a1, .L800BEF6C
    nop
    lw          $v1, 0x10($s2)
    lhu         $v0, 0x30($v1)
    addu        $v0, $v0, $a0
    sh          $v0, 0x30($v1)
    lw          $v0, 0x10($s2)
    sh          $a0, 0x32($v0)
    lw          $v1, 0x10($s2)
    lw          $v0, 0x10($s4)
    sw          $v0, 0x38($v1)
.L800BEF6C:
    lw          $v0, 0x48($s4)
    lhu         $v0, 0x16($v0)
    bne         $v0, $a1, .L800BEFA0
    nop
    lw          $v1, 0x10($s4)
    lhu         $v0, 0x30($v1)
    addu        $v0, $v0, $a0
    sh          $v0, 0x30($v1)
    lw          $v0, 0x10($s4)
    sh          $a0, 0x32($v0)
    lw          $v1, 0x10($s4)
    lw          $v0, 0x10($s2)
    sw          $v0, 0x38($v1)
.L800BEFA0:
    lw          $v0, 0x48($s2)
    lhu         $v0, 0x16($v0)
    beqz        $v0, .L800BEFC4
    addu        $v0, $s2, $zero
    lw          $v0, 0x48($s4)
    lhu         $v0, 0x16($v0)
    sltiu       $v0, $v0, 0x1
    negu        $v0, $v0
    and         $v0, $s4, $v0
.L800BEFC4:
    beqz        $v0, .L800BEFD8
    addiu       $a1, $zero, 0x28
    lw          $a0, 0x10($v0)
    jal         func_800C2150
    addiu       $a2, $zero, 0x5
.L800BEFD8:
    sra         $t6, $s3, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    sra         $t6, $fp, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    subu        $a0, $v0, $a0
    jal         func_8002E7A0
    addu        $a1, $s5, $zero
    lhu         $v1, 0x3C($s4)
    lhu         $a0, 0x3C($s2)
    addu        $s3, $v0, $zero
    sll         $v1, $v1, 16
    bgtz        $v1, .L800BF030
    sll         $a0, $a0, 16
    addiu       $v1, $zero, 0x1
.L800BF030:
    blezl       $a0, .L800BF038
    addiu       $a0, $zero, 0x1
.L800BF038:
    andi        $s0, $s0, 0xFFFF
    .word       0x00900018  # mult        $a0, $s0
    .word       0x00001012  # mflo        $v0
.end func_800BEE28
