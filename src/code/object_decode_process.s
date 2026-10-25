.text
.align 2
.set noreorder
.globl object_decode_process
.ent object_decode_process
object_decode_process:
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
    lw          $v0, 0x4($s3)
    addu        $s0, $a1, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x74
    addu        $s5, $v0, $zero
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x4994
    sw          $s5, 0x1A8($s3)
    sw          $v0, 0x0($s5)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x4974
    sw          $v0, 0x8($s5)
    beqz        $s0, .L8005CA44
    sw          $zero, 0x70($s5)
    lw          $v0, 0x20($s3)
    lw          $a1, 0xD8($s3)
    blez        $v0, .L8005CA20
    addu        $s4, $zero, $zero
    addiu       $s2, $a1, 0xC
    addu        $s6, $s5, $zero
.L8005C9B0:
    lw          $v0, 0xDC($s3)
    lw          $s1, 0x0($s2)
    beqz        $v0, .L8005C9C4
    sll         $v0, $s1, 1
    addu        $s1, $s1, $v0
.L8005C9C4:
    lw          $a0, 0x10($s2)
    lw          $a1, -0x4($s2)
    jal         func_80063214
    addiu       $s4, $s4, 0x1
    lw          $a0, 0x14($s2)
    lw          $a1, 0x0($s2)
    jal         func_80063214
    addu        $s0, $v0, $zero
    lw          $v1, 0x4($s3)
    addu        $a0, $s3, $zero
    addiu       $a1, $zero, 0x1
    sw          $v0, 0x10($sp)
    sw          $s1, 0x14($sp)
    lw          $v0, 0x14($v1)
    addiu       $a2, $zero, 0x1
    jalr        $v0
    addu        $a3, $s0, $zero
    sw          $v0, 0x48($s6)
    lw          $v0, 0x20($s3)
    addiu       $s2, $s2, 0x54
    slt         $v0, $s4, $v0
    bnez        $v0, .L8005C9B0
    addiu       $s6, $s6, 0x4
.L8005CA20:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x4610
    sw          $v0, 0x4($s5)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x43E0
    sw          $v0, 0xC($s5)
    addiu       $v0, $s5, 0x48
    j .L8005CA98
    sw          $v0, 0x10($s5)
.L8005CA44:
    lw          $v0, 0x4($s3)
    addu        $a0, $s3, $zero
    lw          $v0, 0x4($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x500
    addiu       $a0, $zero, 0x9
    addiu       $v0, $v0, 0x480
    addiu       $v1, $s5, 0x24
.L8005CA68:
    sw          $v0, 0x20($v1)
    addiu       $v0, $v0, -0x80
    addiu       $a0, $a0, -0x1
    bgez        $a0, .L8005CA68
    addiu       $v1, $v1, -0x4
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x4618
    sw          $v0, 0x4($s5)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x48FC
    sw          $v0, 0xC($s5)
    sw          $zero, 0x10($s5)
.L8005CA98:
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
.end object_decode_process
