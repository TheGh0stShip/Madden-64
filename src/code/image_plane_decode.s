.text
.align 2
.set noreorder
.globl image_plane_decode
.ent image_plane_decode
image_plane_decode:
    addiu       $sp, $sp, -0x48
    sw          $s5, 0x34($sp)
    addu        $s5, $a0, $zero
    sw          $ra, 0x44($sp)
    sw          $fp, 0x40($sp)
    sw          $s7, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s3, 0x1C0($s5)
    lw          $v1, 0x134($s5)
    lw          $v0, 0x5C($s3)
    lw          $s7, 0x60($sp)
    slt         $v0, $v0, $v1
    bnez        $v0, .L8005EF60
    addu        $fp, $a2, $zero
    lw          $v0, 0x20($s5)
    lw          $s6, 0xD8($s5)
    blez        $v0, .L8005EF58
    addu        $s1, $zero, $zero
    addiu       $s4, $zero, 0xC
    addu        $s2, $a1, $zero
    addu        $s0, $s3, $zero
.L8005EF08:
    lw          $a2, 0x0($fp)
    lw          $v0, 0x64($s0)
    .word       0x00C20018  # mult        $a2, $v0
    .word       0x00003012  # mflo        $a2
    addu        $a0, $s5, $zero
    addu        $a1, $s6, $zero
    addu        $a3, $s3, $s4
    addiu       $s4, $s4, 0x4
    lw          $v1, 0x0($s2)
    addiu       $s2, $s2, 0x4
    lw          $v0, 0x34($s0)
    addiu       $s0, $s0, 0x4
    sll         $a2, $a2, 2
    jalr        $v0
    addu        $a2, $v1, $a2
    lw          $v0, 0x20($s5)
    addiu       $s1, $s1, 0x1
    slt         $v0, $s1, $v0
    bnez        $v0, .L8005EF08
    addiu       $s6, $s6, 0x54
.L8005EF58:
    sw          $zero, 0x5C($s3)
    lw          $v1, 0x134($s5)
.L8005EF60:
    lw          $v0, 0x5C($s3)
    lw          $a0, 0x60($s3)
    subu        $s0, $v1, $v0
    sltu        $v0, $a0, $s0
    bnel        $v0, $zero, .L8005EF78
    addu        $s0, $a0, $zero
.L8005EF78:
    lw          $t0, 0x5C($sp)
    lw          $a3, 0x0($t0)
    subu        $s7, $s7, $a3
    sltu        $v0, $s7, $s0
    bnel        $v0, $zero, .L8005EF90
    addu        $s0, $s7, $zero
.L8005EF90:
    lw          $v0, 0x1C4($s5)
    addu        $a0, $s5, $zero
    addiu       $a1, $s3, 0xC
    sw          $s0, 0x10($sp)
    lw          $a2, 0x5C($s3)
    lw          $t0, 0x58($sp)
    lw          $v0, 0x4($v0)
    sll         $a3, $a3, 2
    jalr        $v0
    addu        $a3, $t0, $a3
    lw          $t0, 0x5C($sp)
    lw          $v0, 0x0($t0)
    addu        $v0, $v0, $s0
    sw          $v0, 0x0($t0)
    lw          $v0, 0x60($s3)
    lw          $v1, 0x5C($s3)
    subu        $v0, $v0, $s0
    addu        $v1, $v1, $s0
    sw          $v0, 0x60($s3)
    sw          $v1, 0x5C($s3)
    lw          $v0, 0x134($s5)
    slt         $v1, $v1, $v0
    bnez        $v1, .L8005EFFC
    nop
    lw          $v0, 0x0($fp)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x0($fp)
.L8005EFFC:
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end image_plane_decode
