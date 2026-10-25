.text
.align 2
.set noreorder
.globl func_80042170
.ent func_80042170
func_80042170:
    addu        $t2, $a0, $zero
    lbu         $a0, 0x0($t2)
    andi        $a1, $a1, 0xFF
    .word       0x00A40018  # mult        $a1, $a0
    .word       0x00002812  # mflo        $a1
    lbu         $v0, 0x1($t2)
    addiu       $sp, $sp, -0x8
    lbu         $v1, 0x23($sp)
    .word       0x00A20018  # mult        $a1, $v0
    .word       0x00002812  # mflo        $a1
    lbu         $v0, 0x1B($sp)
    subu        $v0, $v0, $v1
    addiu       $v0, $v0, -0x1
    addu        $t1, $v0, $zero
    lbu         $v1, 0x1F($sp)
    subu        $t4, $t1, $a0
    slt         $v0, $t4, $t1
    addiu       $a1, $a1, 0x2
    beqz        $v0, .L8004223C
    addu        $t3, $t2, $a1
    andi        $a3, $a3, 0xFF
    .word       0x01270018  # mult        $t1, $a3
    .word       0x00001012  # mflo        $v0
    andi        $t6, $v1, 0xFF
    addiu       $t5, $zero, 0x1
    addu        $a2, $v0, $a2
.L800421D8:
    lbu         $v0, 0x1($t2)
    addu        $a1, $a2, $t6
    blez        $v0, .L80042228
    addu        $a0, $zero, $zero
    addiu       $v1, $zero, 0x7
.L800421EC:
    addu        $t0, $t3, $a0
.L800421F0:
    lbu         $v0, 0x0($t0)
    srav        $v0, $v0, $v1
    andi        $v0, $v0, 0x1
    bnel        $v0, $zero, .L80042204
    sb          $t5, 0x0($a1)
.L80042204:
    addiu       $v1, $v1, -0x1
    bgez        $v1, .L800421F0
    addiu       $a1, $a1, 0x1
    lbu         $v0, 0x1($t2)
    addiu       $a0, $a0, 0x1
    slt         $v0, $a0, $v0
    bnel        $v0, $zero, .L800421EC
    addiu       $v1, $zero, 0x7
    lbu         $v0, 0x1($t2)
.L80042228:
    addiu       $t1, $t1, -0x1
    addu        $t3, $t3, $v0
    slt         $v0, $t4, $t1
    bnez        $v0, .L800421D8
    subu        $a2, $a2, $a3
.L8004223C:
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end func_80042170
