.text
.align 2
.set noreorder
.globl func_8009B8B8
.ent func_8009B8B8
func_8009B8B8:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_80035D7C
    andi        $a0, $a0, 0xFFFF
    addu        $a1, $zero, $zero
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x7BA0
    addu        $v1, $v0, $zero
.L8009B8D8:
    sw          $v1, 0x0($a0)
    addiu       $a0, $a0, 0x4
    addiu       $a1, $a1, 0x1
    sltiu       $v0, $a1, 0x8
    bnez        $v0, .L8009B8D8
    addiu       $v1, $v1, 0x200
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009B8B8
