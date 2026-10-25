.text
.align 2
.set noreorder
.globl func_800A1D28
.ent func_800A1D28
func_800A1D28:
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    j           func_8009D640
    sll         $v0, $v0, 16
.end func_800A1D28
