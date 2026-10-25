.text
.align 2
.set noreorder
.globl func_80061A10
.ent func_80061A10
func_80061A10:
    addiu       $sp, $sp, -0x30
    sw          $s3, 0x24($sp)
    addu        $s3, $a0, $zero
    sw          $s0, 0x18($sp)
    addu        $s0, $a1, $zero
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    lw          $v0, 0x4($s3)
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x0($v0)
    sll         $a2, $s0, 5
    jalr        $v0
    addu        $s2, $zero, $zero
    addu        $a0, $s3, $zero
    addu        $s1, $v0, $zero
    addu        $a1, $s1, $zero
    addiu       $v1, $zero, 0x1F
    addiu       $v0, $zero, 0x3F
    sw          $zero, 0x0($s1)
    sw          $v1, 0x4($s1)
    sw          $zero, 0x8($s1)
    sw          $v0, 0xC($s1)
    sw          $zero, 0x10($s1)
    jal         func_80061168
    sw          $v1, 0x14($s1)
    addu        $a0, $s3, $zero
    addu        $a1, $s1, $zero
    addiu       $a2, $zero, 0x1
    jal         func_800615F4
    addu        $a3, $s0, $zero
    addu        $s4, $v0, $zero
    blez        $s4, .L80061AC0
    nop
    addu        $s0, $s1, $zero
.L80061AA0:
    addu        $a0, $s3, $zero
    addu        $a1, $s0, $zero
    jal         func_800617C8
    addu        $a2, $s2, $zero
    addiu       $s2, $s2, 0x1
    slt         $v0, $s2, $s4
    bnez        $v0, .L80061AA0
    addiu       $s0, $s0, 0x20
.L80061AC0:
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x5F
    sw          $s4, 0x84($s3)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s4, 0x18($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addu        $a0, $s3, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80061A10
