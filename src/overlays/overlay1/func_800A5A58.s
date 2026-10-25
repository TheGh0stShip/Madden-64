.text
.align 2
.set noreorder
.globl func_800A5A58
.ent func_800A5A58
func_800A5A58:
    lh          $v0, 0x30($s0)
    blez        $v0, .L800A5A7C
    addu        $a0, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    addu        $v0, $zero, $zero
    subu        $v1, $a0, $v1
    j           func_800A13A4
    sh          $v1, 0x30($s0)
.L800A5A7C:
    addu        $a0, $s0, $zero
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x43
    addu        $v0, $zero, $zero
    addiu       $v1, $zero, 0x2
    sh          $zero, 0x30($s0)
    j           func_800A13A4
    sw          $v1, 0x94($s0)
.end func_800A5A58
