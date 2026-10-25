.text
.align 2
.set noreorder
.globl func_800AE694
.ent func_800AE694
func_800AE694:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    addiu       $a0, $zero, 0x26
    addiu       $a1, $zero, 0x69
    jal         func_8003CE88
    addiu       $a2, $zero, 0x10
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AE694
