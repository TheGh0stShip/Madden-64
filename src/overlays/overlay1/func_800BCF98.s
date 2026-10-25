.text
.align 2
.set noreorder
.globl func_800BCF98
.ent func_800BCF98
func_800BCF98:
    sll         $a2, $v1, 2
    addiu       $v1, $v1, 0x2
    lui         $at, 0x8008
    sw          $a1, -0x5BB4($at)
    sll         $a1, $a1, 2
.end func_800BCF98
