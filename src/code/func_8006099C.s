.text
.align 2
.set noreorder
.globl func_8006099C
.ent func_8006099C
func_8006099C:
    addiu       $sp, $sp, -0x28
    sw          $s6, 0x20($sp)
    sw          $s5, 0x1C($sp)
    sw          $s4, 0x18($sp)
    sw          $s3, 0x14($sp)
    sw          $s2, 0x10($sp)
    sw          $s1, 0xC($sp)
    sw          $s0, 0x8($sp)
    lw          $t5, 0x1C8($a0)
    addu        $s5, $a3, $zero
    lw          $v0, 0x18($t5)
    lw          $s6, 0x70($a0)
    lw          $s4, 0x0($v0)
    lw          $s3, 0x4($v0)
    lw          $s2, 0x8($v0)
    blez        $s5, .L80060AB4
    addu        $t6, $zero, $zero
    addu        $s1, $a2, $zero
    addu        $s0, $a1, $zero
.L800609E8:
    lw          $t4, 0x30($t5)
    lw          $t0, 0x0($s0)
    lw          $t3, 0x0($s1)
    addu        $t2, $zero, $zero
    addu        $t1, $s6, $zero
    lw          $v1, 0x34($t5)
    lw          $a0, 0x38($t5)
    lw          $a1, 0x3C($t5)
    sll         $v0, $t4, 6
    addu        $t9, $v1, $v0
    addu        $t8, $a0, $v0
    beqz        $t1, .L80060A94
    addu        $t7, $a1, $v0
.L80060A1C:
    lbu         $a0, 0x0($t0)
    addiu       $t0, $t0, 0x1
    lbu         $a1, 0x0($t0)
    addiu       $t0, $t0, 0x1
    lbu         $a3, 0x0($t0)
    addiu       $t0, $t0, 0x1
    sll         $v1, $t2, 2
    addu        $v0, $v1, $t9
    lw          $a2, 0x0($v0)
    addiu       $v0, $t2, 0x1
    andi        $t2, $v0, 0xF
    addu        $v0, $v1, $t8
    addu        $v1, $v1, $t7
    lw          $v1, 0x0($v1)
    addu        $a0, $a0, $a2
    lw          $a2, 0x0($v0)
    addu        $a0, $s4, $a0
    lbu         $v0, 0x0($a0)
    addu        $a3, $a3, $v1
    addu        $a3, $s2, $a3
    addu        $a1, $a1, $a2
    addu        $a1, $s3, $a1
    lbu         $a0, 0x0($a1)
    lbu         $v1, 0x0($a3)
    addiu       $t1, $t1, -0x1
    addu        $v0, $v0, $a0
    addu        $v0, $v0, $v1
    sb          $v0, 0x0($t3)
    bnez        $t1, .L80060A1C
    addiu       $t3, $t3, 0x1
.L80060A94:
    addiu       $v0, $t4, 0x1
    andi        $t4, $v0, 0xF
    sw          $t4, 0x30($t5)
    addiu       $s1, $s1, 0x4
    addiu       $t6, $t6, 0x1
    slt         $v0, $t6, $s5
    bnez        $v0, .L800609E8
    addiu       $s0, $s0, 0x4
.L80060AB4:
    lw          $s6, 0x20($sp)
    lw          $s5, 0x1C($sp)
    lw          $s4, 0x18($sp)
    lw          $s3, 0x14($sp)
    lw          $s2, 0x10($sp)
    lw          $s1, 0xC($sp)
    lw          $s0, 0x8($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_8006099C
