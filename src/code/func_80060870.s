.text
.align 2
.set noreorder
.globl func_80060870
.ent func_80060870
func_80060870:
    addiu       $sp, $sp, -0x38
    sw          $ra, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s2, 0x1C8($a0)
    lw          $s1, 0x78($a0)
    lw          $s4, 0x70($a0)
    blez        $a3, .L80060974
    addu        $s0, $a2, $zero
    addu        $s3, $a1, $zero
    sll         $v0, $a3, 2
    addu        $s5, $v0, $s0
.L800608B0:
    lw          $a0, 0x0($s0)
    jal         func_800632F4
    addu        $a1, $s4, $zero
    lw          $t5, 0x30($s2)
    blez        $s1, .L80060958
    addu        $a3, $zero, $zero
    addu        $t8, $s3, $zero
    addu        $t7, $s0, $zero
    sll         $t6, $t5, 6
    addu        $t2, $s2, $zero
.L800608D8:
    lw          $a2, 0x0($t7)
    lw          $v0, 0x0($t8)
    addu        $t1, $zero, $zero
    addu        $a1, $s4, $zero
    lw          $v1, 0x18($s2)
    lw          $a0, 0x34($t2)
    addu        $t0, $v0, $a3
    sll         $v0, $a3, 2
    addu        $v0, $v0, $v1
    lw          $t4, 0x0($v0)
    beqz        $a1, .L80060948
    addu        $t3, $a0, $t6
.L80060908:
    lbu         $v1, 0x0($t0)
    sll         $v0, $t1, 2
    addu        $v0, $v0, $t3
    lw          $v0, 0x0($v0)
    addu        $t0, $t0, $s1
    lbu         $a0, 0x0($a2)
    addiu       $a1, $a1, -0x1
    addu        $v1, $v1, $v0
    addu        $v1, $t4, $v1
    lbu         $v1, 0x0($v1)
    addiu       $v0, $t1, 0x1
    andi        $t1, $v0, 0xF
    addu        $a0, $a0, $v1
    sb          $a0, 0x0($a2)
    bnez        $a1, .L80060908
    addiu       $a2, $a2, 0x1
.L80060948:
    addiu       $a3, $a3, 0x1
    slt         $v0, $a3, $s1
    bnez        $v0, .L800608D8
    addiu       $t2, $t2, 0x4
.L80060958:
    addiu       $v0, $t5, 0x1
    andi        $t5, $v0, 0xF
    sw          $t5, 0x30($s2)
    addiu       $s0, $s0, 0x4
    slt         $v0, $s0, $s5
    bnez        $v0, .L800608B0
    addiu       $s3, $s3, 0x4
.L80060974:
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_80060870
