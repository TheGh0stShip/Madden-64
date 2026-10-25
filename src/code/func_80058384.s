.text
.align 2
.set noreorder
.globl func_80058384
.ent func_80058384
func_80058384:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s2, 0x14($s3)
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
    bnez        $s0, .L800583D4
    nop
    lw          $v0, 0xC($s2)
    jalr        $v0
    nop
    beqz        $v0, .L80058468
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L800583D4:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80058404
    sll         $s4, $v0, 8
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80058468
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L80058404:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    addu        $s4, $s4, $v0
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x5A
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s3)
    lw          $v0, 0x19C($s3)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s3)
    sw          $s4, 0x1C($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s3, $zero
    sw          $s1, 0x0($s2)
    sw          $s0, 0x4($s2)
    lw          $v0, 0x14($s3)
    lw          $v0, 0x10($v0)
    addu        $a0, $s3, $zero
    jalr        $v0
    addiu       $a1, $s4, -0x2
    addiu       $v0, $zero, 0x1
.L80058468:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80058384
