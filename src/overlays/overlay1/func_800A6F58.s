.text
.align 2
.set noreorder
.globl func_800A6F58
.ent func_800A6F58
func_800A6F58:
    lui         $v1, 0x8008
    lw          $v1, 0x54A4($v1)
    addiu       $sp, $sp, -0x18
    beqz        $v1, .L800A6FB0
    sw          $ra, 0x10($sp)
    lui         $at, 0x8008
    sw          $zero, 0x54A4($at)
    jal         func_8009BB00
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    bnez        $v0, .L800A6F98
    addiu       $v0, $zero, 0xF
    lui         $at, 0x8009
    sh          $v0, -0x498C($at)
.L800A6F98:
    jal         func_800A365C
    addu        $a0, $zero, $zero
    jal         func_8009E0CC
    nop
    jal         func_800A2BAC
    addu        $a0, $zero, $zero
.L800A6FB0:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A6F58
