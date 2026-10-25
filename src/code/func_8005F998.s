.text
.align 2
.set noreorder
.globl func_8005F998
.ent func_8005F998
func_8005F998:
    addiu       $sp, $sp, -0x10
    lw          $t6, 0x20($sp)
    sw          $s3, 0xC($sp)
    sw          $s2, 0x8($sp)
    sw          $s1, 0x4($sp)
    sw          $s0, 0x0($sp)
    lw          $v0, 0x1C4($a0)
    lw          $t9, 0x70($a0)
    lw          $t5, 0x140($a0)
    addiu       $t6, $t6, -0x1
    lw          $s3, 0x8($v0)
    lw          $s2, 0xC($v0)
    lw          $s1, 0x10($v0)
    lw          $s0, 0x14($v0)
    bltz        $t6, .L8005FAB8
    addu        $t8, $a1, $zero
    sll         $a0, $a2, 2
.L8005F9DC:
    addiu       $a2, $a2, 0x1
    lw          $v1, 0x0($t8)
    lw          $t4, 0x0($a3)
    lw          $v0, 0x4($t8)
    addu        $v1, $a0, $v1
    lw          $t1, 0x0($v1)
    lw          $v1, 0x8($t8)
    addu        $v0, $a0, $v0
    lw          $a1, 0x0($v0)
    addu        $a0, $a0, $v1
    lw          $v0, 0x0($a0)
    beqz        $t9, .L8005FAAC
    addiu       $a3, $a3, 0x4
    addu        $t0, $v0, $zero
    addu        $t3, $a1, $zero
    addu        $t2, $t1, $zero
    addu        $t7, $t9, $t0
    addiu       $t1, $t4, 0x2
.L8005FA24:
    lbu         $v1, 0x0($t0)
    lbu         $a1, 0x0($t2)
    sll         $v1, $v1, 2
    addu        $v0, $v1, $s3
    lw          $v0, 0x0($v0)
    lbu         $a0, 0x0($t3)
    addu        $v0, $a1, $v0
    addu        $v0, $t5, $v0
    lbu         $v0, 0x0($v0)
    sll         $a0, $a0, 2
    addu        $v1, $v1, $s1
    sb          $v0, 0x0($t4)
    addu        $v0, $a0, $s0
    lw          $v0, 0x0($v0)
    lw          $v1, 0x0($v1)
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 16
    addu        $v0, $a1, $v0
    addu        $v0, $t5, $v0
    lbu         $v0, 0x0($v0)
    addu        $a0, $a0, $s2
    sb          $v0, -0x1($t1)
    lw          $v0, 0x0($a0)
    addiu       $t0, $t0, 0x1
    addiu       $t3, $t3, 0x1
    addu        $a1, $a1, $v0
    addu        $a1, $t5, $a1
    lbu         $v0, 0x0($a1)
    addiu       $t2, $t2, 0x1
    addiu       $t4, $t4, 0x3
    sb          $v0, 0x0($t1)
    sltu        $v0, $t0, $t7
    bnez        $v0, .L8005FA24
    addiu       $t1, $t1, 0x3
.L8005FAAC:
    addiu       $t6, $t6, -0x1
    bgez        $t6, .L8005F9DC
    sll         $a0, $a2, 2
.L8005FAB8:
    lw          $s3, 0xC($sp)
    lw          $s2, 0x8($sp)
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end func_8005F998
