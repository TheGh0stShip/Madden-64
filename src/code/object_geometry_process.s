.text
.align 2
.set noreorder
.globl object_geometry_process
.ent object_geometry_process
object_geometry_process:
    addiu       $sp, $sp, -0x68
    sw          $s0, 0x48($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x60($sp)
    sw          $s5, 0x5C($sp)
    sw          $s4, 0x58($sp)
    sw          $s3, 0x54($sp)
    sw          $s2, 0x50($sp)
    sw          $s1, 0x4C($sp)
    lw          $v0, 0x144($s0)
    lw          $s3, 0x1A8($s0)
    blez        $v0, .L8005BA88
    addu        $s1, $zero, $zero
    addiu       $s5, $zero, 0x1
    addiu       $s4, $sp, 0x18
    addu        $s2, $s0, $zero
.L8005BA30:
    lw          $a3, 0x148($s2)
    lw          $v1, 0x94($s0)
    lw          $a2, 0xC($a3)
    lw          $a0, 0x4($s0)
    lw          $v0, 0x4($a3)
    .word       0x00660018  # mult        $v1, $a2
    .word       0x00003012  # mflo        $a2
    sw          $s5, 0x10($sp)
    lw          $a3, 0xC($a3)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    lw          $a1, 0x48($v0)
    lw          $v0, 0x20($a0)
    addiu       $s2, $s2, 0x4
    jalr        $v0
    addu        $a0, $s0, $zero
    sw          $v0, 0x0($s4)
    lw          $v0, 0x144($s0)
    addiu       $s1, $s1, 0x1
    slt         $v0, $s1, $v0
    bnez        $v0, .L8005BA30
    addiu       $s4, $s4, 0x4
.L8005BA88:
    lw          $s4, 0x18($s3)
    lw          $v0, 0x1C($s3)
    slt         $v0, $s4, $v0
    beqz        $v0, .L8005BBAC
    nop
    addiu       $s5, $sp, 0x18
.L8005BAA0:
    lw          $s2, 0x14($s3)
    lw          $v0, 0x158($s0)
    sltu        $v0, $s2, $v0
    beqz        $v0, .L8005BB98
    nop
.L8005BAB4:
    lw          $v0, 0x144($s0)
    addu        $t0, $zero, $zero
    blez        $v0, .L8005BB68
    addu        $s1, $zero, $zero
    addu        $t2, $s5, $zero
    addu        $t1, $s0, $zero
.L8005BACC:
    lw          $a3, 0x148($t1)
    lw          $v0, 0x34($a3)
    lw          $v1, 0x38($a3)
    .word       0x02420018  # mult        $s2, $v0
    .word       0x00001012  # mflo        $v0
    blez        $v1, .L8005BB50
    addu        $a2, $zero, $zero
    addu        $t4, $t2, $zero
    sll         $t3, $v0, 7
.L8005BAF0:
    lw          $v1, 0x0($t4)
    addu        $v0, $a2, $s4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $v0, 0x0($v0)
    lw          $v1, 0x34($a3)
    addu        $a0, $zero, $zero
    blez        $v1, .L8005BB3C
    addu        $a1, $v0, $t3
    sll         $v0, $t0, 2
    addu        $v1, $v0, $s3
.L8005BB1C:
    sw          $a1, 0x20($v1)
    addiu       $a1, $a1, 0x80
    addiu       $v1, $v1, 0x4
    lw          $v0, 0x34($a3)
    addiu       $a0, $a0, 0x1
    slt         $v0, $a0, $v0
    bnez        $v0, .L8005BB1C
    addiu       $t0, $t0, 0x1
.L8005BB3C:
    lw          $v0, 0x38($a3)
    addiu       $a2, $a2, 0x1
    slt         $v0, $a2, $v0
    bnez        $v0, .L8005BAF0
    nop
.L8005BB50:
    addiu       $t2, $t2, 0x4
    lw          $v0, 0x144($s0)
    addiu       $s1, $s1, 0x1
    slt         $v0, $s1, $v0
    bnez        $v0, .L8005BACC
    addiu       $t1, $t1, 0x4
.L8005BB68:
    lw          $v0, 0x1B8($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $s3, 0x20
    beqz        $v0, .L8005BBE0
    addu        $v0, $zero, $zero
    lw          $v0, 0x158($s0)
    addiu       $s2, $s2, 0x1
    sltu        $v0, $s2, $v0
    bnez        $v0, .L8005BAB4
    nop
.L8005BB98:
    lw          $v0, 0x1C($s3)
    addiu       $s4, $s4, 0x1
    slt         $v0, $s4, $v0
    bnez        $v0, .L8005BAA0
    sw          $zero, 0x14($s3)
.L8005BBAC:
    lw          $v0, 0x94($s0)
    lw          $v1, 0x13C($s0)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x94($s0)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8005BBEC
    nop
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0xC($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    j .L8005BBF8
    addiu       $v0, $zero, 0x4
.L8005BBE0:
    sw          $s4, 0x18($s3)
    j .L8005BBF8
    sw          $s2, 0x14($s3)
.L8005BBEC:
    jal         func_8005B618
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0x3
.L8005BBF8:
    lw          $ra, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end object_geometry_process
