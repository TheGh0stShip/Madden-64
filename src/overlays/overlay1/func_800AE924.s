.text
.align 2
.set noreorder
.globl func_800AE924
.ent func_800AE924
func_800AE924:
    lui         $at, 0x8009
    sh          $zero, -0x6AF0($at)
    lui         $at, 0x8008
    sh          $zero, 0x7914($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AE924
