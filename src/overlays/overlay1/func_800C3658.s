.text
.align 2
.set noreorder
.globl func_800C3658
.ent func_800C3658
func_800C3658:
    lui         $v1, 0x8009
    lb          $v1, -0x6AEC($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800C3758
    sw          $ra, 0x10($sp)
    lui         $v1, 0x8008
    lbu         $v1, 0x78C8($v1)
    addiu       $v0, $zero, 0xFF
    beq         $v1, $v0, .L800C36F8
    addu        $a0, $zero, $zero
    lui         $a3, 0x8009
    addiu       $a3, $a3, -0x6B70
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x6A68
    addiu       $a1, $zero, 0xFF
.L800C3698:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v1, 0x78C8($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a3
    sw          $v1, 0x0($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x7928($at)
    sll         $v1, $v1, 1
    addu        $v1, $v1, $a2
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    sh          $v0, 0x0($v1)
    addiu       $v1, $a0, 0x1
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x78C8($at)
    bne         $v0, $a1, .L800C3698
    addu        $a0, $v1, $zero
.L800C36F8:
    sll         $v1, $a0, 16
    sra         $v1, $v1, 16
    sll         $a0, $v1, 2
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sw          $v0, -0x6B70($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $zero, -0x6AEC($at)
    beq         $v1, $v0, .L800C3750
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x6178($a1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    lui         $at, 0x8009
    sb          $zero, -0x503A($at)
    lui         $at, 0x8009
    sb          $zero, -0x6AE6($at)
    jal         func_800A2E4C
    nop
.L800C3750:
    jal         func_800BEE28
    nop
.L800C3758:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C3658
