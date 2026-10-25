.text
.align 2
.set noreorder
.globl func_800C2A24
.ent func_800C2A24
func_800C2A24:
    addiu       $sp, $sp, -0x40
    addu        $a0, $zero, $zero
    lui         $v1, 0x8009
    lw          $v1, -0x6CBC($v1)
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1090
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0x5
    sh          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x1B
    sw          $ra, 0x3C($sp)
    sw          $s0, 0x38($sp)
    sh          $zero, 0x16($sp)
    sh          $zero, 0x18($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x28($sp)
    sw          $v0, 0x10($sp)
    jal         func_8000D8DC
    sw          $v1, 0x34($sp)
    lui         $v1, 0x8008
    lh          $v1, 0xC20($v1)
    lui         $at, 0x8007
    sw          $v0, 0x2754($at)
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L800C2ADC
    addiu       $v0, $zero, 0x1110
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1010
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0x1D
    sw          $zero, 0x34($sp)
    jal         func_8000D8DC
    sw          $v0, 0x10($sp)
    lui         $v1, 0x8000
    lb          $v1, 0x29A8($v1)
    lui         $a0, 0x8000
    lb          $a0, 0x29A9($a0)
    lui         $at, 0x8008
    sb          $v1, 0x7124($at)
    lui         $at, 0x8008
    sb          $a0, 0x7125($at)
    lui         $at, 0x8007
    sw          $v0, 0x2758($at)
    j           func_800BE4A8
    nop
.L800C2ADC:
    lui         $v1, 0x8009
    lh          $v1, -0x4CC4($v1)
    sw          $v0, 0x1C($sp)
    sw          $zero, 0x34($sp)
    sll         $v1, $v1, 1
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lh          $v0, 0x2730($at)
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    jal         func_8000D8DC
    sw          $v0, 0x10($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    sw          $a0, 0x2758($at)
    jal         func_80017CDC
    addiu       $a1, $zero, 0x1
    lui         $a0, 0x8006
    lhu         $a0, 0x4A4E($a0)
    lui         $v0, 0xAAAA
    ori         $v0, $v0, 0xAAAB
    .word       0x00820019  # multu       $a0, $v0
    .word       0x00003810  # mfhi        $a3
    srl         $v1, $a3, 8
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 7
    subu        $a0, $a0, $v0
    andi        $a0, $a0, 0xFFFF
    srl         $a0, $a0, 7
    addiu       $v0, $zero, 0x1
    beq         $a0, $v0, .L800C2B84
    addiu       $a1, $zero, 0xC8
    slti        $v0, $a0, 0x2
    beql        $v0, $zero, .L800C2B7C
    slti        $v0, $a0, 0x4
    beql        $a0, $zero, .L800C2B84
    addiu       $a1, $zero, 0x12C
    j           func_800BE460
    nop
.L800C2B7C:
    bnel        $v0, $zero, .L800C2B84
    addiu       $a1, $zero, 0x64
.L800C2B84:
    lui         $a0, 0x8007
    lw          $a0, 0x2758($a0)
    jal         func_8001AA3C
    nop
    lui         $v0, 0x8006
    lhu         $v0, 0x4A4E($v0)
    lui         $a0, 0xAF28
    ori         $a0, $a0, 0x6BCB
    .word       0x00440019  # multu       $v0, $a0
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7124
    .word       0x00002010  # mfhi        $a0
    subu        $v0, $v0, $a0
    srl         $v0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 12
    jal         func_800167FC
    sra         $a0, $a0, 16
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addu        $a1, $zero, $zero
    addiu       $a2, $sp, 0x10
    addiu       $v0, $zero, 0x10
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x1C
    jal         func_8000D740
    sw          $v0, 0x10($sp)
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x2754
    lw          $a0, 0x0($s0)
    lui         $at, 0x8009
    sw          $v0, -0x506C($at)
    jal         func_80016FE4
    nop
    lui         $a0, 0x8007
    lw          $a0, 0x2758($a0)
    jal         func_80016FE4
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x506C($a0)
    jal         func_80016FE4
    nop
    jal         func_8001AEA8
    addiu       $a0, $s0, -0x4
    addiu       $a0, $zero, 0x108
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x2774
    addu        $a1, $s0, $zero
    lui         $at, 0x8008
    sw          $v0, 0x76F8($at)
    jal         func_800AACE8
    addiu       $a2, $zero, 0x3
    addiu       $a0, $zero, 0x110
    addu        $a1, $s0, $zero
    lui         $at, 0x8009
    sh          $v0, -0x5960($at)
    jal         func_800AACE8
    addiu       $a2, $zero, 0x1
    addiu       $a0, $zero, 0x118
    addu        $a1, $s0, $zero
    lui         $at, 0x8009
    sh          $v0, -0x595E($at)
    jal         func_800AACE8
    addiu       $a2, $zero, 0x1
    lui         $a0, 0x8008
    lw          $a0, 0x4F74($a0)
    lui         $v1, 0x8008
    lw          $v1, 0xC80($v1)
    lui         $at, 0x8009
    sh          $v0, -0x5940($at)
    sb          $zero, 0x0($v1)
    sb          $zero, 0x0($a0)
    lui         $a0, 0x8008
    lw          $a0, 0x4F74($a0)
    lui         $v0, 0x8008
    lw          $v0, 0xC80($v0)
    addiu       $v1, $zero, 0x7F
    sb          $v1, 0x1($v0)
    sb          $v1, 0x1($a0)
    lui         $v0, 0x8009
    lw          $v0, -0x7240($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x7A98($a0)
    sb          $zero, 0x0($v0)
    sb          $zero, 0x0($a0)
    lui         $v0, 0x8009
    lw          $v0, -0x7240($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x7A98($a0)
    sb          $v1, 0x1($v0)
    sb          $v1, 0x1($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x506C($a1)
    lui         $v0, 0x8008
    lh          $v0, 0xC0A($v0)
    lui         $v1, 0x8008
    lh          $v1, 0x501C($v1)
    lui         $a0, 0x8009
    lh          $a0, -0x5940($a0)
    addiu       $v0, $v0, -0x4
    addiu       $v1, $v1, 0x3
    sll         $a0, $a0, 3
    sw          $v0, 0x1C($a1)
    sw          $v1, 0x20($a1)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lw          $v1, 0x6DEC($at)
    addiu       $v0, $zero, -0x1
    sw          $v0, 0x1C($v1)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lw          $v1, 0x6DEC($at)
    addiu       $v0, $zero, 0x7F00
    sw          $v0, 0x20($v1)
    lw          $ra, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800C2A24
