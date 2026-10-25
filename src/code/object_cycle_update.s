.text
.align 2
.set noreorder
.globl object_cycle_update
.ent object_cycle_update
object_cycle_update:
    addiu       $sp, $sp, -0x530
    sw          $s0, 0x520($sp)
    addu        $s0, $a2, $zero
    sw          $ra, 0x528($sp)
    sw          $s1, 0x524($sp)
    lw          $v0, 0x0($s0)
    bnez        $v0, .L80058F64
    addu        $s1, $a1, $zero
    lw          $v0, 0x4($a0)
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x5D4
    sw          $v0, 0x0($s0)
.L80058F64:
    addu        $t0, $zero, $zero
    addiu       $t1, $zero, 0x1
    lw          $s0, 0x0($s0)
    addiu       $a1, $sp, 0x10
    addiu       $a0, $s1, 0x1
    sw          $s1, 0xD0($s0)
.L80058F7C:
    lbu         $v0, 0x0($a0)
    beqz        $v0, .L80058FA8
    addiu       $a3, $zero, 0x1
    addu        $v1, $t0, $a1
.L80058F8C:
    sb          $t1, 0x0($v1)
    addiu       $v1, $v1, 0x1
    lbu         $v0, 0x0($a0)
    addiu       $a3, $a3, 0x1
    slt         $v0, $v0, $a3
    beqz        $v0, .L80058F8C
    addiu       $t0, $t0, 0x1
.L80058FA8:
    addiu       $t1, $t1, 0x1
    slti        $v0, $t1, 0x11
    bnez        $v0, .L80058F7C
    addiu       $a0, $a0, 0x1
    addiu       $v1, $sp, 0x10
    addu        $v0, $v1, $t0
    sb          $zero, 0x0($v0)
    lbu         $a1, 0x10($sp)
    addu        $a0, $zero, $zero
    beqz        $a1, .L80059020
    addu        $t0, $zero, $zero
.L80058FD4:
    addu        $v0, $v1, $t0
    lbu         $v0, 0x0($v0)
    bnel        $v0, $a1, .L8005900C
    addiu       $v1, $sp, 0x10
.L80058FE4:
    sll         $v0, $t0, 2
    addiu       $t0, $t0, 0x1
    addu        $v0, $v0, $v1
    sw          $a0, 0x108($v0)
    addu        $v0, $v1, $zero
    addu        $v0, $v0, $t0
    lbu         $v0, 0x0($v0)
    beq         $v0, $a1, .L80058FE4
    addiu       $a0, $a0, 0x1
    addiu       $v1, $sp, 0x10
.L8005900C:
    addu        $v0, $v1, $t0
    lbu         $v0, 0x0($v0)
    sll         $a0, $a0, 1
    bnez        $v0, .L80058FD4
    addiu       $a1, $a1, 0x1
.L80059020:
    addu        $t0, $zero, $zero
    addiu       $a3, $sp, 0x10
    addiu       $a2, $sp, 0x114
    addiu       $t1, $zero, -0x1
    addiu       $v1, $s0, 0x4
    addiu       $a0, $s1, 0x1
    addiu       $a1, $s1, 0x11
.L8005903C:
    lbu         $v0, 0x0($a0)
    beqz        $v0, .L80059074
    sll         $v0, $t0, 2
    addu        $v0, $v0, $a3
    sw          $t0, 0x8C($v1)
    lw          $v0, 0x108($v0)
    sw          $v0, 0x0($v1)
    lbu         $v0, 0x0($a0)
    addu        $t0, $t0, $v0
    sll         $v0, $t0, 2
    addu        $v0, $a2, $v0
    lw          $v0, 0x0($v0)
    j .L80059078
    sw          $v0, 0x44($v1)
.L80059074:
    sw          $t1, 0x44($v1)
.L80059078:
    addiu       $a0, $a0, 0x1
    slt         $v0, $a0, $a1
    bnez        $v0, .L8005903C
    addiu       $v1, $v1, 0x4
    lui         $v0, 0xF
    ori         $v0, $v0, 0xFFFF
    sw          $v0, 0x88($s0)
    addiu       $a0, $s0, 0xD4
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x400
    addu        $t0, $zero, $zero
    addiu       $t1, $zero, 0x1
    addiu       $t8, $sp, 0x10
    addiu       $t9, $zero, 0x8
    addiu       $t7, $zero, 0x1
    addiu       $t5, $s1, 0x1
.L800590BC:
    lbu         $v0, 0x0($t5)
    beqz        $v0, .L8005912C
    addiu       $a3, $zero, 0x1
    subu        $t4, $t9, $t1
    addu        $t6, $t5, $zero
    sll         $v0, $t0, 2
    addu        $t2, $v0, $t8
.L800590D8:
    lw          $v0, 0x108($t2)
    sllv        $a1, $t7, $t4
    blez        $a1, .L80059114
    sllv        $a0, $v0, $t4
    addu        $t3, $s1, $t0
    sll         $v0, $a0, 2
    addu        $a2, $v0, $s0
.L800590F4:
    sw          $t1, 0xD4($a2)
    addiu       $a2, $a2, 0x4
    addu        $v1, $s0, $a0
    lbu         $v0, 0x11($t3)
    addiu       $a0, $a0, 0x1
    addiu       $a1, $a1, -0x1
    bgtz        $a1, .L800590F4
    sb          $v0, 0x4D4($v1)
.L80059114:
    addiu       $a3, $a3, 0x1
    lbu         $v0, 0x0($t6)
    addiu       $t2, $t2, 0x4
    slt         $v0, $v0, $a3
    beqz        $v0, .L800590D8
    addiu       $t0, $t0, 0x1
.L8005912C:
    addiu       $t1, $t1, 0x1
    slti        $v0, $t1, 0x9
    bnez        $v0, .L800590BC
    addiu       $t5, $t5, 0x1
    lw          $ra, 0x528($sp)
    lw          $s1, 0x524($sp)
    lw          $s0, 0x520($sp)
    addiu       $sp, $sp, 0x530
    jr          $ra
    nop
.end object_cycle_update
