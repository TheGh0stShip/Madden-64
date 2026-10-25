.text
.align 2
.set noreorder
.globl func_800AEABC
.ent func_800AEABC
func_800AEABC:
    sw          $s1, 0x34($sp)
    beq         $v1, $v0, . + 4 + (0x13 << 2)
    sw          $s0, 0x30($sp)
    lui         $v0, 0x8008
    lh          $v0, 0x57C0($v0)
.end func_800AEABC
