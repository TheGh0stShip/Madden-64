.text
.align 2
.set noreorder
.globl func_800A70E4
.ent func_800A70E4
func_800A70E4:
    addiu       $sp, $sp, -0x30
    addiu       $a1, $sp, 0x10
    sw          $ra, 0x28($sp)
    jal         func_800A289C
    addiu       $a2, $sp, 0x20
    lw          $v0, 0x14($sp)
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A70E4
