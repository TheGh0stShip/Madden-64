.text
.align 2
.set noreorder
.globl func_80096BF4
.ent func_80096BF4
func_80096BF4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4
    beqz        $v0, .L80096CD8
    andi        $v1, $s1, 0xFFFF
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80096C40
    addiu       $v0, $zero, 0x51
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L80096C30
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L80096C50
    addiu       $v0, $zero, 0x55
    j           func_80092544
    sll         $a0, $s3, 16
.L80096C30:
    beq         $v1, $v0, .L80096C50
    addiu       $v0, $zero, 0x55
    j           func_80092544
    sll         $a0, $s3, 16
.L80096C40:
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    j           func_80092538
    addiu       $v0, $zero, 0x6
.L80096C50:
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    addiu       $v0, $zero, 0x24
    lui         $at, 0x8007
    sh          $v0, -0x4842($at)
    sll         $a0, $s3, 16
    sra         $a0, $a0, 16
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lui         $v1, 0x8007
    lhu         $v1, -0x4854($v1)
    sll         $v0, $v0, 2
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    lw          $v1, 0x4($v1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    lui         $v1, 0x8007
    lhu         $v1, -0x4842($v1)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2DC0($at)
    j           func_8009263C
    sll         $a0, $s3, 16
.L80096CD8:
    sll         $v1, $v1, 2
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v1, 0x2D98($at)
    lui         $a0, 0x8009
    lw          $a0, -0x6A24($a0)
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4854
    sh          $v1, 0x0($a1)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    lw          $v1, 0x4($v1)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    lh          $v1, 0x0($a1)
    addiu       $v0, $zero, 0x55
    bne         $v1, $v0, .L80096D54
    addiu       $v0, $zero, 0x6
    addiu       $v0, $zero, 0x24
.L80096D54:
    lui         $at, 0x8007
    sh          $v0, -0x4842($at)
    sll         $a0, $s3, 16
    jal         func_80092830
    sra         $a0, $a0, 16
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80096BF4
