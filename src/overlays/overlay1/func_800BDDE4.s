.text
.align 2
.set noreorder
.globl func_800BDDE4
.ent func_800BDDE4
func_800BDDE4:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lw          $v0, 0x48($a0)
    lwl         $v1, 0x0($a1)
    lwr         $v1, 0x3($a1)
    lwl         $a2, 0x4($a1)
    lwr         $a2, 0x7($a1)
    lh          $a3, 0x8($a1)
    swl         $v1, 0x0($v0)
    swr         $v1, 0x3($v0)
    swl         $a2, 0x4($v0)
    swr         $a2, 0x7($v0)
    sh          $a3, 0x8($v0)
    jal         func_800B9758
    addiu       $a1, $zero, 0x1
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BDDE4
