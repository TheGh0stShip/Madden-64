.text
.align 2
.set noreorder
.globl func_80034388
.ent func_80034388
func_80034388:
    addiu       $sp, $sp, -0x28
    sw          $s4, 0x20($sp)
    addu        $s4, $a0, $zero
    sw          $ra, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s1, 0x8($s4)
    addu        $s3, $a1, $zero
    jal         func_800342B0
    addu        $a0, $s1, $zero
    addu        $v0, $s3, $zero
    lw          $v1, 0x18($s1)
    andi        $v0, $v0, 0xFF
    sll         $v0, $v0, 3
    lw          $a0, 0x4($s1)
    addu        $v1, $v1, $v0
    lw          $s2, 0x8($v1)
    beqz        $a0, .L80034494
    nop
    lbu         $v1, 0x1($s2)
    lbu         $v0, 0x1($a0)
    bne         $v1, $v0, .L80034494
    nop
    beqz        $v1, .L80034494
    nop
    beq         $s2, $a0, .L800344C4
    nop
    lh          $a1, 0xC($s1)
    jal         encoded_stream_weight_sum
    nop
    addu        $a0, $s2, $zero
    addu        $a1, $zero, $zero
    jal         encoded_stream_weight_sum
    addu        $s0, $v0, $zero
    lhu         $v1, 0x10($s1)
    andi        $v0, $v0, 0xFFFF
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    andi        $s0, $s0, 0xFFFF
    nop
    .word       0x0070001A  # div         $zero, $v1, $s0
    bnez        $s0, .L80034440
    nop
    break       7
.L80034440:
    addiu       $at, $zero, -0x1
    bne         $s0, $at, .L80034458
    lui         $at, 0x8000
    bne         $v1, $at, .L80034458
    nop
    break       6
.L80034458:
    .word       0x00001812  # mflo        $v1
    sw          $s2, 0x4($s1)
    sh          $v1, 0x10($s1)
    lbu         $v1, 0x0($s2)
    lhu         $a0, 0x10($s1)
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x8($s1)
    sh          $zero, 0xA($s1)
    sh          $s3, 0x14($s1)
    beqz        $a0, .L800344C4
    sh          $v1, 0xC($s1)
    jal         func_800346B4
    addu        $a0, $s4, $zero
    j .L800344C4
    nop
.L80034494:
    beqz        $s2, .L800344B4
    sw          $s2, 0x4($s1)
    lbu         $v0, 0x0($s2)
    sh          $zero, 0x8($s1)
    sh          $zero, 0xA($s1)
    sh          $zero, 0x10($s1)
    sh          $s3, 0x14($s1)
    sh          $v0, 0xC($s1)
.L800344B4:
    lw          $v0, 0x14($s4)
    lui         $v1, 0x2
    or          $v0, $v0, $v1
    sw          $v0, 0x14($s4)
.L800344C4:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80034388
