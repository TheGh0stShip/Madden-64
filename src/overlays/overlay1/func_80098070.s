.text
.align 2
.set noreorder
.globl func_80098070
.ent func_80098070
func_80098070:
    sw          $v0, 0xB4($v1)
    lw          $v1, 0x14($v0)
    ori         $v1, $v1, 0x1
    sw          $v1, 0x14($v0)
    lui         $a0, 0x8008
    lh          $a0, 0x4EE0($a0)
.end func_80098070
