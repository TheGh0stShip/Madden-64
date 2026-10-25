.text
.align 2
.set noreorder
.globl func_800BD854
.ent func_800BD854
func_800BD854:
    lhu         $v0, 0x4A50($v0)
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    subu        $v0, $v0, $s0
    slt         $v1, $v1, $v0
    beqz        $v1, .L800BD894
    addiu       $v0, $zero, 0x1
    jal         func_80031A1C
    addiu       $a0, $zero, 0x14
    lui         $v1, 0x8006
    lhu         $v1, 0x4A50($v1)
    subu        $v1, $v1, $s0
    addu        $v0, $v0, $v1
    lui         $at, 0x8006
    sh          $v0, 0x4A4E($at)
    addiu       $v0, $zero, 0x1
.L800BD894:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BD854
