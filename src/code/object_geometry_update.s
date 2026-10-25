.text
.align 2
.set noreorder
.globl object_geometry_update
.ent object_geometry_update
object_geometry_update:
    addiu       $sp, $sp, -0x88
    sw          $s3, 0x6C($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x84($sp)
    sw          $fp, 0x80($sp)
    sw          $s7, 0x7C($sp)
    sw          $s6, 0x78($sp)
    sw          $s5, 0x74($sp)
    sw          $s4, 0x70($sp)
    sw          $s2, 0x68($sp)
    sw          $s1, 0x64($sp)
    sw          $s0, 0x60($sp)
    lw          $v0, 0x13C($s3)
    lw          $a0, 0x90($s3)
    lw          $v1, 0x98($s3)
    lw          $s0, 0x1A8($s3)
    addu        $s1, $a1, $zero
    addiu       $v0, $v0, -0x1
    j .L8005BCA4
    sw          $v0, 0x1C($sp)
.L8005BC70:
    lw          $v1, 0x94($s3)
    lw          $v0, 0x9C($s3)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8005BCB8
    nop
.L8005BC84:
    lw          $v0, 0x1B0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s3, $zero
    beqz        $v0, .L8005BE58
    addu        $v0, $zero, $zero
    lw          $a0, 0x90($s3)
    lw          $v1, 0x98($s3)
.L8005BCA4:
    slt         $v0, $a0, $v1
    bnez        $v0, .L8005BC84
    nop
    beq         $a0, $v1, .L8005BC70
    nop
.L8005BCB8:
    lw          $v0, 0x20($s3)
    lw          $t1, 0xD8($s3)
    blez        $v0, .L8005BE38
    sw          $zero, 0x24($sp)
    addiu       $s4, $t1, 0x24
    sw          $s1, 0x44($sp)
    sw          $zero, 0x4C($sp)
    sw          $s0, 0x54($sp)
.L8005BCD8:
    lw          $v0, 0xC($s4)
    beqz        $v0, .L8005BDF4
    addu        $a0, $s3, $zero
    lw          $v0, 0x9C($s3)
    lw          $a2, -0x18($s4)
    lw          $t2, 0x54($sp)
    .word       0x00460018  # mult        $v0, $a2
    .word       0x00003012  # mflo        $a2
    lw          $v0, 0x4($s3)
    sw          $zero, 0x10($sp)
    lw          $a1, 0x48($t2)
    lw          $a3, -0x18($s4)
    lw          $v0, 0x20($v0)
    jalr        $v0
    sw          $t1, 0x5C($sp)
    lw          $v1, 0x9C($s3)
    lw          $t2, 0x1C($sp)
    lw          $t1, 0x5C($sp)
    sltu        $v1, $v1, $t2
    beqz        $v1, .L8005BD38
    addu        $a0, $v0, $zero
    lw          $fp, -0x18($s4)
    j .L8005BD5C
    nop
.L8005BD38:
    lw          $v0, -0x4($s4)
    lw          $v1, -0x18($s4)
    .word       0x0043001B  # divu        $zero, $v0, $v1
    bnez        $v1, .L8005BD50
    nop
    break       7
.L8005BD50:
    .word       0x0000F010  # mfhi        $fp
    beql        $fp, $zero, .L8005BD5C
    addu        $fp, $v1, $zero
.L8005BD5C:
    lw          $t2, 0x44($sp)
    lw          $v0, 0x1BC($s3)
    lw          $s7, 0x0($t2)
    lw          $t2, 0x4C($sp)
    addu        $v0, $t2, $v0
    lw          $t0, 0x4($v0)
    blez        $fp, .L8005BDF4
    addu        $s5, $zero, $zero
    addu        $s6, $a0, $zero
.L8005BD80:
    lw          $s2, 0x0($s6)
    lw          $v0, -0x8($s4)
    addu        $s1, $zero, $zero
    beqz        $v0, .L8005BDD8
    addu        $s0, $zero, $zero
.L8005BD94:
    addu        $a0, $s3, $zero
    addu        $a1, $t1, $zero
    addu        $a2, $s2, $zero
    addu        $a3, $s7, $zero
    sw          $s1, 0x10($sp)
    sw          $t0, 0x58($sp)
    jalr        $t0
    sw          $t1, 0x5C($sp)
    addiu       $s2, $s2, 0x80
    lw          $v1, 0x0($s4)
    lw          $v0, -0x8($s4)
    addiu       $s0, $s0, 0x1
    lw          $t0, 0x58($sp)
    lw          $t1, 0x5C($sp)
    sltu        $v0, $s0, $v0
    bnez        $v0, .L8005BD94
    addu        $s1, $s1, $v1
.L8005BDD8:
    lw          $v0, 0x0($s4)
    addiu       $s5, $s5, 0x1
    sll         $v0, $v0, 2
    addu        $s7, $s7, $v0
    slt         $v0, $s5, $fp
    bnez        $v0, .L8005BD80
    addiu       $s6, $s6, 0x4
.L8005BDF4:
    lw          $t2, 0x44($sp)
    addiu       $t2, $t2, 0x4
    sw          $t2, 0x44($sp)
    lw          $t2, 0x4C($sp)
    addiu       $t2, $t2, 0x4
    sw          $t2, 0x4C($sp)
    lw          $t2, 0x54($sp)
    addiu       $t2, $t2, 0x4
    sw          $t2, 0x54($sp)
    lw          $t2, 0x24($sp)
    addiu       $t2, $t2, 0x1
    sw          $t2, 0x24($sp)
    lw          $v0, 0x20($s3)
    addiu       $s4, $s4, 0x54
    slt         $v0, $t2, $v0
    bnez        $v0, .L8005BCD8
    addiu       $t1, $t1, 0x54
.L8005BE38:
    lw          $v1, 0x9C($s3)
    lw          $a0, 0x13C($s3)
    addiu       $v1, $v1, 0x1
    sw          $v1, 0x9C($s3)
    sltu        $v1, $v1, $a0
    bnez        $v1, .L8005BE58
    addiu       $v0, $zero, 0x3
    addiu       $v0, $zero, 0x4
.L8005BE58:
    lw          $ra, 0x84($sp)
    lw          $fp, 0x80($sp)
    lw          $s7, 0x7C($sp)
    lw          $s6, 0x78($sp)
    lw          $s5, 0x74($sp)
    lw          $s4, 0x70($sp)
    lw          $s3, 0x6C($sp)
    lw          $s2, 0x68($sp)
    lw          $s1, 0x64($sp)
    lw          $s0, 0x60($sp)
    addiu       $sp, $sp, 0x88
    jr          $ra
    nop
.end object_geometry_update
