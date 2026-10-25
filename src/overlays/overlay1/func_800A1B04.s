.text
.align 2
.set noreorder
.globl func_800A1B04
.ent func_800A1B04
func_800A1B04:
    lhu         $t0, 0x36($sp)
    lh          $v1, 0x4($s0)
    sll         $v0, $t0, 16
    sra         $a0, $v0, 16
    slt         $v1, $a0, $v1
    beqz        $v1, .L800A1B3C
    addu        $s4, $zero, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x751C($v0)
    bne         $s6, $v0, .L800A1B3C
    sll         $v0, $a0, 16
    lh          $v1, 0x2($s0)
    j           func_8009D794
    sw          $v0, 0x4($s2)
.L800A1B3C:
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    j           func_8009D6A4
    sll         $v0, $v0, 16
.end func_800A1B04
