.text
.align 2
.set noreorder
.globl func_800C3104
.ent func_800C3104
func_800C3104:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L800C33F4
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x58E4($v0)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L800C33F4
    addiu       $v0, $zero, 0x3
    lui         $v1, 0x8008
    lh          $v1, 0xC20($v1)
    bne         $v1, $v0, .L800C31DC
    nop
    jal         func_800B9050
    nop
    beqz        $v0, .L800C31DC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5C04($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $a2, $v0, $v1
    sll         $v0, $a2, 16
    lui         $at, 0x8009
    sh          $a2, -0x5C04($at)
    bgez        $v0, .L800C31DC
    addiu       $v0, $a2, 0xF
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    lui         $a0, 0xAF28
    ori         $a0, $a0, 0x6BCB
    .word       0x00640019  # multu       $v1, $a0
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7124
    lui         $at, 0x8009
    sh          $v0, -0x5C04($at)
    .word       0x00002010  # mfhi        $a0
    subu        $v1, $v1, $a0
    srl         $v1, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 12
    jal         func_800167FC
    sra         $a0, $a0, 16
    lui         $v0, 0x8009
    lh          $v0, -0x5960($v0)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x6DEC($at)
    jal         func_8001EC20
    addiu       $a1, $zero, 0x1
.L800C31DC:
    lui         $v1, 0x8008
    lw          $v1, 0xC2C($v1)
    beqz        $v1, .L800C33F4
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lw          $s0, 0x94($v1)
    lui         $v1, 0x1
    or          $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800A6580
    nop
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0x7
    bne         $v0, $v1, .L800C3240
    lui         $v1, 0x8888
    lui         $v0, 0x8008
    lw          $v0, 0xC2C($v0)
    lbu         $v1, 0x1E($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    beql        $v1, $v0, .L800C323C
    negu        $s0, $s0
.L800C323C:
    lui         $v1, 0x8888
.L800C3240:
    ori         $v1, $v1, 0x8889
    sll         $v0, $s0, 8
    .word       0x00430018  # mult        $v0, $v1
    lui         $a0, 0x8008
    lh          $a0, 0x6C38($a0)
    .word       0x00003810  # mfhi        $a3
    addu        $v1, $a3, $v0
    sra         $v1, $v1, 7
    sra         $v0, $v0, 31
    subu        $a1, $v1, $v0
    .word       0x00A40018  # mult        $a1, $a0
    .word       0x00002012  # mflo        $a0
    sra         $a1, $a0, 8
    bnez        $a1, .L800C32B4
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lw          $v1, -0x7240($v1)
    sb          $v0, 0x0($v1)
    lui         $v1, 0x8009
    lw          $v1, -0x7240($v1)
    addiu       $v0, $zero, 0x7F
    sb          $v0, 0x1($v1)
    lui         $v0, 0x8008
    lh          $v0, 0xC0A($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x506C($v1)
    addiu       $a0, $zero, 0x7FFF
    j           func_800BEBD4
    addiu       $v0, $v0, -0x4
.L800C32B4:
    lui         $v1, 0x8009
    lw          $v1, -0x7240($v1)
    lui         $v0, 0x8008
    lhu         $v0, 0xC0A($v0)
    sb          $v0, 0x0($v1)
    lui         $v0, 0x8008
    lhu         $v0, 0xC0A($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x7240($v1)
    srl         $v0, $v0, 8
    sb          $v0, 0x1($v1)
    lui         $a0, 0x8008
    lh          $a0, 0xC0A($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x506C($v1)
    addu        $a0, $a0, $a1
    addiu       $v0, $a0, -0x4
    sw          $v0, 0x1C($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x7A98($v0)
    sb          $a0, 0x0($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7A98($v1)
    sra         $v0, $a0, 8
    sb          $v0, 0x1($v1)
    lui         $v0, 0x8008
    lw          $v0, 0xC2C($v0)
    lw          $v0, 0x98($v0)
    lui         $v1, 0x2AAA
    ori         $v1, $v1, 0xAAAB
    andi        $v0, $v0, 0x7FFF
    sll         $v0, $v0, 8
    .word       0x00430018  # mult        $v0, $v1
    lui         $v1, 0x8008
    lh          $v1, 0x6BEA($v1)
    .word       0x00003810  # mfhi        $a3
    sra         $v0, $a3, 3
    nop
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    sra         $a1, $v0, 8
    bnez        $a1, .L800C3384
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8008
    lw          $v1, 0xC80($v1)
    sb          $v0, 0x0($v1)
    lui         $v1, 0x8008
    lw          $v1, 0xC80($v1)
    addiu       $a0, $zero, 0x7FFF
    addiu       $v0, $zero, 0x7F
    j           func_800BEC98
    sb          $v0, 0x1($v1)
.L800C3384:
    lui         $v1, 0x8008
    lw          $v1, 0xC80($v1)
    lui         $v0, 0x8008
    lhu         $v0, 0x501C($v0)
    sb          $v0, 0x0($v1)
    lui         $v0, 0x8008
    lhu         $v0, 0x501C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0xC80($v1)
    srl         $v0, $v0, 8
    sb          $v0, 0x1($v1)
    lui         $a0, 0x8008
    lh          $a0, 0x501C($a0)
    subu        $a0, $a0, $a1
    lui         $v0, 0x8009
    lh          $v0, -0x5940($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F74($v1)
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x6DEC($at)
    sw          $a0, 0x20($v0)
    sb          $a0, 0x0($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x4F74($v1)
    sra         $v0, $a0, 8
    sb          $v0, 0x1($v1)
.L800C33F4:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C3104
