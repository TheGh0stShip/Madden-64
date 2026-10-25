.text
.align 2
.set noreorder
.globl func_8002619C
.ent func_8002619C
func_8002619C:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    addu        $a2, $zero, $zero
    lui         $t1, 0x8008
    addiu       $t1, $t1, 0x1876
    addiu       $t2, $t1, 0x214C
    addu        $a1, $zero, $zero
.L800261B8:
    sll         $v1, $a2, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    addu        $t0, $v0, $t1
    addu        $a3, $v0, $t2
.L800261DC:
    sll         $v0, $a1, 16
    addiu       $a0, $a1, 0x1
    addu        $a1, $a0, $zero
    sra         $v0, $v0, 15
    addu        $v1, $v0, $t0
    addu        $v0, $v0, $a3
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    slti        $a0, $a0, 0x2F
    sh          $zero, 0x0($v1)
    bnez        $a0, .L800261DC
    sh          $zero, 0x0($v0)
    addiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L800261B8
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x2D22
    addiu       $a3, $a1, 0x214C
.L80026238:
    sll         $a0, $a2, 16
    addiu       $v1, $a2, 0x1
    addu        $a2, $v1, $zero
    sra         $a0, $a0, 15
    addu        $v0, $a0, $a1
    addu        $a0, $a0, $a3
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    slti        $v1, $v1, 0x17
    sh          $zero, 0x0($v0)
    bnez        $v1, .L80026238
    sh          $zero, 0x0($a0)
    addu        $a2, $zero, $zero
    sll         $v1, $a2, 16
.L80026270:
    addiu       $v0, $a2, 0x1
    addu        $a2, $v0, $zero
    sra         $v1, $v1, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x6
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, 0x2D7E($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $zero, 0x4ECA($at)
    bnez        $v0, .L80026270
    sll         $v1, $a2, 16
    jal         func_80025AB8
    nop
    lui         $at, 0x8009
    sb          $zero, -0x6A28($at)
    lui         $at, 0x8009
    sb          $zero, -0x6A30($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8002619C
