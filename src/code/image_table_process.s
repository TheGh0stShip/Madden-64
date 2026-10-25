.text
.align 2
.set noreorder
.globl image_table_process
.ent image_table_process
image_table_process:
    addiu       $sp, $sp, -0x60
    sw          $s3, 0x44($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x5C($sp)
    sw          $fp, 0x58($sp)
    sw          $s7, 0x54($sp)
    sw          $s6, 0x50($sp)
    sw          $s5, 0x4C($sp)
    sw          $s4, 0x48($sp)
    sw          $s2, 0x40($sp)
    sw          $s1, 0x3C($sp)
    sw          $s0, 0x38($sp)
    lw          $fp, 0x1C8($s3)
    jal         func_8005FF48
    addiu       $a1, $fp, 0x20
    lw          $v1, 0x78($s3)
    addu        $s7, $v0, $zero
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L800601F8
    addiu       $v0, $zero, 0x5E
    lw          $v1, 0x0($s3)
    sw          $s7, 0x18($v1)
    lw          $v0, 0x20($fp)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x24($fp)
    sw          $v0, 0x20($v1)
    lw          $v0, 0x28($fp)
    sw          $v0, 0x24($v1)
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x5D
    j .L80060208
    sw          $v0, 0x14($v1)
.L800601F8:
    lw          $v1, 0x0($s3)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    sw          $s7, 0x18($v0)
.L80060208:
    lw          $v0, 0x0($s3)
    lw          $v0, 0x4($v0)
    addu        $a0, $s3, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x1
    lw          $v0, 0x4($s3)
    addu        $a0, $s3, $zero
    lw          $a3, 0x78($s3)
    lw          $v0, 0x8($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addu        $a2, $s7, $zero
    lw          $v1, 0x78($s3)
    addu        $s5, $s7, $zero
    addu        $s4, $zero, $zero
    blez        $v1, .L80060330
    sw          $v0, 0x14($sp)
    lw          $t1, 0x14($sp)
    addu        $t0, $fp, $zero
.L80060254:
    lw          $s2, 0x20($t0)
    .word       0x02B2001A  # div         $zero, $s5, $s2
    bnez        $s2, .L80060268
    nop
    break       7
.L80060268:
    addiu       $at, $zero, -0x1
    bne         $s2, $at, .L80060280
    lui         $at, 0x8000
    bne         $s5, $at, .L80060280
    nop
    break       6
.L80060280:
    .word       0x00008812  # mflo        $s1
    blez        $s2, .L80060314
    addu        $s0, $zero, $zero
    addu        $s6, $t1, $zero
    addu        $a0, $s3, $zero
.L80060294:
    addu        $a1, $s4, $zero
    addu        $a2, $s0, $zero
    addiu       $a3, $s2, -0x1
    sw          $t0, 0x30($sp)
    jal         func_800600E0
    sw          $t1, 0x34($sp)
    .word       0x02110018  # mult        $s0, $s1
    .word       0x00002812  # mflo        $a1
    addu        $a2, $v0, $zero
    lw          $t0, 0x30($sp)
    lw          $t1, 0x34($sp)
    slt         $v0, $a1, $s7
    beql        $v0, $zero, .L80060308
    addiu       $s0, $s0, 0x1
.L800602CC:
    blez        $s1, .L800602F4
    addu        $a0, $zero, $zero
.L800602D4:
    lw          $v0, 0x0($s6)
    addu        $v1, $a1, $a0
    addiu       $a0, $a0, 0x1
    addu        $v0, $v0, $v1
    sb          $a2, 0x0($v0)
    slt         $v0, $a0, $s1
    bnez        $v0, .L800602D4
    nop
.L800602F4:
    addu        $a1, $a1, $s5
    slt         $v0, $a1, $s7
    bnez        $v0, .L800602CC
    nop
    addiu       $s0, $s0, 0x1
.L80060308:
    slt         $v0, $s0, $s2
    bnel        $v0, $zero, .L80060294
    addu        $a0, $s3, $zero
.L80060314:
    addu        $s5, $s1, $zero
    addiu       $t1, $t1, 0x4
    lw          $v0, 0x78($s3)
    addiu       $s4, $s4, 0x1
    slt         $v0, $s4, $v0
    bnez        $v0, .L80060254
    addiu       $t0, $t0, 0x4
.L80060330:
    lw          $t2, 0x14($sp)
    sw          $t2, 0x10($fp)
    sw          $s7, 0x14($fp)
    lw          $ra, 0x5C($sp)
    lw          $fp, 0x58($sp)
    lw          $s7, 0x54($sp)
    lw          $s6, 0x50($sp)
    lw          $s5, 0x4C($sp)
    lw          $s4, 0x48($sp)
    lw          $s3, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x60
    jr          $ra
    nop
.end image_table_process
