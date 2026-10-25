.text
.align 2
.set noreorder
.globl func_800AD77C
.ent func_800AD77C
func_800AD77C:
    sll         $v0, $v0, 16
    bgez        $v0, . + 4 + (0x35 << 2)
    nop
    lui         $v0, 0x8008
.end func_800AD77C
