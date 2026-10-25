.text
.align 2
.set noreorder
.globl object_animation_blend
.ent object_animation_blend
object_animation_blend:
    addiu       $sp, $sp, -0x50
    sw          $s3, 0x34($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x4C($sp)
    sw          $fp, 0x48($sp)
    sw          $s7, 0x44($sp)
    sw          $s6, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    sw          $s0, 0x28($sp)
    lw          $v0, 0x1B4($s3)
    lw          $s5, 0x14($s3)
    lw          $v0, 0x54($v0)
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
    bnez        $v0, .L80056FF0
    addiu       $v0, $zero, 0x3D
    lw          $v1, 0x0($s3)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L80056FF0:
    bnez        $s1, .L80057014
    nop
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L80057014:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    bnez        $s1, .L80057044
    sll         $s0, $v0, 8
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L80057044:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    bnez        $s1, .L80057074
    addu        $s0, $s0, $v0
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L80057074:
    lbu         $fp, 0x0($s2)
    addiu       $s1, $s1, -0x1
    sll         $v0, $fp, 1
    addiu       $v0, $v0, 0x6
    xor         $v0, $s0, $v0
    sltu        $v0, $zero, $v0
    slti        $v1, $fp, 0x1
    or          $v0, $v0, $v1
    bnez        $v0, .L800570A8
    addiu       $s2, $s2, 0x1
    slti        $v0, $fp, 0x5
    bnez        $v0, .L800570C4
    nop
.L800570A8:
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x9
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s3, $zero
.L800570C4:
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x66
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $fp, 0x18($v0)
    lw          $v0, 0x0($s3)
    addu        $a0, $s3, $zero
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x4($v0)
    jalr        $v0
    addu        $s7, $zero, $zero
    beqz        $fp, .L8005720C
    sw          $fp, 0x144($s3)
    sw          $s3, 0x24($sp)
.L800570FC:
    bnez        $s1, .L80057120
    nop
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L80057120:
    lbu         $s6, 0x0($s2)
    addiu       $s1, $s1, -0x1
    bnez        $s1, .L8005714C
    addiu       $s2, $s2, 0x1
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L8005714C:
    lbu         $s4, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    lw          $s0, 0xD8($s3)
    lw          $a0, 0x20($s3)
    blez        $a0, .L80057180
    addu        $v1, $zero, $zero
.L80057168:
    lw          $v0, 0x0($s0)
    beq         $s6, $v0, .L800571A4
    addiu       $v1, $v1, 0x1
    slt         $v0, $v1, $a0
    bnez        $v0, .L80057168
    addiu       $s0, $s0, 0x54
.L80057180:
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x5
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s6, 0x18($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s3, $zero
.L800571A4:
    lw          $a2, 0x24($sp)
    srl         $v0, $s4, 4
    sw          $s0, 0x148($a2)
    sw          $v0, 0x14($s0)
    andi        $v0, $s4, 0xF
    sw          $v0, 0x18($s0)
    lw          $v1, 0x0($s3)
    sw          $s6, 0x18($v1)
    lw          $v0, 0x14($s0)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x18($s0)
    sw          $v0, 0x20($v1)
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x67
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s3, $zero
    lw          $a2, 0x24($sp)
    addiu       $a2, $a2, 0x4
    addiu       $s7, $s7, 0x1
    slt         $v0, $s7, $fp
    bnez        $v0, .L800570FC
    sw          $a2, 0x24($sp)
.L8005720C:
    bnez        $s1, .L80057230
    nop
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L80057230:
    lbu         $s4, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    bnez        $s1, .L80057260
    sw          $s4, 0x18C($s3)
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L80057260:
    lbu         $s4, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    bnez        $s1, .L80057290
    sw          $s4, 0x190($s3)
    lw          $v0, 0xC($s5)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L80057310
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s5)
    lw          $s1, 0x4($s5)
.L80057290:
    lbu         $s4, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    srl         $v0, $s4, 4
    sw          $v0, 0x194($s3)
    andi        $v0, $s4, 0xF
    sw          $v0, 0x198($s3)
    lw          $v1, 0x0($s3)
    lw          $v0, 0x18C($s3)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x190($s3)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x194($s3)
    sw          $v0, 0x20($v1)
    lw          $v0, 0x198($s3)
    sw          $v0, 0x24($v1)
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x68
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s3, $zero
    lw          $v0, 0x1B4($s3)
    sw          $zero, 0x58($v0)
    lw          $v1, 0x90($s3)
    addiu       $v0, $zero, 0x1
    addiu       $v1, $v1, 0x1
    sw          $v1, 0x90($s3)
    sw          $s2, 0x0($s5)
    sw          $s1, 0x4($s5)
.L80057310:
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
.end object_animation_blend
