.text
.align 2
.set noreorder
.globl func_800A29E8
.ent func_800A29E8
func_800A29E8:
    sh          $v0, 0x2D94($at)
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x7F50
    lh          $v0, 0x0($s2)
    addiu       $s0, $zero, -0x2
    bne         $v0, $s0, .L800A2A94
    nop
    jal         func_800293CC
    nop
    addiu       $v0, $zero, 0x8
    lui         $at, 0x8009
    sb          $v0, -0x4FA0($at)
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8009
    sb          $v0, -0x4F9E($at)
    lui         $at, 0x8009
    sb          $v0, -0x4F9D($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x76DC($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x7AAC($v1)
    lui         $a0, 0x8008
    lhu         $a0, 0x2D94($a0)
    lui         $a1, 0x8008
    lhu         $a1, 0x4EE0($a1)
    lui         $at, 0x8009
    sb          $zero, -0x4F9F($at)
    lui         $at, 0x8009
    sh          $zero, -0x4F9A($at)
    lui         $at, 0x8009
    sb          $zero, -0x4F98($at)
    lui         $at, 0x8009
    sb          $zero, -0x4F97($at)
    sll         $v0, $v0, 13
    or          $v1, $v1, $v0
    lui         $at, 0x8009
    sh          $v1, -0x4F9C($at)
    lui         $at, 0x8009
    sb          $a0, -0x4F96($at)
    lui         $at, 0x8009
    sb          $a1, -0x4F95($at)
    jal         func_800299B8
    nop
.L800A2A94:
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, . + 4 + (0x45 << 2)
    addiu       $v0, $zero, 0x5
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    bnez        $v0, . + 4 + (0x41 << 2)
    addiu       $v0, $zero, 0x5
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bnez        $v0, . + 4 + (0x3D << 2)
    addiu       $v0, $zero, 0x5
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
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
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v1, 0x2D94($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D94($at)
    sltu        $v0, $v0, $v1
    beqz        $v0, . + 4 + (0x1B << 2)
    nop
    lh          $v0, 0x0($s2)
    beq         $v0, $s0, .L800A2B74
    addiu       $a0, $sp, 0x28
    jal         func_80029AD0
    nop
    addiu       $a0, $sp, 0x28
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x2F8C
    sw          $v0, 0x28($sp)
    jal         func_800AE924
    sh          $zero, 0x38($sp)
    addiu       $a0, $sp, 0x28
.L800A2B74:
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x2F48
    sw          $v0, 0x28($sp)
    addiu       $v0, $zero, 0xF
    jal         func_800AE924
    sh          $v0, 0x38($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    addiu       $v1, $zero, 0x6
    lui         $at, 0x8008
    sh          $v1, 0x76DC($at)
    andi        $v0, $v0, 0xFFEF
    lui         $at, 0x8009
    sh          $v0, -0x7F3C($at)
.end func_800A29E8
