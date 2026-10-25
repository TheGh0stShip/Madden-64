.text
.align 2
.set noreorder
.globl func_800C54F8
.ent func_800C54F8
func_800C54F8:
    lui         $v0, 0x8009
    lbu         $v0, -0x503A($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B70
    beqz        $v0, .L800C5544
    sw          $ra, 0x14($sp)
    lui         $v0, 0x8009
    lbu         $v0, -0x6AE6($v0)
    beqz        $v0, .L800C5544
    lui         $v1, 0x80
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v1, $v1, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L800C55F0
    nop
.L800C5544:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L800C55F0
    nop
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800C55F0
    addiu       $v1, $zero, 0x40
    lbu         $v0, 0x21($s0)
    andi        $v0, $v0, 0xC0
    beq         $v0, $v1, .L800C55F0
    addiu       $v0, $zero, -0x1
    lw          $v1, 0x0($a0)
    beq         $v1, $v0, .L800C55F0
    addiu       $a2, $zero, -0x1
    lui         $a3, 0x8009
    addiu       $a3, $a3, -0x6A68
.L800C558C:
    lw          $a1, 0x0($a0)
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a3
    lh          $v1, 0x0($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $v1, $v0, .L800C55E4
    addiu       $a0, $a0, 0x4
    addu        $a0, $s0, $zero
    jal         func_800BFF9C
    andi        $a1, $a1, 0xFFFF
    lui         $v0, 0x8009
    lbu         $v0, -0x503A($v0)
    beqz        $v0, .L800C55F0
    nop
    lw          $a1, 0x24($s0)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2E4C
    nop
    j           func_800C0ECC
    nop
.L800C55E4:
    lw          $v0, 0x0($a0)
    bne         $v0, $a2, .L800C558C
    nop
.L800C55F0:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C54F8
