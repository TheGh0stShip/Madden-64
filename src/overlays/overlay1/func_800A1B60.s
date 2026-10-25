.text
.align 2
.set noreorder
.globl func_800A1B60
.ent func_800A1B60
func_800A1B60:
    lw          $v0, 0xC($s0)
    lbu         $v0, 0x1E($v0)
    bne         $s6, $v0, . + 4 + (0xD5 << 2)
    addu        $s4, $zero, $zero
    lh          $v0, 0x2($s0)
    negu        $v0, $v0
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    addu        $s1, $s3, $zero
    negu        $v0, $v0
    sll         $v0, $v0, 16
    sw          $v0, 0x4($s2)
    j           func_8009D79C
    addu        $s4, $zero, $zero
.end func_800A1B60
