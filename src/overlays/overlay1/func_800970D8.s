.text
.align 2
.set noreorder
.globl func_800970D8
.ent func_800970D8
func_800970D8:
    sw          $s0, 0x10($sp)
    sll         $a0, $a0, 16
    j           func_800929F4
    sra         $a0, $a0, 16
.end func_800970D8
