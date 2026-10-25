.text
.align 2
.set noreorder
.globl func_800ABBE0
.ent func_800ABBE0
func_800ABBE0:
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x49CC($at)
    addu        $a0, $zero, $zero
    sw          $v0, 0x0($a2)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $a3
    sh          $v0, -0x5EAC($at)
    jal         func_800A84E0
    addu        $a1, $s0, $zero
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x2
    jal         func_800A9330
    nop
    jal         func_800A9F70
    nop
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800ABBE0
