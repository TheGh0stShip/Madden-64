.text
.align 2
.set noreorder
.globl func_800ACBA0
.ent func_800ACBA0
func_800ACBA0:
    addu        $a1, $zero, $zero
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4750
    sll         $a0, $a0, 2
    addu        $a0, $a0, $v0
    addiu       $a3, $zero, 0x1F
    ori         $a2, $zero, 0xFFFF
.L800ACBBC:
    lw          $v1, 0x0($a0)
    andi        $v0, $a1, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    lhu         $v1, 0x0($v0)
    bne         $v1, $a3, .L800ACBE0
    nop
    j           func_800A84C4
    sh          $a2, 0x0($v0)
.L800ACBE0:
    beql        $v1, $a2, .L800ACBE8
    sh          $a3, 0x0($v0)
.L800ACBE8:
    addiu       $a1, $a1, 0x1
    andi        $v0, $a1, 0xFFFF
    sltiu       $v0, $v0, 0x8
    bnez        $v0, .L800ACBBC
    nop
    jr          $ra
    nop
.end func_800ACBA0
