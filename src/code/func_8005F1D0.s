.text
.align 2
.set noreorder
.globl func_8005F1D0
.ent func_8005F1D0
func_8005F1D0:
    addiu       $sp, $sp, -0x40
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $v0, 0x134($s1)
    lw          $s4, 0x0($a3)
    blez        $v0, .L8005F284
    addu        $s0, $zero, $zero
    addiu       $s5, $zero, 0x1
    addu        $s3, $s4, $zero
    addu        $s2, $a2, $zero
.L8005F210:
    lw          $v1, 0x0($s3)
    lw          $v0, 0x70($s1)
    lw          $a0, 0x0($s2)
    addu        $a1, $v1, $v0
    sltu        $v0, $v1, $a1
    beql        $v0, $zero, .L8005F250
    sw          $s5, 0x10($sp)
.L8005F22C:
    lbu         $v0, 0x0($a0)
    sb          $v0, 0x0($v1)
    addiu       $v1, $v1, 0x1
    sb          $v0, 0x0($v1)
    addiu       $v1, $v1, 0x1
    sltu        $v0, $v1, $a1
    bnez        $v0, .L8005F22C
    addiu       $a0, $a0, 0x1
    sw          $s5, 0x10($sp)
.L8005F250:
    lw          $v0, 0x70($s1)
    addiu       $s2, $s2, 0x4
    addu        $a0, $s4, $zero
    addu        $a1, $s0, $zero
    addu        $a2, $s4, $zero
    addiu       $a3, $s0, 0x1
    jal         func_80063250
    sw          $v0, 0x14($sp)
    lw          $v0, 0x134($s1)
    addiu       $s0, $s0, 0x2
    slt         $v0, $s0, $v0
    bnez        $v0, .L8005F210
    addiu       $s3, $s3, 0x8
.L8005F284:
    lw          $ra, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_8005F1D0
