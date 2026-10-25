.text
.align 2
.set noreorder
.globl func_800A0B6C
.ent func_800A0B6C
func_800A0B6C:
    addiu       $sp, $sp, -0x58
    sw          $s1, 0x4C($sp)
    lui         $s1, 0x8008
    lhu         $s1, 0x76DC($s1)
    sw          $ra, 0x50($sp)
    sw          $s0, 0x48($sp)
    lui         $at, 0x8009
    sh          $zero, -0x7F74($at)
    lui         $at, 0x8008
    sh          $zero, 0x7AC0($at)
    jal         func_8003F4E8
    addiu       $s0, $zero, 0x1
    lui         $v0, 0x8009
    lh          $v0, -0x5A50($v0)
    bne         $v0, $s0, .L800A0BB4
    nop
    jal         func_80036D38
    nop
.L800A0BB4:
    lui         $a0, 0x8008
    lh          $a0, 0x76DC($a0)
    addiu       $v0, $zero, 0x5
    lui         $at, 0x8008
    sh          $zero, 0x57C0($at)
    beq         $a0, $v0, .L800A0C74
    addu        $v1, $a0, $zero
    addiu       $v0, $zero, 0x4
    bne         $a0, $v0, .L800A0CD0
    addiu       $v0, $v1, 0x1
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
    bne         $v1, $v0, .L800A0CD0
    addiu       $v0, $zero, 0x6
    addiu       $v0, $zero, 0x5
    lui         $at, 0x8008
    sh          $v0, 0x76DC($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x69D4($at)
    j           func_8009C5B4
    nop
.L800A0C74:
    lui         $v0, 0x8009
    lh          $v0, -0x5A50($v0)
    bne         $v0, $s0, .L800A0CB8
    xori        $v1, $v0, 0x2
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0xC18
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lb          $v0, 0x4($v0)
    slti        $v0, $v0, 0x11
    beqz        $v0, .L800A0CAC
    addiu       $v0, $zero, 0x6
    lui         $at, 0x8008
    sh          $v0, 0x76DC($at)
.L800A0CAC:
    lui         $v0, 0x8009
    lh          $v0, -0x5A50($v0)
    xori        $v1, $v0, 0x2
.L800A0CB8:
    sltiu       $v1, $v1, 0x1
    xori        $v0, $v0, 0x4
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L800A0CD8
    addiu       $v0, $zero, 0x6
.L800A0CD0:
    lui         $at, 0x8008
    sh          $v0, 0x76DC($at)
.L800A0CD8:
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x6
    beq         $v1, $v0, . + 4 + (0xC0 << 2)
    nop
    jal         func_8009BC40
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800A0D18
    addiu       $v0, $zero, 0x5
    beq         $v1, $v0, . + 4 + (0x42 << 2)
    sll         $v0, $s1, 16
    j           func_8009C7BC
    nop
.L800A0D18:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lui         $v0, 0xEFFF
    ori         $v0, $v0, 0xFFFF
    lui         $a0, 0x8008
    lh          $a0, 0x6BE2($a0)
    and         $v1, $v1, $v0
    lui         $v0, 0x8
    or          $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    bnez        $a0, .L800A0D58
    addiu       $a1, $zero, 0x1
    addu        $a1, $zero, $zero
    j           func_8009C638
    addiu       $a0, $zero, 0x1
.L800A0D58:
    addu        $a0, $zero, $zero
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    addu        $v0, $a0, $zero
    bne         $v0, $v1, . + 4 + (0x9 << 2)
    nop
    lui         $at, 0x8009
    sh          $a1, -0x7920($at)
    lui         $at, 0x8009
    sh          $a0, -0x751C($at)
    jal         func_800A3294
    nop
    j           func_8009C680
    addiu       $a0, $sp, 0x10
.end func_800A0B6C
