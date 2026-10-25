.text
.align 2
.set noreorder
.globl func_800972EC
.ent func_800972EC
func_800972EC:
    andi        $v1, $a2, 0x1FFF
    lui         $a0, 0x8009
    lh          $a0, -0x751C($a0)
    lui         $t0, 0x8007
    addiu       $t0, $t0, -0x4856
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    sll         $v1, $v1, 2
    sh          $a2, 0x0($t0)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v1, $v1, $a1
    lw          $v1, 0x4($v1)
    subu        $v0, $v0, $a0
    sll         $a2, $v0, 2
    addiu       $v0, $zero, 0x11
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sw          $v1, 0x2DBC($at)
    beq         $a3, $v0, .L80097364
    addiu       $v1, $zero, 0x1
    jal         func_800DD28C
    addiu       $a0, $zero, 0x1
    j           func_80092F40
    nop
.L80097364:
    lui         $at, 0x8007
    sh          $zero, -0x4844($at)
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sh          $zero, 0x2DC0($at)
    lhu         $v0, 0x0($t0)
    lui         $at, 0x8009
    sh          $v1, -0x6D30($at)
    lui         $at, 0x8008
    addu        $at, $at, $a2
    lh          $v1, 0x2DC0($at)
    lui         $at, 0x8008
    addu        $at, $at, $a2
    lh          $a0, 0x2DC0($at)
    andi        $v0, $v0, 0x1FFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    lw          $a1, 0x4($v0)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    lui         $v1, 0x8008
    lw          $v1, 0x7894($v1)
    lui         $at, 0x8009
    sb          $zero, -0x49E8($at)
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v0, $a0, 2
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sw          $v1, 0x2DB8($at)
    lui         $v1, 0x8009
    lw          $v1, -0x7F6C($v1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sw          $a1, 0x2DBC($at)
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sw          $v1, 0x2DB4($at)
    j           func_80092F48
    nop
.end func_800972EC
