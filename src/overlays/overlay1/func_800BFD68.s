.text
.align 2
.set noreorder
.globl func_800BFD68
.ent func_800BFD68
func_800BFD68:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0x8
    bnez        $v0, .L800BFD90
    nop
    jal         func_800BB438
    nop
    j           func_800BB674
    nop
.L800BFD90:
    jal         func_800BB170
    nop
    lw          $ra, 0x10($sp)
    andi        $v0, $v0, 0xFFFF
    jr          $ra
    addiu       $sp, $sp, 0x18
.end func_800BFD68
