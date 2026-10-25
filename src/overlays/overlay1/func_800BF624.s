.text
.align 2
.set noreorder
.globl func_800BF624
.ent func_800BF624
func_800BF624:
    addu        $s2, $v0, $zero
    jal         func_800BBB18
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x10
    beqz        $v0, . + 4 + (0x35 << 2)
    nop
.end func_800BF624
