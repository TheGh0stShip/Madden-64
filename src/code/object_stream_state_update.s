.text
.align 2
.set noreorder
.globl object_stream_state_update
.ent object_stream_state_update
object_stream_state_update:
    addiu       $sp, $sp, -0x8
    addu        $t7, $a0, $zero
    sw          $s1, 0x4($sp)
    sw          $s0, 0x0($sp)
    lw          $v1, 0x0($a1)
    lw          $a3, 0x0($a3)
    sll         $a2, $a2, 2
    lw          $v0, 0x4($a1)
    lw          $t1, 0x140($t7)
    addu        $v1, $a2, $v1
    lw          $t3, 0x0($v1)
    lw          $v1, 0x8($a1)
    addu        $v0, $a2, $v0
    lw          $t6, 0x0($v0)
    lw          $v0, 0x1C0($t7)
    addu        $a2, $a2, $v1
    lw          $v1, 0x70($t7)
    lw          $a2, 0x0($a2)
    lw          $t8, 0x10($v0)
    lw          $t9, 0x14($v0)
    lw          $s1, 0x18($v0)
    lw          $s0, 0x1C($v0)
    srl         $t5, $v1, 1
    beqz        $t5, .L80062DD8
    nop
    addiu       $t0, $a3, 0x2
.L80062D10:
    lbu         $a0, 0x0($a2)
    lbu         $v1, 0x0($t6)
    lbu         $a1, 0x0($t3)
    sll         $a0, $a0, 2
    addu        $v0, $a0, $t8
    lw          $t2, 0x0($v0)
    sll         $v1, $v1, 2
    addu        $v0, $v1, $t9
    lw          $t4, 0x0($v0)
    addu        $v1, $v1, $s0
    addu        $a0, $a0, $s1
    lw          $v1, 0x0($v1)
    lw          $a0, 0x0($a0)
    addu        $v0, $a1, $t2
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $a0
    sra         $v1, $v1, 16
    sb          $v0, 0x0($a3)
    addu        $v0, $a1, $v1
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, -0x1($t0)
    addu        $v0, $a1, $t4
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t3, $t3, 0x1
    sb          $v0, 0x0($t0)
    lbu         $a1, 0x0($t3)
    addiu       $t6, $t6, 0x1
    addu        $v0, $a1, $t2
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    addiu       $a2, $a2, 0x1
    addiu       $a3, $a3, 0x3
    sb          $v0, 0x0($a3)
    addu        $v0, $a1, $v1
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t5, $t5, -0x1
    addiu       $t0, $t0, 0x3
    sb          $v0, -0x1($t0)
    addu        $v0, $a1, $t4
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t3, $t3, 0x1
    addiu       $a3, $a3, 0x3
    sb          $v0, 0x0($t0)
    bnez        $t5, .L80062D10
    addiu       $t0, $t0, 0x3
.L80062DD8:
    lw          $v0, 0x70($t7)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80062E54
    nop
    lbu         $a0, 0x0($a2)
    lbu         $v1, 0x0($t6)
    lbu         $a1, 0x0($t3)
    sll         $a0, $a0, 2
    addu        $v0, $a0, $t8
    lw          $t2, 0x0($v0)
    sll         $v0, $v1, 2
    addu        $v1, $v0, $t9
    lw          $t4, 0x0($v1)
    addu        $v0, $v0, $s0
    addu        $a0, $a0, $s1
    lw          $v1, 0x0($v0)
    lw          $a0, 0x0($a0)
    addu        $v0, $a1, $t2
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $a0
    sra         $v1, $v1, 16
    sb          $v0, 0x0($a3)
    addu        $v0, $a1, $v1
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x1($a3)
    addu        $v0, $a1, $t4
    addu        $v0, $t1, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x2($a3)
.L80062E54:
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x8
    jr          $ra
    nop
.end object_stream_state_update
