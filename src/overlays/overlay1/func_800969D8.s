.text
.align 2
.set noreorder
.globl func_800969D8
.ent func_800969D8
func_800969D8:
    sw          $zero, 0x0($v1)
    lui         $a1, 0x8008
    lhu         $a1, 0x57B2($a1)
    addu        $a0, $s1, $zero
    and         $a1, $a1, $s0
    jal         func_800BFF9C
    nop
    jal         func_800BE784
    nop
    j           func_8009263C
.end func_800969D8
