.text
.align 2
.set noreorder
.globl func_800BDA68
.ent func_800BDA68
func_800BDA68:
    subu        $v0, $a0, $a1
    subu        $v0, $a1, $a0
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    bgez        $v1, .L800BDA84
    addu        $v0, $v1, $zero
    addiu       $v0, $v1, 0xF
.L800BDA84:
    sra         $a0, $v0, 4
    sll         $v0, $a0, 4
    subu        $v0, $v1, $v0
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    beql        $v0, $zero, . + 4 + (0x12 << 2)
    addiu       $v0, $a0, 0x1
    j           func_800B93C4
    addu        $v0, $a0, $zero
.end func_800BDA68
