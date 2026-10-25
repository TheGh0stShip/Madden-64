.text
.align 2
.set noreorder
.globl func_800BFD34
.ent func_800BFD34
func_800BFD34:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0x8
    bnel        $v0, $zero, .L800BFD58
    addu        $v0, $zero, $zero
    jal         func_800BB438
    nop
    andi        $v0, $v0, 0xFFFF
.L800BFD58:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BFD34
