.text
.align 2
.set noreorder
.globl func_800AD6AC
.ent func_800AD6AC
func_800AD6AC:
    lui         $v1, 0x8008
    lhu         $v1, -0x5EE2($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L800AD6F0
    sw          $ra, 0x10($sp)
    lui         $v1, 0x8008
    lhu         $v1, -0x5EE4($v1)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800AD6E8
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x4858($at)
    j           func_800A8FCC
    nop
.L800AD6E8:
    jal         func_800A8E88
    nop
.L800AD6F0:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AD6AC
