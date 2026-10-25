.text
.align 2
.set noreorder
.globl object_animation_pose_update
.ent object_animation_pose_update
object_animation_pose_update:
    addiu       $sp, $sp, -0x40
    sw          $s3, 0x24($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x3C($sp)
    sw          $fp, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s4, 0x14($s3)
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
    bnez        $s1, .L80057F50
    nop
    lw          $v0, 0xC($s4)
    jalr        $v0
    nop
    beqz        $v0, .L800581DC
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L80057F50:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    bnez        $s1, .L80057F80
    sll         $s7, $v0, 8
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L800581DC
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L80057F80:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addu        $s7, $s7, $v0
    addiu       $s7, $s7, -0x2
    blez        $s7, .L800581D0
    addiu       $s2, $s2, 0x1
.L80057F98:
    bnez        $s1, .L80057FBC
    nop
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L800581DC
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L80057FBC:
    lbu         $s0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    sra         $a2, $s0, 4
    sw          $a2, 0x14($sp)
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x50
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    andi        $s0, $s0, 0xF
    sw          $s0, 0x18($v0)
    lw          $v0, 0x0($s3)
    sw          $a2, 0x1C($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addu        $a0, $s3, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
    slti        $v0, $s0, 0x4
    bnez        $v0, .L80058038
    sll         $v0, $s0, 2
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x1E
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s0, 0x18($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s3, $zero
    sll         $v0, $s0, 2
.L80058038:
    addu        $s0, $v0, $s3
    lw          $v0, 0xA4($s0)
    bnez        $v0, .L80058054
    nop
    jal         func_800633C0
    addu        $a0, $s3, $zero
    sw          $v0, 0xA4($s0)
.L80058054:
    lw          $fp, 0xA4($s0)
    addu        $s5, $zero, $zero
    lui         $s6, 0x8000
    addiu       $s6, $s6, 0x3528
.L80058064:
    lw          $a2, 0x14($sp)
    beqz        $a2, .L800580D8
    nop
    bnez        $s1, .L80058094
    nop
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L800581DC
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L80058094:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    bnez        $s1, .L800580C4
    sll         $s0, $v0, 8
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L800581DC
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
.L800580C4:
    lbu         $v0, 0x0($s2)
    addiu       $s1, $s1, -0x1
    addiu       $s2, $s2, 0x1
    j .L80058108
    addu        $s0, $s0, $v0
.L800580D8:
    bnel        $s1, $zero, .L80058100
    addiu       $s1, $s1, -0x1
    lw          $v0, 0xC($s4)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L800581DC
    addu        $v0, $zero, $zero
    lw          $s2, 0x0($s4)
    lw          $s1, 0x4($s4)
    addiu       $s1, $s1, -0x1
.L80058100:
    lbu         $s0, 0x0($s2)
    addiu       $s2, $s2, 0x1
.L80058108:
    lw          $v0, 0x0($s6)
    addiu       $s5, $s5, 0x1
    sll         $v0, $v0, 1
    addu        $v0, $v0, $fp
    sh          $s0, 0x0($v0)
    slti        $v0, $s5, 0x40
    bnez        $v0, .L80058064
    addiu       $s6, $s6, 0x4
    lw          $v0, 0x0($s3)
    lw          $v0, 0x68($v0)
    slti        $v0, $v0, 0x2
    bnez        $v0, .L800581B8
    nop
    addu        $s5, $zero, $zero
    addu        $s0, $fp, $zero
.L80058144:
    lw          $v1, 0x0($s3)
    lhu         $v0, 0x0($s0)
    sw          $v0, 0x18($v1)
    lhu         $v0, 0x2($s0)
    sw          $v0, 0x1C($v1)
    lhu         $v0, 0x4($s0)
    sw          $v0, 0x20($v1)
    lhu         $v0, 0x6($s0)
    sw          $v0, 0x24($v1)
    lhu         $v0, 0x8($s0)
    sw          $v0, 0x28($v1)
    lhu         $v0, 0xA($s0)
    sw          $v0, 0x2C($v1)
    lhu         $v0, 0xC($s0)
    sw          $v0, 0x30($v1)
    lhu         $v0, 0xE($s0)
    sw          $v0, 0x34($v1)
    lw          $v0, 0x0($s3)
    addiu       $a2, $zero, 0x5C
    sw          $a2, 0x14($v0)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addu        $a0, $s3, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x2
    addiu       $s5, $s5, 0x8
    slti        $v0, $s5, 0x40
    bnez        $v0, .L80058144
    addiu       $s0, $s0, 0x10
.L800581B8:
    lw          $a2, 0x14($sp)
    beqz        $a2, .L800581C8
    addiu       $s7, $s7, -0x41
    addiu       $s7, $s7, -0x40
.L800581C8:
    bgtz        $s7, .L80057F98
    nop
.L800581D0:
    addiu       $v0, $zero, 0x1
    sw          $s2, 0x0($s4)
    sw          $s1, 0x4($s4)
.L800581DC:
    lw          $ra, 0x3C($sp)
    lw          $fp, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end object_animation_pose_update
