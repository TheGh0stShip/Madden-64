.text
.align 2
.set noreorder
.globl func_800B2F14
.ent func_800B2F14
func_800B2F14:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    addiu       $a0, $zero, 0x70
    addu        $a1, $zero, $zero
    sw          $ra, 0x14($sp)
    jal         func_800AACE8
    addiu       $a2, $zero, 0x5
    addu        $a0, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x751C($v1)
    andi        $s0, $s0, 0xFFFF
    sll         $v0, $s0, 1
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sh          $a0, -0x6CB8($at)
    bne         $s0, $v1, .L800B2F74
    sll         $v0, $a0, 16
    sra         $v0, $v0, 13
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x6DEC($at)
    j           func_800AE864
    addiu       $v0, $zero, 0x1E
.L800B2F74:
    sra         $v0, $v0, 13
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, 0x6DEC($at)
    addiu       $v0, $zero, -0x1E
    sw          $v0, 0x20($v1)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B2F14
