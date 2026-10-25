.text
.align 2
.set noreorder
.globl func_8005F040
.ent func_8005F040
func_8005F040:
    addiu       $sp, $sp, -0x48
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x44($sp)
    sw          $fp, 0x40($sp)
    sw          $s7, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $v0, 0x1C0($s1)
    lw          $v1, 0x4($a1)
    lw          $s5, 0x0($a3)
    addu        $v0, $v0, $v1
    lw          $v1, 0x134($s1)
    lbu         $s6, 0x8C($v0)
    lbu         $s4, 0x96($v0)
    blez        $v1, .L8005F128
    addu        $s0, $zero, $zero
    slti        $fp, $s4, 0x2
    addiu       $s7, $s4, -0x1
    addu        $s3, $s5, $zero
    addu        $s2, $a2, $zero
.L8005F0A4:
    lw          $v1, 0x0($s3)
    lw          $v0, 0x70($s1)
    lw          $a0, 0x0($s2)
    addu        $a2, $v1, $v0
.L8005F0B4:
    sltu        $v0, $v1, $a2
.L8005F0B8:
    beqz        $v0, .L8005F0E4
    addu        $v0, $s6, $zero
    lbu         $a1, 0x0($a0)
    blez        $v0, .L8005F0B4
    addiu       $a0, $a0, 0x1
.L8005F0CC:
    sb          $a1, 0x0($v1)
    addiu       $v0, $v0, -0x1
    bgtz        $v0, .L8005F0CC
    addiu       $v1, $v1, 0x1
    j .L8005F0B8
    sltu        $v0, $v1, $a2
.L8005F0E4:
    bnel        $fp, $zero, .L8005F110
    addiu       $s2, $s2, 0x4
    sw          $s7, 0x10($sp)
    lw          $v0, 0x70($s1)
    addu        $a0, $s5, $zero
    addu        $a1, $s0, $zero
    addu        $a2, $s5, $zero
    addiu       $a3, $s0, 0x1
    jal         func_80063250
    sw          $v0, 0x14($sp)
    addiu       $s2, $s2, 0x4
.L8005F110:
    sll         $v1, $s4, 2
    lw          $v0, 0x134($s1)
    addu        $s0, $s0, $s4
    slt         $v0, $s0, $v0
    bnez        $v0, .L8005F0A4
    addu        $s3, $s3, $v1
.L8005F128:
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_8005F040
