.text
.align 2
.set noreorder
.globl func_800A3294
.ent func_800A3294
func_800A3294:
    addiu       $v1, $v1, -0x1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2D96($at)
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    addiu       $a0, $zero, 0x28
    jal         func_8009C900
    addiu       $a1, $zero, 0x1
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x36B8
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0xAF
    sw          $s0, 0x14($sp)
    jal         func_800AE924
    sh          $v0, 0x20($sp)
    addiu       $a0, $zero, 0x2D
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lui         $v0, 0x4000
    sllv        $v0, $v0, $s0
    or          $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    jal         func_8009CBB8
    addiu       $a1, $zero, 0xD2
    jal         func_800C1E4C
    addiu       $a0, $zero, 0xA
    lui         $at, 0x8008
    sh          $zero, 0x7702($at)
    jal         func_800A2BAC
    addiu       $a0, $zero, 0x1400
    addiu       $v0, $zero, 0x1
    lw          $ra, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A3294
