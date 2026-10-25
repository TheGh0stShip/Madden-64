.text
.align 2
.set noreorder
.globl func_800B68F8
.ent func_800B68F8
func_800B68F8:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $at, 0x8008
    sh          $v0, -0x5DBC($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B68F8
