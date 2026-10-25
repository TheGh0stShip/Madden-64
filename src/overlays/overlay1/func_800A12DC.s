.text
.align 2
.set noreorder
.globl func_800A12DC
.ent func_800A12DC
func_800A12DC:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    addiu       $v0, $zero, -0x801
    sw          $s0, 0x10($sp)
    addu        $s0, $s2, $zero
    sw          $s1, 0x14($sp)
    sw          $ra, 0x1C($sp)
    and         $v0, $v1, $v0
    andi        $v1, $v1, 0x2000
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    beqz        $v1, .L800A1324
    addu        $s1, $a1, $zero
    jal         func_800BE784
    nop
.L800A1324:
    lui         $v1, 0x8008
    lh          $v1, 0x6CF2($v1)
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800A1340
    nop
    jal         func_800A365C
    addu        $a0, $zero, $zero
.L800A1340:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4E($v0)
    addiu       $a1, $zero, 0x1
    lui         $at, 0x8008
    sh          $s0, 0x57F0($at)
    lui         $at, 0x8009
    sh          $s1, -0x6B04($at)
    beq         $v0, $a1, .L800A136C
    nop
    lui         $at, 0x8009
    sh          $zero, -0x5A4E($at)
.L800A136C:
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x4858
    lhu         $v1, 0x0($a0)
    lui         $at, 0x8009
    sh          $zero, -0x6D38($at)
    addiu       $v0, $v1, -0x2
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800A1398
    addiu       $v0, $zero, 0x4
    bne         $v1, $a1, .L800A13B0
    nop
.L800A1398:
    sh          $v0, 0x0($a0)
    addiu       $v0, $s2, 0x32
    lui         $at, 0x8008
    sh          $v0, 0x57F0($at)
    lui         $at, 0x8009
    sh          $zero, -0x6D38($at)
.L800A13B0:
    jal         func_800AEAAC
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A13DC
    nop
    jal         func_800AD4F8
    nop
    jal         func_800AD404
    nop
    jal         func_800AD49C
    nop
.L800A13DC:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A12DC
