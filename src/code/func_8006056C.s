.text
.align 2
.set noreorder
.globl func_8006056C
.ent func_8006056C
func_8006056C:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $v0, 0x4($a0)
    addu        $s0, $a1, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x400
    addiu       $s0, $s0, -0x1
    sll         $s0, $s0, 9
    addu        $t1, $zero, $zero
    addiu       $t2, $zero, 0xFF
    addu        $t3, $v0, $zero
    addu        $t0, $t3, $zero
    lui         $a3, 0x8000
    addiu       $a3, $a3, 0x3418
.L800605B0:
    addu        $a2, $zero, $zero
    addu        $a0, $t0, $zero
    addu        $a1, $a3, $zero
.L800605BC:
    lbu         $v0, 0x0($a1)
    sll         $v0, $v0, 1
    subu        $v0, $t2, $v0
    sll         $v1, $v0, 8
    subu        $v0, $v1, $v0
    bgez        $v0, .L80060610
    nop
    negu        $v0, $v0
    .word       0x0050001A  # div         $zero, $v0, $s0
    bnez        $s0, .L800605EC
    nop
    break       7
.L800605EC:
    addiu       $at, $zero, -0x1
    bne         $s0, $at, .L80060604
    lui         $at, 0x8000
    bne         $v0, $at, .L80060604
    nop
    break       6
.L80060604:
    .word       0x00001012  # mflo        $v0
    j .L8006063C
    negu        $v0, $v0
.L80060610:
    .word       0x0050001A  # div         $zero, $v0, $s0
    bnez        $s0, .L80060620
    nop
    break       7
.L80060620:
    addiu       $at, $zero, -0x1
    bne         $s0, $at, .L80060638
    lui         $at, 0x8000
    bne         $v0, $at, .L80060638
    nop
    break       6
.L80060638:
    .word       0x00001012  # mflo        $v0
.L8006063C:
    sw          $v0, 0x0($a0)
    addiu       $a0, $a0, 0x4
    addiu       $a2, $a2, 0x1
    slti        $v0, $a2, 0x10
    bnez        $v0, .L800605BC
    addiu       $a1, $a1, 0x1
    addiu       $t0, $t0, 0x40
    addiu       $t1, $t1, 0x1
    slti        $v0, $t1, 0x10
    bnez        $v0, .L800605B0
    addiu       $a3, $a3, 0x10
    addu        $v0, $t3, $zero
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8006056C
