.text
.align 2
.set noreorder
.globl func_800933A4
.ent func_800933A4
func_800933A4:
    sll         $v0, $s1, 16
    beqz        $v0, .L800934BC
    addiu       $a0, $zero, 0xFF
    lui         $a0, 0x8009
    lhu         $a0, -0x7920($a0)
    jal         func_800AE7F0
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    addiu       $v0, $zero, 0x3C
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x4854
    sll         $v1, $a0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x6C24($at)
    lhu         $s2, 0x0($s0)
    andi        $v1, $s1, 0x7FFF
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    sh          $v1, 0x0($s0)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    lw          $v1, 0x4($v1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lbu         $v1, 0x0($v1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    andi        $v1, $v1, 0x1F
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2DC0($at)
    jal         func_80093F14
    nop
    lhu         $s1, 0x0($s0)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    addiu       $v0, $zero, -0x1
    sh          $s2, 0x0($s0)
    sll         $v1, $a0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x69D0($at)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    ori         $v1, $zero, 0xFFFF
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $s1, 0x2D98($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2DA4($at)
    jal         func_800920B8
    addu        $a1, $zero, $zero
    j           func_8008EE3C
    nop
.L800934BC:
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xCF7($at)
    subu        $a0, $a0, $v0
    sra         $a0, $a0, 3
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    addiu       $v0, $v0, 0x14
    sll         $v1, $v1, 1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x6C24($at)
    j           func_8008EE3C
    nop
.end func_800933A4
