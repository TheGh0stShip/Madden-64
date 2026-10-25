.text
.align 2
.set noreorder
.globl func_800AA220
.ent func_800AA220
func_800AA220:
    sw          $s2, 0x20($sp)
    sw          $s0, 0x18($sp)
    lhu         $v0, 0x60($s1)
    lhu         $a0, 0x70($s1)
    lh          $v1, 0x68($s1)
    addu        $v0, $v0, $a0
    addu        $a1, $v1, $zero
    sh          $v0, 0x60($s1)
    sll         $v0, $v0, 16
    lh          $a0, 0x70($s1)
    sra         $v0, $v0, 16
    subu        $v1, $v1, $v0
    xor         $v1, $v1, $a0
    bgez        $v1, .L800AA270
    nop
    lhu         $v0, 0x84($s1)
    sh          $a1, 0x60($s1)
    sh          $zero, 0x70($s1)
    andi        $v0, $v0, 0xFFFB
    sh          $v0, 0x84($s1)
.L800AA270:
    lh          $v0, 0x60($s1)
    lw          $a0, 0x14($s1)
    jal         func_8000C8EC
    addiu       $s2, $v0, 0x3FF
    beqz        $v0, .L800AA2F0
    nop
    lw          $s0, 0xC($s1)
    jal         func_8002E828
    addu        $a0, $s2, $zero
    addu        $a0, $s2, $zero
    lw          $a2, 0x18($s1)
    lw          $v1, 0x1C($s0)
    lw          $s0, 0xC($s1)
    sra         $t6, $a2, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    subu        $v1, $v1, $v0
    jal         func_8002E848
    sw          $v1, 0x1C($s1)
    lw          $v1, 0x20($s0)
    lw          $a2, 0x18($s1)
    sra         $t6, $a2, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    j           func_800A5C30
    addu        $v1, $v1, $v0
.L800AA2F0:
    lw          $s0, 0xC($s1)
    jal         func_8002E828
    addu        $a0, $s2, $zero
    addu        $a0, $s2, $zero
    lw          $a2, 0x18($s1)
    lw          $v1, 0x1C($s0)
    lw          $s0, 0xC($s1)
    sra         $t6, $a2, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    addu        $v1, $v1, $v0
    jal         func_8002E848
    sw          $v1, 0x1C($s1)
    lw          $v1, 0x20($s0)
    lw          $a2, 0x18($s1)
    sra         $t6, $a2, 8
.end func_800AA220
