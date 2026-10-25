.text
.align 2
.set noreorder
.globl func_800A0AE0
.ent func_800A0AE0
func_800A0AE0:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    addiu       $sp, $sp, -0x30
    beqz        $v0, .L800A0B5C
    sw          $ra, 0x28($sp)
    lui         $v0, 0x8008
    lh          $v0, 0x7AC0($v0)
    bnez        $v0, .L800A0B5C
    nop
    jal         func_800AD54C
    nop
    jal         func_8009C9E8
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x11CC
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x32
    sh          $v0, 0x20($sp)
    jal         func_800AE924
    sw          $v1, 0x14($sp)
    addiu       $a0, $zero, 0x2D
    jal         func_8009CBB8
    addiu       $a1, $zero, 0xD2
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $zero, -0x6D38($at)
    lui         $at, 0x8008
    sh          $v0, 0x7AC0($at)
.L800A0B5C:
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800A0AE0
