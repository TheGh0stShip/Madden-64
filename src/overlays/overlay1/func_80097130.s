.text
.align 2
.set noreorder
.globl func_80097130
.ent func_80097130
func_80097130:
    jal         func_80092664
    sra         $a0, $a0, 16
    j           func_80092B48
    addiu       $a1, $zero, 0x1
.end func_80097130
