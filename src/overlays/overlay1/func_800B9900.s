.text
.align 2
.set noreorder
.globl func_800B9900
.ent func_800B9900
func_800B9900:
    subu        $a0, $s1, $a0
    addiu       $a0, $a0, -0x1
    jal         func_800B56DC
    andi        $a0, $a0, 0xFFFF
    lbu         $a1, 0x0($s2)
    addiu       $v0, $zero, 0xC0
    andi        $v1, $a1, 0xC0
    beq         $v1, $v0, .L800B9964
    sll         $v1, $a1, 24
    sra         $v1, $v1, 30
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a0
    andi        $v1, $a1, 0x3C
    addu        $v1, $v1, $v0
    lw          $v0, 0x0($v1)
    lui         $at, 0x8009
    sw          $v0, -0x4C98($at)
    j           func_800B5248
    nop
.L800B9964:
    lui         $at, 0x8009
    sw          $zero, -0x4C98($at)
    lui         $v0, 0x8007
    lw          $v0, 0x18F0($v0)
    bnez        $v0, .L800B99EC
    nop
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x5A14
    lw          $v0, 0x0($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x794C($v1)
    beq         $v0, $v1, .L800B99EC
    nop
    beqz        $v0, .L800B99EC
    lui         $a2, 0x190
    lui         $v0, 0x8009
    lw          $v0, -0x5A14($v0)
    lw          $a0, 0x1C($v0)
    slt         $v0, $a2, $a0
    bnez        $v0, .L800B99C8
    nop
    lui         $a2, 0xFE70
    slt         $v0, $a0, $a2
    beqz        $v0, .L800B99EC
    nop
.L800B99C8:
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    sw          $v1, 0x0($a1)
    sw          $a2, 0x1C($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x5A14($v0)
    lw          $v0, 0x20($v0)
    sw          $v0, 0x20($v1)
.L800B99EC:
    lw          $v0, 0x8($s0)
    srl         $v0, $v0, 2
    andi        $v0, $v0, 0x1E
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lh          $v0, -0x6CF8($at)
    lui         $a0, 0x8008
    lw          $a0, 0x6C60($a0)
    sll         $v0, $v0, 1
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lhu         $a1, -0x4E08($at)
    jal         func_80096A00
    nop
    lw          $v0, 0x0($s0)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5E50
    addiu       $v1, $zero, 0x1F
    srl         $v0, $v0, 27
    bne         $v0, $v1, .L800B9A48
    sb          $v0, 0x0($a0)
    addiu       $v0, $zero, -0x1
    sb          $v0, 0x0($a0)
.L800B9A48:
    lw          $v0, 0x0($s0)
    srl         $v0, $v0, 22
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    sb          $v0, 0x5E51($at)
    bne         $v0, $v1, .L800B9A6C
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E51($at)
.L800B9A6C:
    lw          $v0, 0x0($s0)
    srl         $v0, $v0, 17
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    sb          $v0, 0x5E52($at)
    bne         $v0, $v1, .L800B9A90
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E52($at)
.L800B9A90:
    lw          $v0, 0x0($s0)
    srl         $v0, $v0, 12
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    sb          $v0, 0x5E53($at)
    bne         $v0, $v1, .L800B9AB4
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E53($at)
.L800B9AB4:
    lw          $v0, 0x4($s0)
    srl         $v0, $v0, 27
    lui         $at, 0x8008
    sb          $v0, 0x5E54($at)
    bne         $v0, $v1, .L800B9AD4
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E54($at)
.L800B9AD4:
    lw          $v0, 0x4($s0)
    srl         $v0, $v0, 22
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    sb          $v0, 0x5E55($at)
    bne         $v0, $v1, .L800B9AF8
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E55($at)
.L800B9AF8:
    lw          $v0, 0x4($s0)
    srl         $v0, $v0, 17
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    sb          $v0, 0x5E56($at)
    bne         $v0, $v1, .L800B9B1C
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E56($at)
.L800B9B1C:
    lw          $v0, 0x4($s0)
    srl         $v0, $v0, 12
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    sb          $v0, 0x5E57($at)
    bne         $v0, $v1, .L800B9B40
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E57($at)
.L800B9B40:
    lw          $v0, 0x4($s0)
    srl         $v0, $v0, 7
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    sb          $v0, 0x5E58($at)
    bne         $v0, $v1, .L800B9B64
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sb          $v0, 0x5E58($at)
.L800B9B64:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B9900
