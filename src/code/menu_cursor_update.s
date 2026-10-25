.text
.align 2
.set noreorder
.globl menu_cursor_update
.ent menu_cursor_update
menu_cursor_update:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a2, $zero
    sll         $v0, $a3, 24
    sra         $v0, $v0, 24
    sw          $ra, 0x20($sp)
    bnez        $v0, .L80029544
    sw          $s0, 0x10($sp)
    j .L80029550
    addiu       $s0, $zero, 0x1
.L80029544:
    nor         $v0, $zero, $v0
    sra         $v0, $v0, 31
    and         $s0, $a3, $v0
.L80029550:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    beqz        $v0, .L80029784
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6D5C
    lbu         $v1, 0x0($a0)
    slti        $v0, $v1, 0x7
    beqz        $v0, .L800295B8
    slti        $v0, $v1, 0x4
    bnez        $v0, .L800295BC
    andi        $v0, $s1, 0xFF
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $v0, 0x8009
    lbu         $v0, -0x750D($v0)
    bnel        $v1, $v0, .L800295B8
    sb          $zero, 0x0($a0)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x80
    ori         $v1, $v1, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L800295BC
    andi        $v0, $s1, 0xFF
    sb          $zero, 0x0($a0)
.L800295B8:
    andi        $v0, $s1, 0xFF
.L800295BC:
    addiu       $v1, $v0, -0x3
    sltiu       $v0, $v1, 0xA
    beqz        $v0, .L800296F0
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x11A0($at)
    jr          $v0
    nop
    jal         func_800293CC
    nop
    addiu       $v0, $zero, 0x320
    lui         $at, 0x8009
    sh          $v0, -0x7514($at)
    lui         $at, 0x8009
    sh          $v0, -0x7516($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x7518($at)
    j .L800296FC
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $v0, 0x8009
    lbu         $v0, -0x750D($v0)
    bne         $v1, $v0, .L80029640
    lui         $v1, 0x80
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v1, $v1, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L80029654
    sll         $v1, $s0, 24
.L80029640:
    lui         $at, 0x8009
    sb          $zero, -0x6D5C($at)
    jal         func_800293CC
    nop
    sll         $v1, $s0, 24
.L80029654:
    sra         $v1, $v1, 20
    lui         $a0, 0x8008
    lhu         $a0, 0x7904($a0)
    lui         $a1, 0x8009
    lh          $a1, -0x6CE0($a1)
    addiu       $v0, $zero, 0x320
    subu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x7516($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $a0, -0x7512($at)
    bne         $a1, $v0, .L800296D8
    addiu       $v0, $zero, 0x1
    j .L800296E8
    nop
    jal         func_800293CC
    nop
    sll         $v1, $s0, 24
    sra         $v1, $v1, 20
    lui         $a0, 0x8008
    lhu         $a0, 0x7904($a0)
    lui         $a1, 0x8009
    lh          $a1, -0x6CE0($a1)
    addiu       $v0, $zero, 0x320
    subu        $v0, $v0, $v1
    lui         $at, 0x8009
    sh          $v0, -0x7516($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $a0, -0x7512($at)
    beq         $a1, $v0, .L800296E8
    addiu       $v0, $zero, 0x1
.L800296D8:
    lui         $at, 0x8009
    sb          $zero, -0x7518($at)
    j .L800296F4
    addiu       $v0, $zero, 0x320
.L800296E8:
    lui         $at, 0x8009
    sb          $v0, -0x7518($at)
.L800296F0:
    addiu       $v0, $zero, 0x320
.L800296F4:
    lui         $at, 0x8009
    sh          $v0, -0x7514($at)
.L800296FC:
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x7516
    lh          $v0, 0x0($v1)
    slti        $v0, $v0, 0x320
    bnez        $v0, .L80029718
    addiu       $v0, $zero, 0x320
    sh          $v0, 0x0($v1)
.L80029718:
    lui         $a0, 0x8008
    lhu         $a0, 0x7A60($a0)
    lui         $a1, 0x8008
    lhu         $a1, 0x7AAC($a1)
    lui         $v0, 0x8008
    lh          $v0, 0x76DC($v0)
    sll         $v1, $a0, 16
    sra         $v1, $v1, 16
    addiu       $v0, $v0, -0x1
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lui         $v0, 0x8009
    lhu         $v0, -0x751C($v0)
    lui         $at, 0x8009
    sb          $s2, -0x750C($at)
    lui         $at, 0x8009
    sb          $s3, -0x750B($at)
    lui         $at, 0x8009
    sb          $s1, -0x750A($at)
    lui         $at, 0x8009
    sb          $s0, -0x7509($at)
    subu        $a0, $a0, $a1
    lui         $at, 0x8009
    sb          $v0, -0x750D($at)
    addu        $a0, $a0, $v1
    lui         $at, 0x8009
    sh          $a0, -0x7510($at)
.L80029784:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end menu_cursor_update
