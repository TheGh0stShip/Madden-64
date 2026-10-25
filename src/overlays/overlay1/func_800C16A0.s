.text
.align 2
.set noreorder
.globl func_800C16A0
.ent func_800C16A0
func_800C16A0:
    addiu       $a1, $zero, 0x107
    jal         func_80034388
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C16A0
