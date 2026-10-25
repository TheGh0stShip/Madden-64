.text
.align 2
.set noreorder
.globl func_800B1BC0
.ent func_800B1BC0
func_800B1BC0:
    lui         $a0, 0x8007
    lh          $a0, -0x463E($a0)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B1C0C
    sw          $ra, 0x10($sp)
    jal         func_800AADA8
    nop
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x46B8
    jal         func_8003E23C
    nop
    jal         func_800AE700
    nop
    jal         func_800AEA9C
    addu        $a0, $zero, $zero
.L800B1C0C:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B1BC0
