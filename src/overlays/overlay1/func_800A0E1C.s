.text
.align 2
.set noreorder
.globl func_800A0E1C
.ent func_800A0E1C
func_800A0E1C:
    lui         $v1, 0xEFFF
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A0E5C
    addiu       $a0, $sp, 0x28
    jal         func_800A3294
    nop
    addiu       $a0, $sp, 0x28
.L800A0E5C:
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x7920($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x3E4
    lui         $at, 0x8009
    sh          $zero, -0x751C($at)
    sw          $v0, 0x28($sp)
    jal         func_800AE924
    sh          $zero, 0x38($sp)
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6CE0($at)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800A0EC8
    addiu       $v0, $zero, 0x2
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0xC18
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lb          $v0, 0x4($v0)
    slti        $v0, $v0, 0x11
    bnez        $v0, .L800A0EC8
    addiu       $v0, $zero, 0x2
    addiu       $v0, $zero, 0x3
.L800A0EC8:
    lui         $at, 0x8008
    sh          $v0, 0x2D96($at)
    lui         $at, 0x8008
    sh          $v0, 0x4EE2($at)
    j           func_8009C800
    nop
.end func_800A0E1C
