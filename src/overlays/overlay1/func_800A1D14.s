.text
.align 2
.set noreorder
.globl func_800A1D14
.ent func_800A1D14
func_800A1D14:
    sw          $v0, 0x4($s2)
    sll         $v1, $v1, 16
    j           func_8009D768
    sw          $v1, 0x0($s2)
.end func_800A1D14
