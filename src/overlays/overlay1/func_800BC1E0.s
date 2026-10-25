.text
.align 2
.set noreorder
.globl func_800BC1E0
.ent func_800BC1E0
func_800BC1E0:
    lui         $a1, 0x8008
    lw          $a1, -0x5D98($a1)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $zero, -0x5D98($at)
    jal         func_800B7A50
    nop
    lui         $at, 0x8008
    sb          $zero, -0x5D8C($at)
    lui         $at, 0x8008
    sw          $zero, -0x5D90($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BC1E0
