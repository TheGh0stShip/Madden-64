.text
.align 2
.set noreorder
.globl func_800BF6F0
.ent func_800BF6F0
func_800BF6F0:
    lui         $v1, 0x8008
    lh          $v1, 0x5024($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $v1
    bnez        $v0, . + 4 + (-0x1E << 2)
    sll         $v0, $s1, 16
    j           func_800BB094
    addu        $v0, $zero, $zero
.end func_800BF6F0
