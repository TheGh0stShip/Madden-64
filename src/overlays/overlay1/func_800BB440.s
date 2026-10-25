.text
.align 2
.set noreorder
.globl func_800BB440
.ent func_800BB440
func_800BB440:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x1934
    sw          $ra, 0x14($sp)
    lw          $a0, 0x0($s0)
    jal         func_80033258
    nop
    sw          $zero, 0x0($s0)
    lui         $at, 0x8007
    sw          $zero, 0x1938($at)
    lui         $at, 0x8007
    sb          $zero, 0x1949($at)
    lui         $at, 0x8007
    sb          $zero, 0x1948($at)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BB440
