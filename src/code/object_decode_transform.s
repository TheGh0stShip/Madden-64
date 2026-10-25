.text
.align 2
.set noreorder
.globl object_decode_transform
.ent object_decode_transform
object_decode_transform:
    addu        $s0, $a0, $zero
    sw          $s1, 0x1C($sp)
    addu        $s1, $zero, $zero
    sw          $s3, 0x24($sp)
    addu        $s3, $zero, $zero
    sw          $s5, 0x2C($sp)
    sw          $ra, 0x3C($sp)
    sw          $fp, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s4, 0x28($sp)
    sw          $s2, 0x20($sp)
    lw          $v0, 0x20($s0)
    lw          $a0, 0x1BC($s0)
    lw          $v1, 0xD8($s0)
    blez        $v0, .L8005D300
    addu        $s5, $zero, $zero
    addiu       $s7, $zero, 0x2
    addiu       $s6, $zero, 0x1
    lui         $fp, 0x8000
    addiu       $fp, $fp, 0x33B0
    addiu       $s2, $v1, 0x50
    addu        $s4, $a0, $zero
.L8005D07C:
    lw          $v1, -0x2C($s2)
    beq         $v1, $s7, .L8005D0C8
    slti        $v0, $v1, 0x3
    beql        $v0, $zero, .L8005D0A0
    addiu       $v0, $zero, 0x4
    beq         $v1, $s6, .L8005D0B8
    nop
    j .L8005D148
    nop
.L8005D0A0:
    beq         $v1, $v0, .L8005D0D8
    addiu       $v0, $zero, 0x8
    beq         $v1, $v0, .L8005D0E8
    nop
    j .L8005D148
    nop
.L8005D0B8:
    lui         $s3, 0x8006
    addiu       $s3, $s3, -0x11B8
    j .L8005D170
    addu        $s1, $zero, $zero
.L8005D0C8:
    lui         $s3, 0x8006
    addiu       $s3, $s3, -0x14C8
    j .L8005D170
    addu        $s1, $zero, $zero
.L8005D0D8:
    lui         $s3, 0x8006
    addiu       $s3, $s3, -0x1A18
    j .L8005D170
    addu        $s1, $zero, $zero
.L8005D0E8:
    lw          $v0, 0x48($s0)
    beq         $v0, $s6, .L8005D11C
    nop
    beqz        $v0, .L8005D10C
    nop
    beq         $v0, $s7, .L8005D12C
    addiu       $t4, $zero, 0x2F
    j .L8005D13C
    nop
.L8005D10C:
    lui         $s3, 0x8006
    addiu       $s3, $s3, -0x21A8
    j .L8005D170
    addu        $s1, $zero, $zero
.L8005D11C:
    lui         $s3, 0x8006
    addiu       $s3, $s3, -0x2C00
    j .L8005D170
    addiu       $s1, $zero, 0x1
.L8005D12C:
    lui         $s3, 0x8006
    addiu       $s3, $s3, -0x26B0
    j .L8005D170
    addiu       $s1, $zero, 0x2
.L8005D13C:
    lw          $v0, 0x0($s0)
    j .L8005D160
    sw          $t4, 0x14($v0)
.L8005D148:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x6
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, -0x2C($s2)
    sw          $v0, 0x18($v1)
.L8005D160:
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L8005D170:
    sw          $s3, 0x4($s4)
    lw          $v0, -0x20($s2)
    beql        $v0, $zero, .L8005D2EC
    addiu       $s4, $s4, 0x4
    lw          $v0, 0x2C($s4)
    beql        $v0, $s1, .L8005D2EC
    addiu       $s4, $s4, 0x4
    lw          $t2, -0x4($s2)
    beql        $t2, $zero, .L8005D2EC
    addiu       $s4, $s4, 0x4
    beq         $s1, $s6, .L8005D1F8
    sw          $s1, 0x2C($s4)
    slti        $v0, $s1, 0x2
    beqz        $v0, .L8005D1BC
    nop
    beqz        $s1, .L8005D1CC
    addu        $a1, $zero, $zero
    j .L8005D2CC
    nop
.L8005D1BC:
    beq         $s1, $s7, .L8005D248
    addu        $a1, $zero, $zero
    j .L8005D2CC
    nop
.L8005D1CC:
    lw          $a0, 0x0($s2)
    addu        $v1, $t2, $zero
.L8005D1D4:
    lhu         $v0, 0x0($v1)
    addiu       $v1, $v1, 0x2
    addiu       $a1, $a1, 0x1
    sw          $v0, 0x0($a0)
    slti        $v0, $a1, 0x40
    bnez        $v0, .L8005D1D4
    addiu       $a0, $a0, 0x4
    j .L8005D2EC
    addiu       $s4, $s4, 0x4
.L8005D1F8:
    addu        $a1, $zero, $zero
    lw          $a3, 0x0($s2)
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0x3330
    addu        $a0, $t2, $zero
.L8005D20C:
    lhu         $v0, 0x0($a0)
    lh          $v1, 0x0($a2)
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    addiu       $a2, $a2, 0x2
    addiu       $a0, $a0, 0x2
    addiu       $a1, $a1, 0x1
    addiu       $v0, $v0, 0x800
    sra         $v0, $v0, 12
    sw          $v0, 0x0($a3)
    slti        $v0, $a1, 0x40
    bnez        $v0, .L8005D20C
    addiu       $a3, $a3, 0x4
    j .L8005D2EC
    addiu       $s4, $s4, 0x4
.L8005D248:
    lw          $t3, 0x0($s2)
    addu        $t1, $zero, $zero
    addu        $t0, $fp, $zero
.L8005D254:
    addu        $a3, $zero, $zero
    lwc1        $f5, 0x0($t0)
    lwc1        $f4, 0x4($t0)
    addu        $a2, $fp, $zero
    sll         $v0, $a1, 2
    addu        $a0, $v0, $t3
    sll         $v0, $a1, 1
    addu        $v1, $v0, $t2
.L8005D274:
    lhu         $v0, 0x0($v1)
    .word       0x44821000  # mtc1        $v0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x46241082  # mul.d       $f2, $f2, $f4
    lwc1        $f1, 0x0($a2)
    lwc1        $f0, 0x4($a2)
    .word       0x46201082  # mul.d       $f2, $f2, $f0
    addiu       $v1, $v1, 0x2
    addiu       $a1, $a1, 0x1
    addiu       $a2, $a2, 0x8
    addiu       $a3, $a3, 0x1
    slti        $v0, $a3, 0x8
    .word       0x462010A0  # cvt.s.d     $f2, $f2
    swc1        $f2, 0x0($a0)
    bnez        $v0, .L8005D274
    addiu       $a0, $a0, 0x4
    addiu       $t1, $t1, 0x1
    slti        $v0, $t1, 0x8
    bnez        $v0, .L8005D254
    addiu       $t0, $t0, 0x8
    j .L8005D2EC
    addiu       $s4, $s4, 0x4
.L8005D2CC:
    lw          $v0, 0x0($s0)
    addiu       $t4, $zero, 0x2F
    sw          $t4, 0x14($v0)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    addiu       $s4, $s4, 0x4
.L8005D2EC:
    lw          $v0, 0x20($s0)
    addiu       $s5, $s5, 0x1
    slt         $v0, $s5, $v0
    bnez        $v0, .L8005D07C
    addiu       $s2, $s2, 0x54
.L8005D300:
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
.end object_decode_transform
