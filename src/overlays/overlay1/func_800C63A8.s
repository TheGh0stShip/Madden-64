.text
.align 2
.set noreorder
.globl func_800C63A8
.ent func_800C63A8
func_800C63A8:
    lui         $v1, 0x8008
    lbu         $v1, 0x5D40($v1)
    addiu       $sp, $sp, -0x38
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x34($sp)
    sw          $fp, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    bne         $v1, $v0, .L800C6534
    sw          $s0, 0x10($sp)
    addu        $s2, $zero, $zero
    addu        $s7, $zero, $zero
    lui         $s6, 0x8008
    addiu       $s6, $s6, 0x5040
.L800C63F4:
    addu        $s1, $zero, $zero
    addu        $s3, $zero, $zero
.L800C63FC:
    addu        $s5, $zero, $zero
    addu        $a0, $zero, $zero
    addu        $s4, $s7, $zero
    addu        $fp, $s6, $zero
    addu        $s0, $s6, $zero
.L800C6410:
    sll         $v0, $a0, 1
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x1860
    addu        $v1, $s4, $a3
    addu        $v0, $v0, $v1
    lh          $v0, 0x0($v0)
    bnel        $v0, $s1, .L800C64DC
    addiu       $a0, $a0, 0x1
    lw          $v0, 0x0($s0)
    lhu         $v0, 0x28($v0)
    andi        $v0, $v0, 0x4
    bnez        $v0, .L800C6454
    addiu       $s5, $zero, 0x1
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    jal         func_800C2210
    addiu       $a2, $zero, 0x1
.L800C6454:
    lw          $v0, 0x0($s0)
    lhu         $v1, 0x2A($v0)
    lui         $v0, 0x8888
    ori         $v0, $v0, 0x8889
    .word       0x00620019  # multu       $v1, $v0
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    .word       0x00003810  # mfhi        $a3
    srl         $a2, $a3, 5
    jal         func_800C2190
    andi        $a2, $a2, 0xFFFF
    addu        $a0, $s3, $s4
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v0, 0x1604($at)
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0xC90
    addu        $v1, $a0, $a3
    addiu       $v0, $v0, 0x1
    sb          $v0, 0x974($v1)
    andi        $v0, $v0, 0xFF
    sltiu       $v0, $v0, 0x8
    bnez        $v0, .L800C64D4
    addiu       $s0, $fp, 0x2C
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $zero, 0x1604($at)
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    jal         func_800C2190
    addiu       $a2, $zero, 0x1
    addiu       $s0, $fp, 0x2C
.L800C64D4:
    addiu       $a0, $zero, 0xB
    addiu       $a0, $a0, 0x1
.L800C64DC:
    slti        $v0, $a0, 0xB
    bnez        $v0, .L800C6410
    addiu       $s0, $s0, 0x4
    bnel        $s5, $zero, .L800C6514
    addiu       $s1, $s1, 0x1
    addu        $a0, $s2, $zero
    addu        $a1, $s1, $zero
    jal         func_800C2210
    addiu       $a2, $zero, 0x2
    addu        $v0, $s3, $s7
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x1604($at)
    addiu       $s1, $s1, 0x1
.L800C6514:
    slti        $v0, $s1, 0x37
    bnez        $v0, .L800C63FC
    addiu       $s3, $s3, 0x3
    addiu       $s7, $s7, 0x214C
    addiu       $s2, $s2, 0x1
    slti        $v0, $s2, 0x2
    bnez        $v0, .L800C63F4
    addiu       $s6, $s6, 0x58
.L800C6534:
    lui         $at, 0x8008
    sb          $zero, 0x5D40($at)
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800C63A8
