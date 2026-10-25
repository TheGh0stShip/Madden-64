.text
.align 2
.set noreorder
.globl func_800A2DFC
.ent func_800A2DFC
func_800A2DFC:
    lw          $v0, 0xC10($v0)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x7F3C
    lhu         $v1, 0x0($a0)
    ori         $v0, $v0, 0x1
    ori         $v1, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    sh          $v1, 0x0($a0)
    lui         $v1, 0x8008
.end func_800A2DFC
