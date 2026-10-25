.text
.align 2
.set noreorder
.globl func_80043538
.ent func_80043538
func_80043538:
    addiu       $sp, $sp, -0x120
    addu        $v0, $a0, $zero
    addu        $v1, $a1, $zero
    sw          $s1, 0x114($sp)
    addu        $s1, $a2, $zero
    sw          $s0, 0x110($sp)
    addiu       $s0, $sp, 0x90
    addu        $a0, $s0, $zero
    addu        $a1, $v0, $zero
    sw          $ra, 0x118($sp)
    jal         func_80043488
    addu        $a2, $v1, $zero
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x10
    jal         func_800432E0
    addiu       $a2, $zero, 0x8
    addu        $a3, $zero, $zero
    addu        $a2, $zero, $zero
    addiu       $t2, $sp, 0x10
    lh          $t1, 0x0($s1)
    lh          $t0, 0x2($s1)
.L8004358C:
    andi        $v0, $a2, 0xFFFF
    sll         $v0, $v0, 4
    addu        $a1, $v0, $t2
    lw          $v0, 0x0($a1)
    slt         $v1, $v0, $t1
    slt         $v0, $t0, $v0
    bnez        $v0, .L800435B0
    addiu       $a0, $zero, 0x1
    addu        $a0, $v1, $zero
.L800435B0:
    lh          $v1, 0x4($s1)
    lw          $v0, 0x4($a1)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800435C8
    andi        $a0, $a0, 0xFFFF
    ori         $a0, $a0, 0x1
.L800435C8:
    lh          $v0, 0x6($s1)
    lw          $v1, 0x4($a1)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800435E0
    andi        $a0, $a0, 0xFFFF
    ori         $a0, $a0, 0x1
.L800435E0:
    addiu       $a2, $a2, 0x1
    andi        $v0, $a2, 0xFFFF
    sltiu       $v0, $v0, 0x8
    bnez        $v0, .L8004358C
    addu        $a3, $a0, $a3
    andi        $v0, $a3, 0xFFFF
    lw          $ra, 0x118($sp)
    lw          $s1, 0x114($sp)
    lw          $s0, 0x110($sp)
    addiu       $sp, $sp, 0x120
    jr          $ra
    nop
.end func_80043538
