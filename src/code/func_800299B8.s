.text
.align 2
.set noreorder
.globl func_800299B8
.ent func_800299B8
func_800299B8:
    lui         $v1, 0x8009
    lbu         $v1, -0x6A30($v1)
    andi        $a1, $v1, 0xFF
    sltiu       $v0, $a1, 0x1E
    beqz        $v0, .L800299E0
    addiu       $v0, $v1, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x6A30($at)
    j .L80029A54
    addu        $a2, $a1, $zero
.L800299E0:
    lui         $a0, 0x8009
    lbu         $a0, -0x6A28($a0)
    lui         $v0, 0x8888
    ori         $v0, $v0, 0x8889
    addu        $a1, $a0, $a1
    .word       0x00A20018  # mult        $a1, $v0
    .word       0x00001810  # mfhi        $v1
    addiu       $a0, $a0, 0x1
    nop
    .word       0x00820018  # mult        $a0, $v0
    addu        $v0, $v1, $a1
    sra         $v0, $v0, 4
    sra         $v1, $a1, 31
    subu        $a2, $v0, $v1
    sll         $v0, $a2, 4
    subu        $v0, $v0, $a2
    sll         $v0, $v0, 1
    subu        $a2, $a1, $v0
    sra         $v0, $a0, 31
    .word       0x00003810  # mfhi        $a3
    addu        $v1, $a3, $a0
    sra         $v1, $v1, 4
    subu        $v1, $v1, $v0
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    subu        $a0, $a0, $v0
    lui         $at, 0x8009
    sb          $a0, -0x6A28($at)
.L80029A54:
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    sll         $v0, $v0, 2
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x4FA0
    lwl         $v1, 0x0($a2)
    lwr         $v1, 0x3($a2)
    lwl         $a0, 0x4($a2)
    lwr         $a0, 0x7($a2)
    lwl         $a1, 0x8($a2)
    lwr         $a1, 0xB($a2)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    swl         $v1, 0xAA0($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    swr         $v1, 0xAA3($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    swl         $a0, 0xAA4($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    swr         $a0, 0xAA7($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    swl         $a1, 0xAA8($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    swr         $a1, 0xAAB($at)
    jr          $ra
    nop
.end func_800299B8
