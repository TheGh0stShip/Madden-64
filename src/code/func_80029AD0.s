.text
.align 2
.set noreorder
.globl func_80029AD0
.ent func_80029AD0
func_80029AD0:
    lui         $a0, 0x8009
    lbu         $a0, -0x750C($a0)
    lui         $v0, 0x8009
    lbu         $v0, -0x750A($v0)
    lui         $v1, 0x8009
    lbu         $v1, -0x7509($v1)
    lui         $a1, 0x8009
    lbu         $a1, -0x750D($a1)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lui         $at, 0x8009
    sb          $v0, -0x4FA0($at)
    lui         $at, 0x8009
    sb          $v1, -0x4F9F($at)
    bnel        $a1, $zero, .L80029B10
    ori         $a0, $a0, 0x80
.L80029B10:
    lui         $at, 0x8009
    sb          $a0, -0x4F9E($at)
    lui         $a0, 0x8009
    lbu         $a0, -0x750B($a0)
    bnel        $a1, $zero, .L80029B28
    ori         $a0, $a0, 0x80
.L80029B28:
    lui         $v0, 0x8008
    lhu         $v0, 0x76DC($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x7AAC($v1)
    lui         $a2, 0x8009
    lhu         $a2, -0x7510($a2)
    lui         $a3, 0x8009
    lhu         $a3, -0x7512($a3)
    lui         $at, 0x8009
    sb          $a0, -0x4F9D($at)
    lui         $a0, 0x8009
    lh          $a0, -0x7516($a0)
    lui         $a1, 0x8009
    lh          $a1, -0x7514($a1)
    sll         $v0, $v0, 13
    or          $v1, $v1, $v0
    subu        $a2, $a2, $a3
    lui         $at, 0x8009
    sh          $v1, -0x4F9C($at)
    lui         $at, 0x8009
    sh          $a2, -0x4F9A($at)
    jal         func_800278D8
    nop
    lui         $at, 0x8009
    sb          $v0, -0x4F98($at)
    jal         func_80029944
    nop
    lui         $v1, 0x8008
    lhu         $v1, 0x2D94($v1)
    lui         $a0, 0x8008
    lhu         $a0, 0x4EE0($a0)
    lui         $at, 0x8009
    sb          $v0, -0x4F97($at)
    lui         $at, 0x8009
    sb          $v1, -0x4F96($at)
    lui         $at, 0x8009
    sb          $a0, -0x4F95($at)
    jal         func_800299B8
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80029AD0
