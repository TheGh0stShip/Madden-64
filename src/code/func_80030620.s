.text
.align 2
.set noreorder
.globl func_80030620
.ent func_80030620
func_80030620:
    addiu       $sp, $sp, -0x18
    addu        $v1, $zero, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    addiu       $a1, $zero, 0x1
    addu        $a0, $zero, $zero
    sw          $ra, 0x10($sp)
    lui         $at, 0x8008
    sh          $zero, 0x6DA8($at)
    addiu       $v0, $v0, -0x1
    lui         $at, 0x8008
    sw          $v0, 0x6180($at)
.L80030650:
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v0, 0x5183($at)
    andi        $v0, $v0, 0x8
    bnel        $v0, $zero, .L800306A8
    addiu       $v1, $v1, 0x1
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x6DE4($at)
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $a1, -0x7F18($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x6DA8($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x6DA8($at)
    addiu       $v1, $v1, 0x1
.L800306A8:
    slti        $v0, $v1, 0x4
    bnez        $v0, .L80030650
    addiu       $a0, $a0, 0x4
    lui         $v0, 0x8008
    lb          $v0, 0x6C65($v0)
    bnez        $v0, .L800306D0
    addu        $v1, $zero, $zero
    jal         func_8003190C
    addu        $a0, $zero, $zero
    addu        $v1, $zero, $zero
.L800306D0:
    lui         $a3, 0x8009
    addiu       $a3, $a3, -0x4D60
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x49D0
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x49B8
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4C78
.L800306F0:
    sh          $zero, 0x0($a0)
    sh          $zero, 0x0($a1)
    sh          $zero, 0x0($a2)
    sh          $zero, 0x0($a3)
    addiu       $a3, $a3, 0x2
    addiu       $a2, $a2, 0x2
    addiu       $a1, $a1, 0x2
    addiu       $v1, $v1, 0x1
    slti        $v0, $v1, 0x4
    bnez        $v0, .L800306F0
    addiu       $a0, $a0, 0x2
    addiu       $v0, $zero, 0x10
    lui         $at, 0x8009
    sh          $v0, -0x7F58($at)
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80030620
