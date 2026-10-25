.text
.align 2
.set noreorder
.globl func_80095104
.ent func_80095104
func_80095104:
    addu        $s1, $zero, $zero
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x7F10
    andi        $v0, $s1, 0xFFFF
.L80095114:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sw          $zero, 0x0($v0)
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x8
    bnez        $v0, .L80095114
    andi        $v0, $s1, 0xFFFF
    j           func_80090AEC
    nop
.end func_80095104
