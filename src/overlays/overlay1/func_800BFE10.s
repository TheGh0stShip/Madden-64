.text
.align 2
.set noreorder
.globl func_800BFE10
.ent func_800BFE10
func_800BFE10:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    andi        $v0, $v0, 0x4000
    bnez        $v0, .L800BFE30
    sw          $ra, 0x10($sp)
    j           func_800BB718
    addu        $v0, $zero, $zero
.L800BFE30:
    jal         func_800BB644
    nop
    andi        $v0, $v0, 0xFFFF
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BFE10
