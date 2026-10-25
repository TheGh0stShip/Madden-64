.text
.align 2
.set noreorder
.globl object_animation_cycle
.ent object_animation_cycle
object_animation_cycle:
    addiu       $sp, $sp, -0x40
    sw          $s3, 0x2C($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s4, 0x14($s3)
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
    bnez        $s1, .L800576D4
    nop
    lw          $v0, 0xC($s4)
    jalr        $v0
    nop
    beqz        $v0, .L8005788C
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L800576D4:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    bnez        $s1, .L80057704
    sll         $s5, $v0, 8
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L8005788C
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L80057704:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addu        $s5, $s5, $v0
    addiu       $s5, $s5, -0x2
    slti        $v0, $s5, 0xC
    bnez        $v0, .L80057840
    addiu       $s2, $s2, 0x1
    addiu       $s0, $sp, 0x10
    addiu       $s6, $sp, 0x1C
.L80057728:
    bnez        $s1, .L8005774C
    nop
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L8005788C
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L8005774C:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    sb          $v0, 0x0($s0)
    addiu       $s0, $s0, 0x1
    slt         $v0, $s0, $s6
    bnez        $v0, .L80057728
    addiu       $s2, $s2, 0x1
    lbu         $v1, 0x10($sp)
    addiu       $v0, $zero, 0x41
    bne         $v1, $v0, .L80057824
    addiu       $s5, $s5, -0xC
    lbu         $v1, 0x11($sp)
    addiu       $v0, $zero, 0x64
    bne         $v1, $v0, .L80057824
    addiu       $v0, $zero, 0x6F
    lbu         $v1, 0x12($sp)
    bne         $v1, $v0, .L80057824
    addiu       $v0, $zero, 0x62
    lbu         $v1, 0x13($sp)
    bne         $v1, $v0, .L80057824
    addiu       $v0, $zero, 0x65
    lbu         $v1, 0x14($sp)
    bne         $v1, $v0, .L80057824
    nop
    lbu         $a1, 0x15($sp)
    lbu         $v0, 0x16($sp)
    lbu         $a0, 0x17($sp)
    lbu         $v1, 0x18($sp)
    sll         $a1, $a1, 8
    addu        $a1, $a1, $v0
    sll         $a0, $a0, 8
    addu        $a0, $a0, $v1
    lbu         $v1, 0x19($sp)
    lbu         $v0, 0x1A($sp)
    lbu         $s0, 0x1B($sp)
    sll         $v1, $v1, 8
    addu        $v1, $v1, $v0
    lw          $v0, 0x0($s3)
    sw          $a1, 0x18($v0)
    sw          $a0, 0x1C($v0)
    sw          $v1, 0x20($v0)
    sw          $s0, 0x24($v0)
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x4B
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a0, $s3, $zero
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x124($s3)
    j .L80057868
    sb          $s0, 0x128($s3)
.L80057824:
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x4D
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s3)
    addiu       $v0, $s5, 0xC
    j .L80057854
    sw          $v0, 0x18($v1)
.L80057840:
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x4D
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s5, 0x18($v0)
.L80057854:
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addu        $a0, $s3, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
.L80057868:
    sw          $s2, 0x0($s4)
    blez        $s5, .L80057888
    sw          $s1, 0x4($s4)
    lw          $v0, 0x14($s3)
    lw          $v0, 0x10($v0)
    addu        $a0, $s3, $zero
    jalr        $v0
    addu        $a1, $s5, $zero
.L80057888:
    addiu       $v0, $zero, 0x1
.L8005788C:
    lw          $ra, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end object_animation_cycle
