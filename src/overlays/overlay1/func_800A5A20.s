.text
.align 2
.set noreorder
.globl func_800A5A20
.ent func_800A5A20
func_800A5A20:
    addu        $v0, $zero, $zero
    lh          $v0, 0x30($s0)
    slti        $v0, $v0, 0x14
    beqz        $v0, .L800A5A3C
    sw          $a0, 0x94($s0)
    addiu       $v0, $zero, 0x14
    sh          $v0, 0x30($s0)
.L800A5A3C:
    lh          $v0, 0x30($s0)
    slti        $v0, $v0, 0x29
    bnez        $v0, . + 4 + (0x20 << 2)
    addu        $v0, $zero, $zero
    addiu       $v0, $zero, 0x28
    j           func_800A13A0
    sh          $v0, 0x30($s0)
.end func_800A5A20
