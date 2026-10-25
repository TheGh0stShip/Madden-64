.text
.align 2
.set noreorder
.globl func_800BC19C
.ent func_800BC19C
func_800BC19C:
    addiu       $sp, $sp, -0x18
    addu        $a0, $zero, $zero
    sw          $ra, 0x10($sp)
    jal         func_80032E00
    addiu       $a1, $zero, 0x600
    lui         $at, 0x8008
    sw          $v0, -0x5D98($at)
    jal         func_800B7A58
    nop
    jal         func_800B7A48
    nop
    lui         $at, 0x8008
    sh          $zero, -0x5D94($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BC19C
