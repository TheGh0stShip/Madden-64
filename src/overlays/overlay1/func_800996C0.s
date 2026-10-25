.text
.align 2
.set noreorder
.globl func_800996C0
.ent func_800996C0
func_800996C0:
    jal         func_80011228
    addiu       $a0, $zero, -0x1
    lui         $at, 0x8008
    sb          $zero, 0x7A94($at)
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
    nop
.end func_800996C0
