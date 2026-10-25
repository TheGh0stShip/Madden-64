.text
.align 2
.set noreorder
.globl object_cycle_state_update
.ent object_cycle_state_update
object_cycle_state_update:
    addiu       $sp, $sp, -0x30
    sw          $s4, 0x20($sp)
    addu        $s4, $a0, $zero
    sw          $ra, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s2, 0x14($s4)
    addiu       $s6, $zero, 0xFF
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L800584C4:
    bnez        $s0, .L800584E8
    nop
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s4, $zero
    beqz        $v0, .L800585F8
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L800584E8:
    lbu         $s3, 0x0($s1)
    addiu       $s0, $s0, -0x1
    beq         $s3, $s6, .L80058544
    addiu       $s1, $s1, 0x1
    addiu       $s5, $zero, 0xFF
.L800584FC:
    lw          $v1, 0x1B4($s4)
    lw          $v0, 0x5C($v1)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x5C($v1)
    sw          $s1, 0x0($s2)
    bnez        $s0, .L80058534
    sw          $s0, 0x4($s2)
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s4, $zero
    beqz        $v0, .L800585F8
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L80058534:
    lbu         $s3, 0x0($s1)
    addiu       $s0, $s0, -0x1
    bne         $s3, $s5, .L800584FC
    addiu       $s1, $s1, 0x1
.L80058544:
    bnez        $s0, .L80058568
    nop
    lw          $v0, 0xC($s2)
    jalr        $v0
    addu        $a0, $s4, $zero
    beqz        $v0, .L800585F8
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s2)
    lw          $s0, 0x4($s2)
.L80058568:
    lbu         $s3, 0x0($s1)
    addiu       $s0, $s0, -0x1
    beq         $s3, $s6, .L80058544
    addiu       $s1, $s1, 0x1
    bnez        $s3, .L8005859C
    nop
    lw          $v1, 0x1B4($s4)
    lw          $v0, 0x5C($v1)
    addiu       $v0, $v0, 0x2
    sw          $v0, 0x5C($v1)
    sw          $s1, 0x0($s2)
    j .L800584C4
    sw          $s0, 0x4($s2)
.L8005859C:
    lw          $v0, 0x1B4($s4)
    lw          $v0, 0x5C($v0)
    beqz        $v0, .L800585E8
    addiu       $v0, $zero, 0x70
    lw          $v1, 0x0($s4)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x1B4($s4)
    lw          $v1, 0x0($s4)
    lw          $v0, 0x5C($v0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s4)
    sw          $s3, 0x1C($v0)
    lw          $v0, 0x0($s4)
    lw          $v0, 0x4($v0)
    addu        $a0, $s4, $zero
    jalr        $v0
    addiu       $a1, $zero, -0x1
    lw          $v0, 0x1B4($s4)
    sw          $zero, 0x5C($v0)
.L800585E8:
    addiu       $v0, $zero, 0x1
    sw          $s3, 0x19C($s4)
    sw          $s1, 0x0($s2)
    sw          $s0, 0x4($s2)
.L800585F8:
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
.end object_cycle_state_update
