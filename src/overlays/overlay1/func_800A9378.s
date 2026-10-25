.text
.align 2
.set noreorder
.globl func_800A9378
.ent func_800A9378
func_800A9378:
    lui         $v1, 0x8009
    lw          $v1, -0x7F70($v1)
    lui         $v0, 0x80
    sw          $v0, 0x18($s0)
    addiu       $v0, $zero, 0x578
    sh          $v0, 0x20($sp)
    lhu         $v0, 0x206($v1)
    andi        $v0, $v0, 0x100
    bnez        $v0, .L800A93A4
    addiu       $v0, $zero, 0x400
    addiu       $v0, $zero, 0xC00
.L800A93A4:
    sh          $v0, 0x24($sp)
    lui         $v0, 0x50
    sw          $v0, 0x18($sp)
    lh          $a0, 0x24($sp)
    lw          $a2, 0x18($s0)
    jal         func_800B9274
    addiu       $a1, $sp, 0x10
    lw          $a0, 0x14($s0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A9400
    nop
    lw          $v0, 0xC($s0)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x1C($v0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x20($v0)
    lw          $v0, 0x14($sp)
    lw          $a0, 0x18($s0)
    j           func_800A4D04
    addu        $v1, $v1, $v0
.L800A9400:
    lw          $v0, 0xC($s0)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x1C($v0)
    subu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    lw          $v0, 0xC($s0)
    lw          $v1, 0x20($v0)
    lw          $v0, 0x14($sp)
    lw          $a0, 0x18($s0)
    subu        $v1, $v1, $v0
    bltzl       $a0, .L800A9430
    addiu       $a0, $a0, 0x7
.L800A9430:
    sra         $v0, $a0, 3
    addu        $v0, $v1, $v0
    sw          $v0, 0x14($sp)
    addu        $a0, $s0, $zero
    jal         func_800A2E58
    addiu       $a1, $sp, 0x10
    addu        $a0, $s0, $zero
    jal         func_800A2EB4
    addiu       $a1, $sp, 0x20
    lw          $ra, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A9378
