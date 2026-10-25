.text
.align 2
.set noreorder
.globl func_800B95A8
.ent func_800B95A8
func_800B95A8:
    addiu       $a0, $zero, -0x2
    lui         $v1, 0x8009
    lw          $v1, -0x791C($v1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    j           func_800B4EB4
    sw          $v0, 0x14($v1)
.end func_800B95A8
