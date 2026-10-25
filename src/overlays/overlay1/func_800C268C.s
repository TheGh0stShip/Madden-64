.text
.align 2
.set noreorder
.globl func_800C268C
.ent func_800C268C
func_800C268C:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_8001B02C
    addiu       $a0, $zero, 0x110
    addiu       $a1, $v0, 0x4
    addiu       $a0, $v0, 0x13
    lui         $at, 0x8009
    sw          $v0, -0x5034($at)
    lui         $at, 0x8008
    sw          $a1, 0x4F74($at)
    lui         $at, 0x8009
    sw          $a0, -0x7240($at)
    lbu         $v0, 0x4($v0)
    andi        $v1, $v0, 0x1F
    addiu       $v0, $v1, -0x2
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C26E0
    addiu       $v0, $v1, -0x7
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800C26F0
    nop
.L800C26E0:
    lui         $at, 0x8009
    sw          $a1, -0x7240($at)
    lui         $at, 0x8008
    sw          $a0, 0x4F74($at)
.L800C26F0:
    lui         $a3, 0x8008
    lw          $a3, 0x4F74($a3)
    lui         $a2, 0x8009
    lw          $a2, -0x7240($a2)
    addiu       $v0, $a3, 0x9
    lui         $at, 0x8008
    sw          $v0, 0x4F74($at)
    addiu       $v0, $a3, 0xD
    lui         $at, 0x8008
    sw          $v0, 0xC80($at)
    lbu         $v0, 0xD($a3)
    lbu         $a0, 0xE($a3)
    lbu         $v1, 0x9($a3)
    lbu         $a1, 0xA($a3)
    lui         $at, 0x8008
    sw          $a2, 0x7A98($at)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    sll         $v1, $v1, 24
    sra         $v1, $v1, 24
    sll         $a0, $a0, 24
    sra         $a0, $a0, 16
    addu        $v0, $v0, $a0
    sll         $a1, $a1, 24
    sra         $a1, $a1, 16
    addu        $v1, $v1, $a1
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, 0x6BEA($at)
    lbu         $v0, 0x0($a2)
    andi        $v0, $v0, 0x40
    bnez        $v0, .L800C277C
    addiu       $v0, $a2, 0x3
    lui         $at, 0x8009
    sw          $v0, -0x7240($at)
.L800C277C:
    lbu         $v0, 0x0($a2)
    andi        $v0, $v0, 0x20
    bnez        $v0, .L800C27A0
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7240($v0)
    addiu       $v0, $v0, 0x3
    lui         $at, 0x8009
    sw          $v0, -0x7240($at)
.L800C27A0:
    lui         $a2, 0x8009
    lw          $a2, -0x7240($a2)
    addiu       $v0, $a2, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x7240($at)
    addiu       $v0, $a2, 0x5
    lui         $at, 0x8008
    sw          $v0, 0x7A98($at)
    lbu         $v1, 0x5($a2)
    lbu         $a0, 0x1($a2)
    lbu         $a1, 0x6($a2)
    lbu         $v0, 0x2($a2)
    sll         $v1, $v1, 24
    sra         $v1, $v1, 24
    sll         $a0, $a0, 24
    sra         $a0, $a0, 24
    sll         $a1, $a1, 24
    sra         $a1, $a1, 16
    addu        $v1, $v1, $a1
    sll         $v0, $v0, 24
    sra         $v0, $v0, 16
    addu        $a0, $a0, $v0
    subu        $v1, $v1, $a0
    lui         $at, 0x8008
    sh          $v1, 0x6C38($at)
    lbu         $v0, 0x2($a2)
    lbu         $v1, 0x1($a2)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 16
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    sh          $v1, 0xC0A($at)
    lbu         $v0, 0xE($a3)
    lbu         $v1, 0xD($a3)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 16
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    sh          $v1, 0x501C($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C268C
