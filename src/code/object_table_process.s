.text
.align 2
.set noreorder
.globl object_table_process
.ent object_table_process
object_table_process:
    addiu       $sp, $sp, -0x80
    sw          $ra, 0x7C($sp)
    sw          $fp, 0x78($sp)
    sw          $s7, 0x74($sp)
    sw          $s6, 0x70($sp)
    sw          $s5, 0x6C($sp)
    sw          $s4, 0x68($sp)
    sw          $s3, 0x64($sp)
    sw          $s2, 0x60($sp)
    sw          $s1, 0x5C($sp)
    sw          $s0, 0x58($sp)
    sw          $a2, 0x14($sp)
    sw          $a3, 0x1C($sp)
    lw          $s0, 0x1C8($a0)
    lw          $s2, 0x78($a0)
    lw          $s6, 0x70($a0)
    lw          $a0, 0x140($a0)
    blez        $a3, .L80060CBC
    sw          $a0, 0x24($sp)
    addiu       $s1, $s6, -0x1
    sw          $s1, 0x34($sp)
    .word       0x02320018  # mult        $s1, $s2
    .word       0x00008812  # mflo        $s1
    sll         $v0, $s6, 1
    lw          $s5, 0x14($sp)
    addiu       $v0, $v0, 0x2
    addu        $s7, $a1, $zero
    sw          $v0, 0x44($sp)
    sw          $s1, 0x3C($sp)
.L80060B50:
    lw          $a0, 0x0($s5)
    jal         func_800632F4
    addu        $a1, $s6, $zero
    blez        $s2, .L80060C90
    addu        $t4, $zero, $zero
    sw          $s7, 0x2C($sp)
    addu        $fp, $s5, $zero
    addu        $t8, $zero, $zero
    addu        $t7, $s0, $zero
.L80060B74:
    lw          $s1, 0x2C($sp)
    lw          $v0, 0x0($s1)
    lw          $v1, 0x54($s0)
    lw          $t1, 0x0($fp)
    beqz        $v1, .L80060BB4
    addu        $t2, $v0, $t4
    lw          $s1, 0x3C($sp)
    addu        $t2, $t2, $s1
    lw          $s1, 0x34($sp)
    lw          $v0, 0x44($t7)
    addu        $t1, $t1, $s1
    lw          $s1, 0x44($sp)
    addiu       $t6, $zero, -0x1
    negu        $t9, $s2
    j .L80060BC0
    addu        $t0, $v0, $s1
.L80060BB4:
    addiu       $t6, $zero, 0x1
    addu        $t9, $s2, $zero
    lw          $t0, 0x44($t7)
.L80060BC0:
    addu        $a2, $zero, $zero
    addu        $t3, $zero, $zero
    lw          $v0, 0x18($s0)
    addu        $a3, $s6, $zero
    lw          $v1, 0x10($s0)
    addu        $v0, $t8, $v0
    lw          $s4, 0x0($v0)
    addu        $v1, $t8, $v1
    lw          $s3, 0x0($v1)
    beqz        $a3, .L80060C78
    addu        $t5, $zero, $zero
    sll         $s1, $t6, 1
    sw          $s1, 0x54($sp)
.L80060BF4:
    lw          $s1, 0x54($sp)
    addu        $a1, $s1, $t0
    lh          $v0, 0x0($a1)
    lbu         $v1, 0x0($t2)
    lw          $s1, 0x24($sp)
    addu        $v0, $a2, $v0
    addiu       $v0, $v0, 0x8
    sra         $a2, $v0, 4
    addu        $a2, $a2, $v1
    addu        $v0, $s1, $a2
    lbu         $a2, 0x0($v0)
    addu        $v0, $s4, $a2
    lbu         $v1, 0x0($v0)
    lbu         $v0, 0x0($t1)
    addu        $t2, $t2, $t9
    addu        $v0, $v0, $v1
    addu        $v1, $s3, $v1
    sb          $v0, 0x0($t1)
    lbu         $v0, 0x0($v1)
    addiu       $a3, $a3, -0x1
    addu        $t1, $t1, $t6
    subu        $a2, $a2, $v0
    addu        $a0, $a2, $zero
    sll         $v0, $a2, 1
    addu        $a2, $a2, $v0
    addu        $v1, $t3, $a2
    addu        $a2, $a2, $v0
    addu        $t3, $t5, $a2
    addu        $t5, $a0, $zero
    addu        $a2, $a2, $v0
    sh          $v1, 0x0($t0)
    bnez        $a3, .L80060BF4
    addu        $t0, $a1, $zero
.L80060C78:
    sh          $t3, 0x0($t0)
    addiu       $t8, $t8, 0x4
    addiu       $t4, $t4, 0x1
    slt         $v0, $t4, $s2
    bnez        $v0, .L80060B74
    addiu       $t7, $t7, 0x4
.L80060C90:
    lw          $v0, 0x54($s0)
    sltiu       $v0, $v0, 0x1
    sw          $v0, 0x54($s0)
    lw          $s1, 0x1C($sp)
    sll         $v0, $s1, 2
    lw          $s1, 0x14($sp)
    addiu       $s5, $s5, 0x4
    addu        $v0, $v0, $s1
    slt         $v0, $s5, $v0
    bnez        $v0, .L80060B50
    addiu       $s7, $s7, 0x4
.L80060CBC:
    lw          $ra, 0x7C($sp)
    lw          $fp, 0x78($sp)
    lw          $s7, 0x74($sp)
    lw          $s6, 0x70($sp)
    lw          $s5, 0x6C($sp)
    lw          $s4, 0x68($sp)
    lw          $s3, 0x64($sp)
    lw          $s2, 0x60($sp)
    lw          $s1, 0x5C($sp)
    lw          $s0, 0x58($sp)
    addiu       $sp, $sp, 0x80
    jr          $ra
    nop
.end object_table_process
