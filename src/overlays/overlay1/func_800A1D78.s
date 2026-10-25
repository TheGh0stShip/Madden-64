.text
.align 2
.set noreorder
.globl func_800A1D78
.ent func_800A1D78
func_800A1D78:
    addiu       $s1, $s1, 0x1
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x4($s2)
    lbu         $a1, 0x1($s0)
    lw          $a2, 0x8($s0)
    jal         func_800A1024
    addu        $a0, $s2, $zero
    lw          $s0, 0xC($s0)
    j           func_8009D79C
    sw          $s0, 0x44($sp)
.end func_800A1D78
