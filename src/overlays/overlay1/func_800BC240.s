.text
.align 2
.set noreorder
.globl func_800BC240
.ent func_800BC240
func_800BC240:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    lui         $s1, 0x8008
    lw          $s1, -0x5D98($s1)
    lui         $v0, 0x8008
    lhu         $v0, -0x5D94($v0)
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s0, 0x10($sp)
    sw          $ra, 0x1C($sp)
    lui         $at, 0x8008
    sh          $zero, -0x5D88($at)
    beqz        $v0, .L800BC2A0
    addu        $s0, $zero, $zero
.L800BC278:
    addu        $a0, $s1, $zero
    jal         func_800B7B04
    addu        $a1, $s2, $zero
    lui         $v1, 0x8008
    lhu         $v1, -0x5D94($v1)
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800BC278
    addiu       $s1, $s1, 0xC
.L800BC2A0:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BC240
