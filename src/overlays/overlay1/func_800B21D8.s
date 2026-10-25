.text
.align 2
.set noreorder
.globl func_800B21D8
.ent func_800B21D8
func_800B21D8:
    addiu       $v0, $zero, 0x1
    lui         $s6, 0x800C
    addiu       $s6, $s6, 0x5F00
    j           func_800ADAF0
    sll         $v0, $v0, 2
.end func_800B21D8
