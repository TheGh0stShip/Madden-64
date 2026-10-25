.text
.align 2
.set noreorder
.globl func_800B350C
.ent func_800B350C
func_800B350C:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    jal         func_800209AC
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x7F48($v1)
    lhu         $a0, 0x0($v0)
    lui         $a1, 0x8008
    lh          $a1, 0x777E($a1)
    lui         $a2, 0x8008
    lh          $a2, 0x7770($a2)
    lui         $a3, 0x8009
    lh          $a3, -0x7F3A($a3)
    jal         func_800ADDD0
    sw          $v1, 0x10($sp)
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800B350C
