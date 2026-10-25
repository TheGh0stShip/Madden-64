.text
.align 2
.set noreorder
.globl func_8005FB9C
.ent func_8005FB9C
func_8005FB9C:
    addiu       $sp, $sp, -0x18
    lw          $t7, 0x28($sp)
    addu        $t8, $a1, $zero
    sw          $s4, 0x10($sp)
    sw          $s3, 0xC($sp)
    sw          $s2, 0x8($sp)
    sw          $s1, 0x4($sp)
    sw          $s0, 0x0($sp)
    lw          $v0, 0x1C4($a0)
    lw          $s0, 0x70($a0)
    lw          $a1, 0x140($a0)
    addiu       $t7, $t7, -0x1
    lw          $s4, 0x8($v0)
    lw          $s3, 0xC($v0)
    lw          $s2, 0x10($v0)
    lw          $s1, 0x14($v0)
    bltz        $t7, .L8005FCDC
    addiu       $t6, $a1, 0xFF
    sll         $a0, $a2, 2
.L8005FBE8:
    addiu       $a2, $a2, 0x1
    lw          $t5, 0x0($a3)
    lw          $v0, 0x0($t8)
    lw          $v1, 0x4($t8)
    addu        $v0, $a0, $v0
    lw          $t2, 0x0($v0)
    addu        $v1, $a0, $v1
    lw          $v0, 0x8($t8)
    lw          $t0, 0x0($v1)
    lw          $v1, 0xC($t8)
    addu        $v0, $a0, $v0
    lw          $a1, 0x0($v0)
    addu        $a0, $a0, $v1
    lw          $v0, 0x0($a0)
    beqz        $s0, .L8005FCD0
    addiu       $a3, $a3, 0x4
    addu        $t1, $v0, $zero
    addu        $t4, $a1, $zero
    addu        $t3, $t0, $zero
    addu        $t9, $s0, $t1
    addiu       $t0, $t5, 0x3
.L8005FC3C:
    lbu         $v1, 0x0($t4)
    lbu         $a1, 0x0($t2)
    sll         $v1, $v1, 2
    addu        $v0, $v1, $s4
    lw          $v0, 0x0($v0)
    lbu         $a0, 0x0($t3)
    addu        $v0, $a1, $v0
    subu        $v0, $t6, $v0
    lbu         $v0, 0x0($v0)
    sll         $a0, $a0, 2
    addu        $v1, $v1, $s2
    sb          $v0, 0x0($t5)
    addu        $v0, $a0, $s1
    lw          $v0, 0x0($v0)
    lw          $v1, 0x0($v1)
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 16
    addu        $v0, $a1, $v0
    subu        $v0, $t6, $v0
    lbu         $v0, 0x0($v0)
    addu        $a0, $a0, $s3
    sb          $v0, -0x2($t0)
    lw          $v0, 0x0($a0)
    addiu       $t4, $t4, 0x1
    addu        $a1, $a1, $v0
    subu        $a1, $t6, $a1
    lbu         $v0, 0x0($a1)
    addiu       $t3, $t3, 0x1
    addiu       $t2, $t2, 0x1
    sb          $v0, -0x1($t0)
    lbu         $v0, 0x0($t1)
    addiu       $t5, $t5, 0x4
    addiu       $t1, $t1, 0x1
    sb          $v0, 0x0($t0)
    sltu        $v0, $t1, $t9
    bnez        $v0, .L8005FC3C
    addiu       $t0, $t0, 0x4
.L8005FCD0:
    addiu       $t7, $t7, -0x1
    bgez        $t7, .L8005FBE8
    sll         $a0, $a2, 2
.L8005FCDC:
    lw          $s4, 0x10($sp)
    lw          $s3, 0xC($sp)
    lw          $s2, 0x8($sp)
    lw          $s1, 0x4($sp)
    lw          $s0, 0x0($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8005FB9C
