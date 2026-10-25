.text
.align 2
.set noreorder
.globl func_800AEA48
.ent func_800AEA48
func_800AEA48:
    sw          $zero, -0x462C($at)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AEA48
