.text
.align 2
.set noreorder
.globl func_800A289C
.ent func_800A289C
func_800A289C:
    lui         $v1, 0x38
    slt         $v0, $v1, $a1
    beqz        $v0, .L800A28B4
    nop
    lui         $at, 0x8008
    sw          $v1, 0x4F30($at)
.L800A28B4:
    lui         $v0, 0x8008
    lw          $v0, 0x4F30($v0)
    lui         $v1, 0xFFC8
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A28D4
    sll         $v0, $s1, 16
    lui         $at, 0x8008
    sw          $v1, 0x4F30($at)
.L800A28D4:
    blez        $v0, .L800A28EC
    nop
    jal         func_80029494
    addu        $a0, $a2, $zero
    jal         func_80029858
    nop
.L800A28EC:
    lui         $v1, 0x8009
    lh          $v1, -0x7F50($v1)
    beqz        $v1, . + 4 + (0xCD << 2)
    addu        $a0, $v1, $zero
    blez        $v1, .L800A2988
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800A2914
    nop
    jal         func_800418F8
    nop
.L800A2914:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $a0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lhu         $v0, 0x2D94($at)
    lui         $v1, 0x8009
    lhu         $v1, -0x7F50($v1)
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $v0, 0x2D94($at)
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x100
    bnez        $v0, . + 4 + (0x1F << 2)
    addiu       $v0, $zero, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $v0, 0x2D94($at)
    j           func_8009E2C8
    nop
.L800A2988:
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v0, 0x2D94($at)
.end func_800A289C
