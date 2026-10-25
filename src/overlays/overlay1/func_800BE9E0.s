.text
.align 2
.set noreorder
.globl func_800BE9E0
.ent func_800BE9E0
func_800BE9E0:
    andi        $a2, $a2, 0xFF
    sll         $v0, $s1, 16
    sra         $a2, $v0, 16
    slti        $v0, $a2, 0x1F
    bnez        $v0, .L800BEA3C
    slti        $v0, $a2, 0x33
    beql        $v0, $zero, .L800BEA00
    addiu       $a2, $zero, 0x32
.L800BEA00:
    addiu       $a2, $a2, -0x14
    sll         $v0, $a2, 1
    addu        $a2, $a2, $v0
    lui         $v0, 0x2AAA
    ori         $v0, $v0, 0xAAAB
    .word       0x00C20018  # mult        $a2, $v0
    lw          $a0, 0x10($s3)
    addiu       $a1, $a2, 0x1E
    andi        $a1, $a1, 0xFF
    sra         $a2, $a2, 31
    .word       0x00004810  # mfhi        $t1
    subu        $a2, $t1, $a2
    addiu       $a2, $a2, 0x4
    jal         func_800C2150
    andi        $a2, $a2, 0xFF
.L800BEA3C:
    lw          $v1, 0x10($s2)
    lhu         $v0, 0x30($v1)
    addu        $v0, $v0, $s1
    sh          $v0, 0x30($v1)
    lw          $v1, 0x10($s3)
    lhu         $v0, 0x30($v1)
    addu        $v0, $v0, $s1
    sh          $v0, 0x30($v1)
    lw          $v0, 0x10($s2)
    sh          $s1, 0x32($v0)
    lw          $v0, 0x10($s3)
    sh          $s1, 0x32($v0)
    lw          $v1, 0x10($s2)
    lw          $v0, 0x10($s3)
    sw          $v0, 0x38($v1)
    lw          $v1, 0x10($s3)
    lw          $v0, 0x10($s2)
    sw          $v0, 0x38($v1)
    lw          $v1, 0x10($s2)
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $v1, $v0, .L800BEAA4
    nop
    lw          $a0, 0x10($s3)
    jal         func_800C1EF8
    nop
.L800BEAA4:
    lw          $v1, 0x10($s3)
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $v1, $v0, .L800BEAC4
    nop
    lw          $a0, 0x10($s2)
    jal         func_800C1EF8
    nop
.L800BEAC4:
    sra         $t6, $s4, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    lw          $t1, 0x14($sp)
    sra         $t6, $t1, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    subu        $a0, $v0, $a0
    jal         func_8002E7A0
    addu        $a1, $s5, $zero
    lhu         $a0, 0x3C($s3)
    lh          $a2, 0x3E($s3)
    lh          $a1, 0x3E($s2)
    lhu         $v1, 0x3C($s2)
    addu        $s4, $v0, $zero
    addu        $a0, $a0, $a2
    subu        $a0, $a0, $a1
    sll         $a0, $a0, 16
    addu        $v1, $v1, $a1
    subu        $v1, $v1, $a2
    bgtz        $a0, .L800BEB38
    sll         $v1, $v1, 16
    addiu       $a0, $zero, 0x1
.L800BEB38:
    blezl       $v1, .L800BEB40
    addiu       $v1, $zero, 0x1
