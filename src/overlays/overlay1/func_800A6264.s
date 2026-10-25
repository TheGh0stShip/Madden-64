.text
.align 2
.set noreorder
.globl func_800A6264
.ent func_800A6264
func_800A6264:
    addiu       $sp, $sp, -0x28
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x24($sp)
    bne         $a0, $v0, .L800A63EC
    sw          $s0, 0x20($sp)
    lui         $at, 0x8008
    sw          $a1, 0x7FA0($at)
    lbu         $a0, 0x21($a1)
    addiu       $v0, $zero, 0x40
    andi        $v1, $a0, 0xC0
    bne         $v1, $v0, .L800A62C0
    nop
    lbu         $v1, 0x1E($a1)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $v1, $v0, .L800A62B8
    nop
    jal         func_800BD79C
    andi        $a0, $a0, 0x3F
    j           func_800A1B9C
    nop
.L800A62B8:
    jal         func_800BD734
    andi        $a0, $a0, 0x3F
.L800A62C0:
    lui         $at, 0x8008
    sb          $zero, 0x831($at)
    lui         $at, 0x8008
    sh          $zero, 0x838($at)
    lui         $at, 0x8008
    sh          $zero, 0x85C($at)
    jal         func_8000F31C
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x5298($a0)
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x6458
    jal         func_8000D740
    addiu       $a1, $zero, 0x8
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    sw          $a0, 0x834($at)
    jal         func_8000EC58
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x834($a0)
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x3126
    sw          $v0, 0x10($sp)
    sw          $v0, 0x14($sp)
    jal         func_8000ECE4
    sw          $v0, 0x18($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x810
    jal         func_800A1CDC
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sw          $zero, 0x24($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sw          $zero, 0x2C($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sw          $zero, 0x30($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sw          $zero, 0x34($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sh          $zero, 0x3E($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    addiu       $v0, $zero, 0x32
    sh          $v0, 0x3C($v1)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    addiu       $v0, $zero, 0x1000
    sw          $v0, 0x40($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sw          $zero, 0x44($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    addiu       $v0, $zero, 0x30
    sw          $v0, 0x14($v1)
    lui         $v0, 0x8008
    lw          $v0, 0x834($v0)
    sw          $s0, 0x10($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x834($v1)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, 0x81C($at)
    lui         $v0, 0x800A
    addiu       $v0, $v0, 0x1D28
    sw          $v0, 0xC($v1)
    lui         $at, 0x8008
    sw          $zero, 0x7FA4($at)
    addiu       $v0, $zero, 0x1
.L800A63EC:
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A6264
