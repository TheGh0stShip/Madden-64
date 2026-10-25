.text
.align 2
.set noreorder
.globl func_800B2C84
.ent func_800B2C84
func_800B2C84:
    lui         $a0, 0x8007
    lh          $a0, -0x463A($a0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_800AADA8
    nop
    lui         $a0, 0x8007
    lh          $a0, -0x4638($a0)
    jal         func_800AADA8
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x46B8
    jal         func_8003E23C
    nop
    jal         func_800AEA9C
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x463A($at)
    lui         $at, 0x8007
    sh          $v0, -0x4638($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B2C84
