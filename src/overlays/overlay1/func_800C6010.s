.text
.align 2
.set noreorder
.globl func_800C6010
.ent func_800C6010
func_800C6010:
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
.end func_800C6010
