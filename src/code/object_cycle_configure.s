.text
.align 2
.set noreorder
.globl object_cycle_configure
.ent object_cycle_configure
object_cycle_configure:
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
    bnez        $s0, .L80058260
    nop
    lw          $v0, 0xC($s2)
    jalr        $v0
    nop
    beqz        $v0, .L80058360
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L80058260:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80058290
    sll         $s4, $v0, 8
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80058360
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L80058290:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addu        $s4, $s4, $v0
    addiu       $v0, $zero, 0x4
    beq         $s4, $v0, .L800582C4
    addiu       $s1, $s1, 0x1
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x9
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s3, $zero
.L800582C4:
    bnez        $s0, .L800582E8
    nop
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80058360
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L800582E8:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80058318
    sll         $s4, $v0, 8
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80058360
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L80058318:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    addu        $s4, $s4, $v0
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x51
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s4, 0x18($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s3, $zero
    addiu       $v0, $zero, 0x1
    sw          $s4, 0x114($s3)
    sw          $s1, 0x0($s2)
    sw          $s0, 0x4($s2)
.L80058360:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end object_cycle_configure
