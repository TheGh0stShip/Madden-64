.text
.align 2
.set noreorder
.globl func_800A0D90
.ent func_800A0D90
func_800A0D90:
    lui         $at, 0x8009
    sh          $a1, -0x7920($at)
    lui         $at, 0x8009
    sh          $a0, -0x751C($at)
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x800B
    addiu       $v0, $v0, 0x1E78
    sw          $v0, 0x10($sp)
    jal         func_800AE924
    sh          $zero, 0x20($sp)
    jal         func_800C1E4C
    addiu       $a0, $zero, 0x63
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8008
    sh          $v0, 0x2D96($at)
    lui         $at, 0x8008
    sh          $v0, 0x4EE2($at)
    jal         func_80028144
    nop
    jal         func_800293CC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x7920($v0)
    lui         $at, 0x8009
    sb          $v0, -0x750D($at)
    jal         func_80090B14
    nop
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x4F34
    lw          $v0, 0x0($v1)
    negu        $v0, $v0
    j           func_8009C800
    sw          $v0, 0x0($v1)
.end func_800A0D90
