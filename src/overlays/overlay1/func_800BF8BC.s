.text
.align 2
.set noreorder
.globl func_800BF8BC
.ent func_800BF8BC
func_800BF8BC:
    sw          $s1, 0x1C($sp)
    lhu         $v1, 0x28($s0)
    addu        $v0, $zero, $zero
    andi        $v1, $v1, 0xFFFE
    j           func_800BB41C
    sh          $v1, 0x28($s0)
.end func_800BF8BC
