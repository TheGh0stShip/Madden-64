.text
.align 2
.set noreorder
.globl func_800BB170
.ent func_800BB170
func_800BB170:
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, -0x5DB4($at)
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    lui         $a2, 0x320
    lw          $v0, 0x1C($a0)
    lui         $v1, 0xFF60
    lui         $a3, 0x100
    bltzl       $v0, .L800BB19C
    negu        $v0, $v0
.L800BB19C:
    addu        $v0, $v0, $v1
    nor         $v1, $zero, $v0
    sra         $v1, $v1, 31
    sw          $v0, 0x10($sp)
    lw          $a0, 0x20($a0)
    and         $v0, $v0, $v1
    addu        $a1, $v0, $zero
    lui         $v0, 0xFE20
    sw          $a1, 0x10($sp)
    bltzl       $a0, .L800BB1C8
    negu        $a0, $a0
.L800BB1C8:
    addu        $a0, $a0, $v0
    slt         $v0, $a3, $a1
    beqz        $v0, .L800BB1DC
    sw          $a0, 0x14($sp)
    lui         $a1, 0x100
.L800BB1DC:
    nor         $v0, $zero, $a0
    sra         $v0, $v0, 31
    and         $v0, $a0, $v0
    addu        $v1, $v0, $zero
    slt         $v0, $a3, $v1
    sw          $a1, 0x10($sp)
    beqz        $v0, .L800BB200
    sw          $v1, 0x14($sp)
    lui         $v1, 0x100
.L800BB200:
    lw          $t0, 0x10($sp)
    lui         $t1, 0x1
    ori         $t1, $t1, 0x8000
    sra         $t6, $t0, 8
    sra         $t7, $t1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    subu        $a2, $a2, $v0
    lui         $t0, 0x2
    sw          $v1, 0x14($sp)
    sra         $t6, $v1, 8
    sra         $t7, $t0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    subu        $a2, $a2, $v0
    lui         $v0, 0x120
    slt         $v0, $a2, $v0
    bnel        $v0, $zero, .L800BB25C
    lui         $a2, 0x120
.L800BB25C:
    lui         $v0, 0x320
    slt         $v0, $v0, $a2
    bnel        $v0, $zero, .L800BB26C
    lui         $a2, 0x320
.L800BB26C:
    lui         $v0, 0x8008
    lw          $v0, -0x5DB4($v0)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x5988
    addu        $v1, $v0, $zero
    lui         $v0, 0x30
    slt         $v0, $v1, $v0
    beqz        $v0, .L800BB294
    sw          $v1, 0x0($a0)
    lui         $v1, 0x30
.L800BB294:
    slt         $v0, $a2, $v1
    beqz        $v0, .L800BB2A4
    sw          $v1, 0x0($a0)
    addu        $v1, $a2, $zero
.L800BB2A4:
    andi        $v0, $s2, 0x1
    beqz        $v0, .L800BB2CC
    sw          $v1, 0x0($a0)
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
    j           func_800B6BC0
    andi        $v0, $s2, 0x2
.L800BB2CC:
    andi        $v0, $s5, 0x1
    beqz        $v0, .L800BB2E0
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
.L800BB2E0:
    andi        $v0, $s2, 0x2
    beqz        $v0, .L800BB304
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
    j           func_800B6BF8
    andi        $v0, $s2, 0x4
.L800BB304:
    andi        $v0, $s5, 0x2
    beqz        $v0, .L800BB318
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
.L800BB318:
    andi        $v0, $s2, 0x4
    beqz        $v0, .L800BB344
    andi        $v0, $s2, 0x8
    jal         func_800B2250
    addu        $a0, $s1, $zero
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
    andi        $v0, $s2, 0x8
.L800BB344:
    beqz        $v0, .L800BB364
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5080($v1)
    bne         $v1, $v0, .L800BB370
    addiu       $v0, $zero, 0x1
    j           func_800B6C4C
    addiu       $v0, $zero, 0x5
.L800BB364:
    andi        $v0, $s5, 0x8
    beqz        $v0, .L800BB378
    addiu       $v0, $zero, 0x1
.L800BB370:
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
.L800BB378:
    andi        $v0, $s4, 0xFFFF
    bnez        $v0, .L800BB3A4
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x5080($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, 0x1904($at)
    jalr        $v0
    nop
.L800BB3A4:
    lb          $a1, 0x20($sp)
    lb          $a2, 0x21($sp)
    addu        $a0, $s3, $zero
    jal         func_800B5E80
    addu        $a3, $s0, $zero
    andi        $v0, $s4, 0xFFFF
    lw          $ra, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800BB170
