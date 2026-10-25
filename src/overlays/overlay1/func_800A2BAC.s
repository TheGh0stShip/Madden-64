.text
.align 2
.set noreorder
.globl func_800A2BAC
.ent func_800A2BAC
func_800A2BAC:
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x5
    bne         $v1, $v0, .L800A2C2C
    addiu       $v0, $zero, -0x2
    lui         $v1, 0x8009
    lh          $v1, -0x7F50($v1)
    beq         $v1, $v0, .L800A2BF4
    addiu       $a0, $sp, 0x40
    jal         func_80029AD0
    nop
    addiu       $a0, $sp, 0x40
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x2F8C
    sw          $v0, 0x40($sp)
    jal         func_800AE924
    sh          $zero, 0x50($sp)
    addiu       $a0, $sp, 0x40
.L800A2BF4:
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x2F48
    sw          $v0, 0x40($sp)
    addiu       $v0, $zero, 0xF
    jal         func_800AE924
    sh          $v0, 0x50($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    addiu       $v1, $zero, 0x6
    lui         $at, 0x8008
    sh          $v1, 0x76DC($at)
    andi        $v0, $v0, 0xFFEF
    lui         $at, 0x8009
    sh          $v0, -0x7F3C($at)
.L800A2C2C:
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x7F3C
    lhu         $a0, 0x0($a1)
    andi        $v0, $a0, 0x10
    beqz        $v0, . + 4 + (0x1E << 2)
    addiu       $v1, $zero, -0x1
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
    lui         $at, 0x8009
    sh          $v1, -0x6CE0($at)
    ori         $v1, $a0, 0x4
    addiu       $s0, $zero, -0x2
    bne         $v0, $s0, .L800A2C6C
    sh          $v1, 0x0($a1)
    lui         $at, 0x8009
    sb          $zero, -0x750A($at)
.L800A2C6C:
    jal         func_80090B14
    nop
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
    bne         $v0, $s0, . + 4 + (0xC << 2)
    addiu       $v0, $zero, 0xB7
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lui         $at, 0x8007
.end func_800A2BAC
