.text
.align 2
.set noreorder
.globl func_800BDC98
.ent func_800BDC98
func_800BDC98:
    dsub        $at, $zero, $zero
    addiu       $sp, $sp, -0x18
    andi        $a1, $a0, 0xFFFF
    addu        $a0, $zero, $zero
    sw          $ra, 0x10($sp)
    jal         func_80033174
    addiu       $a2, $zero, 0x18
    lui         $at, 0x8007
    sw          $v0, 0x26D0($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BDC98