.L800BEB40:
    andi        $s0, $s0, 0xFFFF
    .word       0x00700018  # mult        $v1, $s0
    .word       0x00001012  # mflo        $v0
    addu        $a1, $a0, $v1
    sra         $v0, $v0, 4
    subu        $v0, $a0, $v0
    sra         $t6, $fp, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    jal         func_8002E7A0
    nop
    .word       0x03D00018  # mult        $fp, $s0
    .word       0x00008012  # mflo        $s0
    addu        $s1, $v0, $zero
    sra         $t6, $s4, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    sra         $t6, $s1, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    addu        $a0, $v0, $a0
    addu        $a1, $s5, $zero
    sra         $s0, $s0, 4
    jal         func_8002E7A0
    addu        $s0, $s1, $s0
    lw          $a2, 0x2C($s2)
    sra         $t6, $s1, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001812  # mflo        $v1
    nop
    nop
    sra         $t6, $s4, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    subu        $a0, $v1, $a0
    addu        $a1, $s5, $zero
    addu        $v0, $v0, $a2
    jal         func_8002E7A0
    sw          $v0, 0x2C($s3)
    lw          $v1, 0x30($s2)
    sra         $t6, $s0, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    addu        $a1, $s5, $zero
    addu        $v0, $v0, $v1
    jal         func_8002E7A0
    sw          $v0, 0x30($s3)
    lw          $v1, 0x2C($s2)
    sra         $t6, $s0, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    addu        $a1, $s5, $zero
    addu        $v1, $v1, $v0
    jal         func_8002E7A0
    sw          $v1, 0x2C($s2)
    lw          $v1, 0x30($s2)
    addu        $v1, $v1, $v0
    jal         func_80031964
    sw          $v1, 0x30($s2)
    lw          $v1, 0x2C($s2)
    andi        $v0, $v0, 0x3FFF
    sra         $t6, $v1, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    addu        $v1, $v1, $v0
    jal         func_80031964
    sw          $v1, 0x2C($s2)
    andi        $v0, $v0, 0x3FFF
    lw          $v1, 0x30($s2)
    lw          $a0, 0x48($s2)
    sra         $t6, $v1, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    addu        $v1, $v1, $v0
    sw          $v1, 0x30($s2)
    lhu         $v0, 0x16($a0)
    bnez        $v0, .L800BED44
    nop
    lw          $v0, 0x10($s2)
    lw          $v1, 0x2C($v0)
    lui         $v0, 0xB
    ori         $v0, $v0, 0x6
    bne         $v1, $v0, .L800BED44
    nop
    lw          $v0, 0x24($s2)
    beqz        $v0, .L800BED28
    nop
    lw          $v0, 0x2C($s2)
    lw          $v1, 0x30($s2)
    srl         $a0, $v0, 31
    addu        $v0, $v0, $a0
    sra         $v0, $v0, 1
    sw          $v0, 0x2C($s2)
    srl         $v0, $v1, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    sw          $v1, 0x30($s2)
.L800BED28:
    lw          $v0, 0x34($s2)
    blez        $v0, .L800BED44
    nop
    lw          $v0, 0x10($s2)
    lh          $v0, 0x32($v0)
    bnel        $v0, $zero, .L800BED44
    sw          $zero, 0x34($s2)
.L800BED44:
    lw          $v0, 0x48($s3)
    lhu         $v0, 0x16($v0)
    bnez        $v0, .L800BEDCC
    addiu       $v0, $zero, 0x1
    lw          $v0, 0x10($s3)
    lw          $v1, 0x2C($v0)
    lui         $v0, 0xB
    ori         $v0, $v0, 0x6
    bne         $v1, $v0, .L800BEDCC
    addiu       $v0, $zero, 0x1
    lw          $v0, 0x24($s3)
    beqz        $v0, .L800BEDA0
    nop
    lw          $v0, 0x2C($s3)
    lw          $v1, 0x30($s3)
    srl         $a0, $v0, 31
    addu        $v0, $v0, $a0
    sra         $v0, $v0, 1
    sw          $v0, 0x2C($s3)
    srl         $v0, $v1, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    sw          $v1, 0x30($s3)
.L800BEDA0:
    lw          $v1, 0x34($s3)
    blez        $v1, .L800BEDCC
    addiu       $v0, $zero, 0x1
    lw          $v0, 0x10($s3)
    lh          $v0, 0x32($v0)
    beqz        $v0, .L800BEDC8
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    sw          $v0, 0x34($s3)
.L800BEDC8:
    addiu       $v0, $zero, 0x1
.L800BEDCC:
    lw          $ra, 0x3C($sp)
    lw          $fp, 0x38($sp)
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
.end func_800BE9E0
