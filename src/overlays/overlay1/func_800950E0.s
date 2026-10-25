.text
.align 2
.set noreorder
.globl func_800950E0
.ent func_800950E0
func_800950E0:
    jal         func_800BFF60
    addiu       $s1, $s1, 0x1
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    andi        $v0, $s1, 0xFFFF
    srl         $v1, $v1, 1
    sltu        $v0, $v0, $v1
    bnez        $v0, . + 4 + (-0xE << 2)
    andi        $s0, $s1, 0xFFFF
.end func_800950E0
