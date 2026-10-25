.text
.align 2
.set noreorder
.globl func_800B1C70
.ent func_800B1C70
func_800B1C70:
    lui         $a0, 0x8007
    lh          $a0, -0x4644($a0)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, -0x1
    beq         $a0, $v0, .L800B1C9C
    sw          $ra, 0x10($sp)
    jal         func_800AADA8
    nop
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4644($at)
.L800B1C9C:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B1C70
