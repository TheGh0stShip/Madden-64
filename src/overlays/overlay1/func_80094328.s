.text
.align 2
.set noreorder
.globl func_80094328
.ent func_80094328
func_80094328:
    lui         $at, 0x8008
    sw          $v0, 0x6DD8($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80094328
