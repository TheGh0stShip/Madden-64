.text
.align 2
.set noreorder
.globl func_80098638
.ent func_80098638
func_80098638:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80098744
    sw          $ra, 0x10($sp)
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
    lh          $v1, 0x2DC0($at)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800986AC
    slti        $v0, $v1, 0x3
    bnez        $v0, .L80098744
    slti        $v0, $v1, 0x13
    beqz        $v0, .L80098744
    slti        $v0, $v1, 0xF
    bnez        $v0, .L80098744
    nop
.L800986AC:
    jal         func_800DEC38
    nop
    addiu       $v0, $v0, -0x3
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80098730
    lui         $v0, 0x1DF
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    beqz        $v0, .L80098704
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    slti        $v0, $v0, 0x3
    beqz        $v0, .L80098730
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    j           func_80094004
    sltiu       $v0, $v0, 0x28
.L80098704:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    slti        $v0, $v0, 0x3
    bnez        $v0, .L80098744
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x14
    beqz        $v0, .L80098744
    nop
.L80098730:
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x4854
    lhu         $v0, 0x0($v1)
    ori         $v0, $v0, 0x2000
    sh          $v0, 0x0($v1)
.L80098744:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80098638
