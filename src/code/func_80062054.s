.text
.align 2
.set noreorder
.globl func_80062054
.ent func_80062054
func_80062054:
    addiu       $sp, $sp, -0x50
    sw          $s7, 0x44($sp)
    addu        $s7, $a0, $zero
    sw          $ra, 0x4C($sp)
    sw          $fp, 0x48($sp)
    sw          $s6, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    sw          $s0, 0x28($sp)
    sw          $a3, 0x14($sp)
    lw          $v0, 0x1C8($s7)
    lw          $t0, 0x70($s7)
    lw          $fp, 0x18($v0)
    addu        $s4, $zero, $zero
    blez        $a3, .L8006213C
    sw          $t0, 0x1C($sp)
    addu        $s6, $a2, $zero
    addu        $s5, $a1, $zero
.L800620A8:
    lw          $s2, 0x1C($sp)
    lw          $s0, 0x0($s5)
    lw          $s3, 0x0($s6)
    beql        $s2, $zero, .L80062128
    addiu       $s6, $s6, 0x4
.L800620BC:
    lbu         $v1, 0x0($s0)
    addiu       $s0, $s0, 0x1
    lbu         $v0, 0x0($s0)
    addiu       $s0, $s0, 0x1
    lbu         $a0, 0x0($s0)
    srl         $a1, $v1, 3
    srl         $a2, $v0, 2
    sll         $v0, $a1, 2
    addu        $v0, $v0, $fp
    lw          $v1, 0x0($v0)
    srl         $a3, $a0, 3
    sll         $v0, $a2, 6
    addu        $v1, $v1, $v0
    sll         $v0, $a3, 1
    addu        $s1, $v1, $v0
    lhu         $v0, 0x0($s1)
    bnez        $v0, .L8006210C
    addiu       $s0, $s0, 0x1
    jal         func_80061F10
    addu        $a0, $s7, $zero
.L8006210C:
    lbu         $v0, 0x1($s1)
    addiu       $s2, $s2, -0x1
    addiu       $v0, $v0, -0x1
    sb          $v0, 0x0($s3)
    bnez        $s2, .L800620BC
    addiu       $s3, $s3, 0x1
    addiu       $s6, $s6, 0x4
.L80062128:
    lw          $t0, 0x14($sp)
    addiu       $s4, $s4, 0x1
    slt         $v0, $s4, $t0
    bnez        $v0, .L800620A8
    addiu       $s5, $s5, 0x4
.L8006213C:
    lw          $ra, 0x4C($sp)
    lw          $fp, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_80062054
