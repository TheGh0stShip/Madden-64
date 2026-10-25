.text
.align 2
.set noreorder
.globl func_800A5AA8
.ent func_800A5AA8
func_800A5AA8:
    bnez        $v0, .L800A5AC8
    addu        $v0, $zero, $zero
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x3C
    j           func_800A13A4
    addiu       $v0, $zero, 0x1
    addu        $v0, $zero, $zero
.L800A5AC8:
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A5AA8
