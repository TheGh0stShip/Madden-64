.text
.align 2
.set noreorder
.globl func_800960B0
.ent func_800960B0
func_800960B0:
    addiu       $sp, $sp, -0x28
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $a1, 0xF41F
    ori         $a1, $a1, 0x7E36
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    addiu       $a2, $zero, -0x1
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0xC22($at)
    addiu       $v0, $zero, 0x28
    sw          $ra, 0x20($sp)
    lui         $at, 0x8009
    sw          $zero, -0x78EC($at)
    lui         $at, 0x8008
    sh          $a2, 0x7AF0($at)
    lui         $at, 0x8009
    sw          $zero, -0x7F38($at)
    lui         $at, 0x8008
    sb          $zero, 0x5026($at)
    lui         $at, 0x8009
    sb          $zero, -0x49E8($at)
    sll         $v1, $v1, 1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x6C24($at)
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    sll         $a0, $a0, 1
    addiu       $v0, $zero, 0x50
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $v0, 0x6C24($at)
    lui         $v0, 0x8008
    lhu         $v0, 0x6CA0($v0)
    ori         $v1, $v1, 0x800
    and         $v1, $v1, $a1
    addiu       $v0, $v0, 0x2
    lui         $at, 0x8008
    sh          $v0, 0x6CA0($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    bnez        $v0, .L80096178
    addiu       $v0, $zero, 0xA
    lui         $at, 0x8008
    sh          $v0, 0x6CA0($at)
.L80096178:
    lui         $v0, 0x8008
    lhu         $v0, 0x7758($v0)
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    lui         $at, 0x8008
    sh          $a2, 0x6CB0($at)
    lui         $at, 0x8008
    sh          $zero, 0x76E8($at)
    addiu       $a0, $v0, -0x3
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sh          $a0, 0x69D6($at)
    beq         $v1, $v0, .L800961C0
    sll         $v0, $a0, 16
    lui         $at, 0x8009
    sh          $zero, -0x6CAC($at)
    j           func_80091AC8
    nop
.L800961C0:
    lui         $at, 0x8009
    sh          $zero, -0x6CAC($at)
    bgtz        $v0, .L800961EC
    addiu       $v0, $zero, 0x7
    lui         $at, 0x8008
    sh          $v0, 0x69D6($at)
    addiu       $a0, $zero, 0xA
    jal         func_8009C900
    addiu       $a1, $zero, 0x1
    jal         func_8009C99C
    nop
.L800961EC:
    jal         func_800BEE28
    nop
    jal         func_800DD6EC
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6D30($v0)
    bnez        $v0, .L800962AC
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, .L800962AC
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x5280($v0)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800962AC
    nop
    jal         func_800DD524
    addu        $a0, $zero, $zero
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x6A24($a1)
    addiu       $v1, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    andi        $v0, $v0, 0x1FFF
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    sh          $v1, -0x4842($at)
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v0, $v0, $a1
    lw          $v0, 0x4($v0)
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    lbu         $v0, 0x0($v0)
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    andi        $v0, $v0, 0x1F
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x2DC0($at)
    jal         func_80093F14
    nop
.L800962AC:
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x4856
    lh          $v0, 0x0($a0)
    addiu       $v1, $zero, -0x1
    bne         $v0, $v1, .L800962C8
    addiu       $v0, $zero, 0x6
    sh          $v0, 0x0($a0)
.L800962C8:
    lui         $v0, 0x8007
    lh          $v0, -0x4854($v0)
    bne         $v0, $v1, .L800962E8
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x6CBC($v0)
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
.L800962E8:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    bne         $v0, $v1, .L80096344
    lui         $v1, 0x1000
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L80096344
    addiu       $v0, $zero, 0x59
    lh          $v1, 0x0($a0)
    bne         $v1, $v0, .L8009631C
    addiu       $v0, $zero, 0x9
    addiu       $v0, $zero, 0x27
.L8009631C:
    lui         $at, 0x8007
    sh          $v0, -0x4844($at)
    lui         $v1, 0x8007
    lh          $v1, -0x4854($v1)
    addiu       $v0, $zero, 0x55
    bne         $v1, $v0, .L8009633C
    addiu       $v0, $zero, 0x6
    addiu       $v0, $zero, 0x24
.L8009633C:
    lui         $at, 0x8007
    sh          $v0, -0x4842($at)
.L80096344:
    lui         $v0, 0x8009
    lh          $v0, -0x6D30($v0)
    bnez        $v0, .L8009639C
    addiu       $v0, $zero, 0x1
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lb          $v1, 0x6DDC($at)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80096380
    nop
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $zero, 0x6DDC($at)
.L80096380:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $zero, 0x6DDC($at)
    j           func_80091C80
    nop
.L8009639C:
    lui         $at, 0x8008
    sb          $v0, 0x5026($at)
    lui         $a1, 0x8009
    lh          $a1, -0x751C($a1)
    lui         $v1, 0x8007
    lhu         $v1, -0x4856($v1)
    lui         $a2, 0x8009
    lw          $a2, -0x6A24($a2)
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    lui         $at, 0x8008
    sw          $zero, 0xC1C($at)
    lui         $at, 0x8009
    sh          $zero, -0x6B04($at)
    sll         $v0, $a1, 5
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a2
    lw          $v1, 0x4($v1)
    subu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $v1, 0x8007
    lhu         $v1, -0x4854($v1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    andi        $v1, $v1, 0x1FFF
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a2
    lw          $v1, 0x4($v1)
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x2DBC($at)
    jal         func_8003890C
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6D30($v0)
    bnez        $v0, .L80096494
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x751C($a0)
    jal         func_80022354
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7920($a0)
    jal         func_80022354
    nop
.L80096494:
    jal         func_800BF1C8
    nop
    jal         func_800C1EB8
    nop
    jal         func_80091880
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L80096538
    addiu       $v0, $zero, 0x55
    lui         $v1, 0x8007
    lh          $v1, -0x4854($v1)
    beq         $v1, $v0, .L80096500
    addiu       $a0, $zero, 0x2
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a2, 0x5040($at)
    j           func_80091E08
    addiu       $a1, $zero, 0xD
.L80096500:
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a2, 0x5040($at)
    addiu       $a1, $zero, 0xE
    addu        $a3, $zero, $zero
    jal         func_800B7DD8
    sw          $zero, 0x10($sp)
.L80096538:
    lui         $at, 0x8009
    sh          $zero, -0x58E2($at)
    lw          $ra, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800960B0
