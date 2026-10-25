.text
.align 2
.set noreorder
.globl object_stream_decode
.ent object_stream_decode
object_stream_decode:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x0($sp)
    addu        $s0, $a0, $zero
    sw          $s4, 0x10($sp)
    sw          $s3, 0xC($sp)
    sw          $s2, 0x8($sp)
    sw          $s1, 0x4($sp)
    lw          $t2, 0x0($a3)
    lw          $v1, 0x0($a1)
    lw          $t4, 0x4($a3)
    sll         $v0, $a2, 3
    sll         $a2, $a2, 2
    addu        $v0, $v0, $v1
    lw          $t6, 0x0($v0)
    lw          $t7, 0x4($v0)
    lw          $v0, 0x4($a1)
    lw          $a3, 0x140($s0)
    lw          $v1, 0x8($a1)
    addu        $v0, $a2, $v0
    lw          $t9, 0x0($v0)
    addu        $a2, $a2, $v1
    lw          $v1, 0x70($s0)
    lw          $v0, 0x1C0($s0)
    lw          $a2, 0x0($a2)
    srl         $t8, $v1, 1
    lw          $s1, 0x10($v0)
    lw          $s2, 0x14($v0)
    lw          $s4, 0x18($v0)
    lw          $s3, 0x1C($v0)
    beqz        $t8, .L80063034
    nop
    addiu       $t1, $t4, 0x2
    addiu       $t0, $t2, 0x2
.L80062EEC:
    lbu         $a0, 0x0($a2)
    lbu         $v1, 0x0($t9)
    lbu         $a1, 0x0($t6)
    sll         $a0, $a0, 2
    addu        $v0, $a0, $s1
    lw          $t3, 0x0($v0)
    sll         $v1, $v1, 2
    addu        $v0, $v1, $s2
    lw          $t5, 0x0($v0)
    addu        $v1, $v1, $s3
    addu        $a0, $a0, $s4
    lw          $v1, 0x0($v1)
    lw          $a0, 0x0($a0)
    addu        $v0, $a1, $t3
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $a0
    sra         $v1, $v1, 16
    sb          $v0, 0x0($t2)
    addu        $v0, $a1, $v1
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, -0x1($t0)
    addu        $v0, $a1, $t5
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t6, $t6, 0x1
    sb          $v0, 0x0($t0)
    lbu         $a1, 0x0($t6)
    addu        $v0, $a1, $t3
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t2, $t2, 0x3
    sb          $v0, 0x0($t2)
    addu        $v0, $a1, $v1
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t0, $t0, 0x3
    sb          $v0, -0x1($t0)
    addu        $v0, $a1, $t5
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x0($t0)
    lbu         $a1, 0x0($t7)
    addu        $v0, $a1, $t3
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x0($t4)
    addu        $v0, $a1, $v1
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t9, $t9, 0x1
    sb          $v0, -0x1($t1)
    addu        $v0, $a1, $t5
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $a2, $a2, 0x1
    addiu       $t7, $t7, 0x1
    sb          $v0, 0x0($t1)
    lbu         $a1, 0x0($t7)
    addiu       $t8, $t8, -0x1
    addiu       $t6, $t6, 0x1
    addu        $v0, $a1, $t3
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t2, $t2, 0x3
    addiu       $t4, $t4, 0x3
    sb          $v0, 0x0($t4)
    addu        $v0, $a1, $v1
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t0, $t0, 0x3
    addiu       $t1, $t1, 0x3
    sb          $v0, -0x1($t1)
    addu        $v0, $a1, $t5
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addiu       $t7, $t7, 0x1
    addiu       $t4, $t4, 0x3
    sb          $v0, 0x0($t1)
    bnez        $t8, .L80062EEC
    addiu       $t1, $t1, 0x3
.L80063034:
    lw          $v0, 0x70($s0)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800630E4
    nop
    lbu         $a0, 0x0($a2)
    lbu         $v1, 0x0($t9)
    lbu         $a1, 0x0($t6)
    sll         $a0, $a0, 2
    addu        $v0, $a0, $s1
    lw          $t3, 0x0($v0)
    sll         $v0, $v1, 2
    addu        $v1, $v0, $s2
    lw          $t5, 0x0($v1)
    addu        $v0, $v0, $s3
    addu        $a0, $a0, $s4
    lw          $v1, 0x0($v0)
    lw          $a0, 0x0($a0)
    addu        $v0, $a1, $t3
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    addu        $v1, $v1, $a0
    sra         $v1, $v1, 16
    sb          $v0, 0x0($t2)
    addu        $v0, $a1, $v1
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x1($t2)
    addu        $v0, $a1, $t5
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x2($t2)
    lbu         $a1, 0x0($t7)
    addu        $v0, $a1, $t3
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x0($t4)
    addu        $v0, $a1, $v1
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x1($t4)
    addu        $v0, $a1, $t5
    addu        $v0, $a3, $v0
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x2($t4)
.L800630E4:
    lw          $s4, 0x10($sp)
    lw          $s3, 0xC($sp)
    lw          $s2, 0x8($sp)
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end object_stream_decode
