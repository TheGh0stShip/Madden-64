.text
.align 2
.set noreorder
.globl func_800B9554
.ent func_800B9554
func_800B9554:
    lui         $v0, 0x8008
    lw          $v0, 0x7128($v0)
    lb          $v1, 0x3EA($v0)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, . + 4 + (0x7 << 2)
    addiu       $a0, $zero, -0x2
    lui         $v1, 0x8008
    lw          $v1, 0x794C($v1)
    lw          $v0, 0x14($v1)
.end func_800B9554
