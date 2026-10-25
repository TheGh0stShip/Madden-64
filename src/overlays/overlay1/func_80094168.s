.text
.align 2
.set noreorder
.globl func_80094168
.ent func_80094168
func_80094168:
    sb          $v0, 0x10($sp)
    addiu       $a0, $s0, 0x370
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
    addiu       $a0, $s0, 0x420
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
    addiu       $a0, $s0, 0x4D0
    jal         func_800E1A84
    addiu       $a1, $sp, 0x10
    jal         func_8009EDB0
    nop
    jal         func_800B9794
    nop
    jal         func_800BCF98
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x6BE2($v0)
    lui         $at, 0x8009
    sh          $zero, -0x6B04($at)
    bnez        $v0, .L800941D4
    addu        $v1, $v0, $zero
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $zero, -0x7920($at)
    lui         $at, 0x8009
    sh          $v0, -0x751C($at)
.L800941D4:
    lui         $v0, 0x8009
    lh          $v0, -0x5C28($v0)
    xori        $v1, $v1, 0x1
    lui         $at, 0x8008
    sh          $v1, 0x6BE2($at)
    addiu       $v1, $zero, 0x1
    bne         $v0, $v1, .L800941FC
    nop
    jal         func_800A3294
    nop
.L800941FC:
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x5
    bne         $v1, $v0, .L80094218
    nop
    jal         func_80041BB4
    addiu       $a0, $zero, 0x19
.L80094218:
    jal         func_800293CC
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x7920($v0)
    lui         $at, 0x8009
    sb          $v0, -0x750D($at)
    jal         func_80090B14
    nop
    addiu       $a0, $zero, 0x28
    jal         func_8009C900
    addiu       $a1, $zero, 0x1
    jal         func_8009C99C
    nop
    lui         $a1, 0x8008
    lbu         $a1, 0x7964($a1)
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x4F34
    lw          $v0, 0x0($a3)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x6CF4
    lui         $a2, 0x8008
    lw          $a2, 0x6178($a2)
    negu        $v0, $v0
    sw          $v0, 0x0($a3)
    sw          $a2, 0x0($v1)
    lui         $at, 0x8008
    sw          $a2, 0x6CF8($at)
    jal         func_800A6590
.end func_80094168
