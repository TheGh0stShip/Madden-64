.text
.align 2
.set noreorder
.globl func_800A1CDC
.ent func_800A1CDC
func_800A1CDC:
    bnel        $v1, $v0, . + 4 + (0x79 << 2)
    addiu       $s1, $s1, 0x1
    lhu         $t0, 0x36($sp)
    lh          $v1, 0x4($s0)
    sll         $v0, $t0, 16
    sra         $a0, $v0, 16
    slt         $v1, $a0, $v1
    beqz        $v1, . + 4 + (0xA << 2)
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x751C($v0)
    bne         $s6, $v0, . + 4 + (0x6 << 2)
    sll         $v0, $a0, 16
    lh          $v1, 0x2($s0)
.end func_800A1CDC
