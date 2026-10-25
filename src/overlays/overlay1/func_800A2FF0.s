.text
.align 2
.set noreorder
.globl func_800A2FF0
.ent func_800A2FF0
func_800A2FF0:
    bne         $v1, $v0, . + 4 + (0x8 << 2)
    lui         $v0, 0xFF7F
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
.end func_800A2FF0
