.text
.align 2
.set noreorder
.globl object_cycle_prepare
.ent object_cycle_prepare
object_cycle_prepare:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s0, 0x10($sp)
    lw          $s2, 0x19C($s1)
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x75
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sw          $s2, 0x18($v0)
    lw          $v0, 0x0($s1)
    addu        $s0, $a1, $zero
    sw          $s0, 0x1C($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addiu       $a1, $zero, -0x1
    addiu       $v0, $s0, 0x1
    andi        $v0, $v0, 0x7
    addiu       $s6, $v0, 0xD0
    addiu       $v0, $s0, 0x2
    andi        $v0, $v0, 0x7
    addiu       $s5, $v0, 0xD0
    addiu       $v0, $s0, -0x1
    andi        $v0, $v0, 0x7
    addiu       $s4, $v0, 0xD0
    addiu       $s0, $s0, -0x2
    andi        $s0, $s0, 0x7
    addiu       $s3, $s0, 0xD0
    slti        $v0, $s2, 0xC0
.L80058B98:
    bnez        $v0, .L80058BD4
    addiu       $s0, $zero, 0x2
    addiu       $v0, $s2, -0xD0
    sltiu       $v0, $v0, 0x8
    beqz        $v0, .L80058BD4
    addiu       $s0, $zero, 0x3
    beq         $s2, $s6, .L80058BD4
    nop
    beq         $s2, $s5, .L80058BD4
    nop
    beq         $s2, $s4, .L80058BD4
    addiu       $s0, $zero, 0x2
    bne         $s2, $s3, .L80058BD4
    addiu       $s0, $zero, 0x1
    addiu       $s0, $zero, 0x2
.L80058BD4:
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0x60
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sw          $s2, 0x18($v0)
    lw          $v0, 0x0($s1)
    sw          $s0, 0x1C($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    addu        $a0, $s1, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x4
    addiu       $v0, $zero, 0x2
    beq         $s0, $v0, .L80058C3C
    slti        $v0, $s0, 0x3
    beqz        $v0, .L80058C28
    addiu       $v0, $zero, 0x1
    beql        $s0, $v0, .L80058C5C
    sw          $zero, 0x19C($s1)
    j .L80058B98
    slti        $v0, $s2, 0xC0
.L80058C28:
    addiu       $v0, $zero, 0x3
    beq         $s0, $v0, .L80058C5C
    addiu       $v0, $zero, 0x1
    j .L80058B98
    slti        $v0, $s2, 0xC0
.L80058C3C:
    jal         func_8005848C
    addu        $a0, $s1, $zero
    beqz        $v0, .L80058C5C
    addu        $v0, $zero, $zero
    lw          $s2, 0x19C($s1)
    j .L80058B98
    slti        $v0, $s2, 0xC0
    addiu       $v0, $zero, 0x1
.L80058C5C:
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end object_cycle_prepare
