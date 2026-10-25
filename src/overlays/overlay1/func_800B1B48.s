.text
.align 2
.set noreorder
.globl func_800B1B48
.ent func_800B1B48
func_800B1B48:
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x46B8
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4642($at)
    jal         func_8003E23C
    nop
    lui         $at, 0x8008
    sh          $zero, 0x57C0($at)
    jal         func_800AE700
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B1B48
