.text
.align 2
.set noreorder
.globl func_80058624
.ent func_80058624
func_80058624:
    addiu       $sp, $sp, -0x30
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s2, 0x14($s3)
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
    bnez        $s0, .L80058678
    nop
    lw          $v0, 0xC($s2)
    jalr        $v0
    nop
    beqz        $v0, .L80058704
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L80058678:
    lbu         $s5, 0x0($s1)
    addiu       $s0, $s0, -0x1
    bnez        $s0, .L800586A4
    addiu       $s1, $s1, 0x1
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80058704
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L800586A4:
    lbu         $s4, 0x0($s1)
    addiu       $s0, $s0, -0x1
    xori        $v1, $s5, 0xFF
    sltu        $v1, $zero, $v1
    xori        $v0, $s4, 0xD8
    sltu        $v0, $zero, $v0
    or          $v1, $v1, $v0
    beqz        $v1, .L800586F4
    addiu       $s1, $s1, 0x1
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x34
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s5, 0x18($v0)
    lw          $v0, 0x0($s3)
    sw          $s4, 0x1C($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s3, $zero
.L800586F4:
    addiu       $v0, $zero, 0x1
    sw          $s4, 0x19C($s3)
    sw          $s1, 0x0($s2)
    sw          $s0, 0x4($s2)
.L80058704:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80058624
