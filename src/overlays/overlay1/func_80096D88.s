.text
.align 2
.set noreorder
.globl func_80096D88
.ent func_80096D88
func_80096D88:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    bne         $a0, $v0, .L80096DDC
    sw          $ra, 0x1C($sp)
    lui         $v1, 0x8007
    lh          $v1, -0x4844($v1)
    lui         $v0, 0x8008
    lh          $v0, 0x6C8C($v0)
    bne         $v1, $v0, .L80096E1C
    nop
    lui         $v1, 0x8007
    lh          $v1, -0x4856($v1)
    lui         $v0, 0x8008
    lh          $v0, 0x7946($v0)
    bne         $v1, $v0, .L80096E1C
    nop
.L80096DDC:
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    bne         $a0, $v0, .L80096F40
    nop
    lui         $v1, 0x8007
    lh          $v1, -0x4842($v1)
    lui         $v0, 0x8008
    lh          $v0, 0x6BE6($v0)
    bne         $v1, $v0, .L80096E1C
    nop
    lui         $v1, 0x8007
    lh          $v1, -0x4854($v1)
    lui         $v0, 0x8008
    lh          $v0, 0x791C($v0)
    beq         $v1, $v0, .L80096F40
    nop
.L80096E1C:
    jal         func_800BEE28
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80096F40
    sll         $v0, $s0, 16
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sra         $a0, $v0, 16
    bne         $v1, $a0, .L80096ED4
    sll         $v0, $a0, 5
    lui         $a1, 0x8008
    lh          $a1, 0x7946($a1)
    slti        $v0, $a1, 0x1A
    beqz        $v0, .L80096E6C
    addu        $v1, $a1, $zero
    slti        $v0, $a1, 0x12
    beqz        $v0, .L80096F40
    nop
.L80096E6C:
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    sh          $v1, -0x4856($at)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    lw          $v1, 0x4($v1)
    lui         $a1, 0x8008
    lhu         $a1, 0x6C8C($a1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    lui         $at, 0x8007
    sh          $a1, -0x4844($at)
    j           func_80092814
    nop
.L80096ED4:
    lui         $v1, 0x8008
    lhu         $v1, 0x791C($v1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    sh          $v1, -0x4854($at)
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    lw          $v1, 0x4($v1)
    lui         $a1, 0x8008
    lhu         $a1, 0x6BE6($a1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    lui         $at, 0x8007
    sh          $a1, -0x4842($at)
    jal         func_80092830
    nop
.L80096F40:
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80096D88
