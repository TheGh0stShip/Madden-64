.text
.align 2
.set noreorder
.globl func_800A7398
.ent func_800A7398
func_800A7398:
    sw          $zero, -0x5F80($at)
    addu        $v0, $s1, $zero
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
    nop
.end func_800A7398
