.text
.align 2
.set noreorder
.globl func_800BDE30
.ent func_800BDE30
func_800BDE30:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lw          $v0, 0x48($a0)
    lwl         $v1, 0x0($a1)
    lwr         $v1, 0x3($a1)
    lwl         $a2, 0x4($a1)
    lwr         $a2, 0x7($a1)
    lh          $a3, 0x8($a1)
    swl         $v1, 0xA($v0)
    swr         $v1, 0xD($v0)
    swl         $a2, 0xE($v0)
    swr         $a2, 0x11($v0)
    sh          $a3, 0x12($v0)
    jal         func_800B9758
    addiu       $a1, $zero, 0x2
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BDE30
