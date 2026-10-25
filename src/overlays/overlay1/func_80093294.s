.text
.align 2
.set noreorder
.globl func_80093294
.ent func_80093294
func_80093294:
    jal         func_800AE7F0
    andi        $a0, $a0, 0xFFFF
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    addiu       $v0, $zero, 0x3C
    lui         $at, 0x8008
    sb          $zero, 0x5026($at)
    sll         $v1, $v1, 1
    addu        $a0, $v1, $s2
    addu        $v1, $v1, $s6
    sh          $v0, 0x0($a0)
    addiu       $v0, $zero, -0x1
    sh          $v0, 0x0($v1)
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x4854
    lhu         $s2, 0x0($s0)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A24($v1)
    sh          $s1, 0x0($s0)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v1, $s3, $v1
    lw          $v1, 0x4($v1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lbu         $v1, 0x0($v1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    andi        $v1, $v1, 0x1F
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2DC0($at)
    jal         func_80093F14
    addiu       $s3, $zero, 0x1
    lhu         $s1, 0x0($s0)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    ori         $v1, $zero, 0xFFFF
    sh          $s2, 0x0($s0)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $s1, 0x2D98($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sh          $v1, 0x2DA4($at)
    jal         func_800920B8
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    sb          $zero, 0x5026($at)
    bnez        $s3, . + 4 + (0x73 << 2)
    nop
    jal         func_800DD524
    addiu       $a0, $zero, 0x2
    addu        $s1, $v0, $zero
.end func_80093294
