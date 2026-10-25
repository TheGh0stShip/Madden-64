.text
.align 2
.set noreorder
.globl func_800BF5CC
.ent func_800BF5CC
func_800BF5CC:
    sw          $s1, 0x14($sp)
    lhu         $v1, 0x28($s0)
    addu        $v0, $zero, $zero
    andi        $v1, $v1, 0xFFFE
    j           func_800BB094
    sh          $v1, 0x28($s0)
.end func_800BF5CC
