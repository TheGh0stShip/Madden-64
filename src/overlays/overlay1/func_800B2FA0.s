.text
.align 2
.set noreorder
.globl func_800B2FA0
.ent func_800B2FA0
func_800B2FA0:
    addiu       $sp, $sp, -0x20
    andi        $a0, $a0, 0xFFFF
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6CB8
    sw          $s1, 0x14($sp)
    sll         $s1, $a0, 1
    sw          $s0, 0x10($sp)
    addu        $s0, $s1, $v0
    sw          $ra, 0x18($sp)
    lh          $a0, 0x0($s0)
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B2FE4
    nop
    jal         func_800AADA8
    nop
    addiu       $v0, $zero, -0x1
    sh          $v0, 0x0($s0)
.L800B2FE4:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $zero, 0x69D0($at)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B2FA0
