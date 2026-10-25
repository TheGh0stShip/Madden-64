.text
.align 2
.set noreorder
.globl func_800C5F70
.ent func_800C5F70
func_800C5F70:
    sw          $s1, 0x1C($sp)
    bnez        $v0, . + 4 + (0x7D << 2)
    sw          $s0, 0x18($sp)
    lui         $v0, 0x8008
.end func_800C5F70
