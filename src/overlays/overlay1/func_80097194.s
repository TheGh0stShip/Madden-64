.text
.align 2
.set noreorder
.globl func_80097194
.ent func_80097194
func_80097194:
    addu        $s1, $a2, $zero
    addu        $s0, $zero, $zero
    lui         $s2, 0x8006
    addiu       $s2, $s2, 0x4A9C
    lw          $v0, 0x0($s2)
    and         $v0, $s4, $v0
    beql        $v0, $zero, . + 4 + (0x29 << 2)
    addiu       $s0, $s0, 0x2
    jal         func_800BEE28
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $s6, $v0, . + 4 + (0xE << 2)
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB4($at)
    lw          $v0, 0x24($v0)
.end func_80097194
