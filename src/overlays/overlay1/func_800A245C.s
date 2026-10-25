.text
.align 2
.set noreorder
.globl func_800A245C
.ent func_800A245C
func_800A245C:
    jal         func_80027C98
    sra         $a1, $a1, 16
    j           func_8009DD74
    nop
.end func_800A245C
