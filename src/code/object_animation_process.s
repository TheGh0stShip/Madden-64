.text
.align 2
.set noreorder
.globl object_animation_process
.ent object_animation_process
object_animation_process:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s3, 0x14($s2)
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
    sw          $a1, 0xDC($s2)
    bnez        $s0, .L80056BAC
    sw          $a2, 0xE0($s2)
    lw          $v0, 0xC($s3)
    jalr        $v0
    nop
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056BAC:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80056BDC
    sll         $s4, $v0, 8
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056BDC:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80056C0C
    addu        $s4, $s4, $v0
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056C0C:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80056C3C
    sw          $v0, 0xD4($s2)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056C3C:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    sll         $v0, $v0, 8
    bnez        $s0, .L80056C70
    sw          $v0, 0x1C($s2)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056C70:
    lbu         $v1, 0x0($s1)
    lw          $v0, 0x1C($s2)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    addu        $v0, $v0, $v1
    bnez        $s0, .L80056CA8
    sw          $v0, 0x1C($s2)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056CA8:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    sll         $v0, $v0, 8
    bnez        $s0, .L80056CDC
    sw          $v0, 0x18($s2)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056CDC:
    lbu         $v1, 0x0($s1)
    lw          $v0, 0x18($s2)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    addu        $v0, $v0, $v1
    bnez        $s0, .L80056D14
    sw          $v0, 0x18($s2)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056D14:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    sw          $v0, 0x20($s2)
    addiu       $s4, $s4, -0x8
    lw          $v1, 0x0($s2)
    lw          $v0, 0x19C($s2)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x18($s2)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x1C($s2)
    sw          $v0, 0x20($v1)
    lw          $v0, 0x20($s2)
    sw          $v0, 0x24($v1)
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x63
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s2, $zero
    lw          $v0, 0x1B4($s2)
    lw          $v0, 0x54($v0)
    beqz        $v0, .L80056D94
    addiu       $v0, $zero, 0x39
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80056D94:
    lw          $v0, 0x1C($s2)
    beqz        $v0, .L80056DB8
    nop
    lw          $v0, 0x18($s2)
    beqz        $v0, .L80056DB8
    nop
    lw          $v0, 0x20($s2)
    bgtz        $v0, .L80056DD4
    nop
.L80056DB8:
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x1F
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80056DD4:
    lw          $v1, 0x20($s2)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    beq         $s4, $v0, .L80056E00
    addiu       $v0, $zero, 0x9
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L80056E00:
    lw          $v0, 0xD8($s2)
    bnez        $v0, .L80056E38
    addu        $a0, $s2, $zero
    lw          $v0, 0x20($s2)
    addiu       $a1, $zero, 0x1
    lw          $v1, 0x4($s2)
    sll         $a2, $v0, 2
    addu        $a2, $a2, $v0
    sll         $a2, $a2, 2
    lw          $v1, 0x0($v1)
    addu        $a2, $a2, $v0
    jalr        $v1
    sll         $a2, $a2, 2
    sw          $v0, 0xD8($s2)
.L80056E38:
    lw          $v0, 0x20($s2)
    lw          $s5, 0xD8($s2)
    blez        $v0, .L80056F48
    addu        $s6, $zero, $zero
    addiu       $s4, $s5, 0x10
.L80056E4C:
    bnez        $s0, .L80056E70
    sw          $s6, -0xC($s4)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056E70:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    bnez        $s0, .L80056EA0
    sw          $v0, 0x0($s5)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056EA0:
    lbu         $v1, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    srl         $v0, $v1, 4
    andi        $v1, $v1, 0xF
    sw          $v0, -0x8($s4)
    bnez        $s0, .L80056EDC
    sw          $v1, -0x4($s4)
    lw          $v0, 0xC($s3)
    jalr        $v0
    addu        $a0, $s2, $zero
    beqz        $v0, .L80056F60
    addu        $v0, $zero, $zero
    lw          $s1, 0x0($s3)
    lw          $s0, 0x4($s3)
.L80056EDC:
    lbu         $v0, 0x0($s1)
    addiu       $s0, $s0, -0x1
    addiu       $s1, $s1, 0x1
    sw          $v0, 0x0($s4)
    lw          $v1, 0x0($s2)
    lw          $v0, 0x0($s5)
    sw          $v0, 0x18($v1)
    lw          $v0, -0x8($s4)
    sw          $v0, 0x1C($v1)
    lw          $v0, -0x4($s4)
    sw          $v0, 0x20($v1)
    lw          $v0, 0x0($s4)
    sw          $v0, 0x24($v1)
    lw          $v1, 0x0($s2)
    addiu       $v0, $zero, 0x64
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s2, $zero
    addiu       $s6, $s6, 0x1
    lw          $v0, 0x20($s2)
    addiu       $s4, $s4, 0x54
    slt         $v0, $s6, $v0
    bnez        $v0, .L80056E4C
    addiu       $s5, $s5, 0x54
.L80056F48:
    lw          $a0, 0x1B4($s2)
    addiu       $v0, $zero, 0x1
    addiu       $v1, $zero, 0x1
    sw          $v1, 0x54($a0)
    sw          $s1, 0x0($s3)
    sw          $s0, 0x4($s3)
.L80056F60:
    lw          $ra, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end object_animation_process
