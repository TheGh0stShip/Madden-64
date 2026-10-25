.text
.align 2
.set noreorder
.globl roster_selection_update
.ent roster_selection_update
roster_selection_update:
    addiu       $sp, $sp, -0x18
    addu        $t1, $a0, $zero
    andi        $a1, $t1, 0xFFFF
    addiu       $v0, $zero, 0x1F3F
    sw          $ra, 0x14($sp)
    bne         $a1, $v0, .L8003AA90
    sw          $s0, 0x10($sp)
    addu        $a0, $zero, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5AF8
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0x28
    jal         func_80033308
    addu        $a3, $zero, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2D4C
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0x48
    lui         $at, 0x8008
    sb          $v0, -0x5AE8($at)
    addiu       $v0, $zero, 0x37
    lui         $at, 0x8008
    sb          $v0, -0x5AE9($at)
    j .L8003AC84
    nop
.L8003AA90:
    lui         $v0, 0x8009
    lhu         $v0, -0x5064($v0)
    bnez        $v0, .L8003AB7C
    andi        $v0, $a0, 0x8000
    lui         $a3, 0x8008
    addiu       $a3, $a3, -0x5AF8
    sll         $v0, $a1, 2
    lui         $v1, 0x8007
    lw          $v1, 0x3430($v1)
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
    or          $v0, $v1, $a3
    andi        $v0, $v0, 0x3
    beqz        $v0, .L8003AB28
    addu        $a2, $v1, $zero
    addiu       $t0, $v1, 0x20
.L8003AAD4:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    lwl         $a0, 0x8($a2)
    lwr         $a0, 0xB($a2)
    lwl         $a1, 0xC($a2)
    lwr         $a1, 0xF($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a0, 0x8($a3)
    swr         $a0, 0xB($a3)
    swl         $a1, 0xC($a3)
    swr         $a1, 0xF($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8003AAD4
    addiu       $a3, $a3, 0x10
    j .L8003AB58
    nop
.L8003AB28:
    addiu       $t0, $v1, 0x20
.L8003AB2C:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8003AB2C
    addiu       $a3, $a3, 0x10
.L8003AB58:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    j .L8003AC84
    swr         $v1, 0x7($a3)
.L8003AB7C:
    beqz        $v0, .L8003ABA0
    andi        $v0, $a1, 0x7FFF
    sll         $v1, $v0, 2
    lui         $a0, 0x8007
    lw          $a0, 0x343C($a0)
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    j .L8003ABB8
    addu        $v1, $a0, $v1
.L8003ABA0:
    sll         $v0, $a1, 2
    lui         $v1, 0x8007
    lw          $v1, 0x3430($v1)
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 3
    addu        $v1, $v1, $v0
.L8003ABB8:
    lui         $a3, 0x8008
    addiu       $a3, $a3, -0x5AF8
    addu        $a2, $v1, $zero
    or          $v0, $a2, $a3
    andi        $v0, $v0, 0x3
    beqz        $v0, .L8003AC28
    addiu       $t0, $a2, 0x20
.L8003ABD4:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    lwl         $a0, 0x8($a2)
    lwr         $a0, 0xB($a2)
    lwl         $a1, 0xC($a2)
    lwr         $a1, 0xF($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a0, 0x8($a3)
    swr         $a0, 0xB($a3)
    swl         $a1, 0xC($a3)
    swr         $a1, 0xF($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8003ABD4
    addiu       $a3, $a3, 0x10
    j .L8003AC54
    nop
.L8003AC28:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8003AC28
    addiu       $a3, $a3, 0x10
.L8003AC54:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    lui         $a1, 0x8008
    addiu       $a1, $a1, -0x5AEA
    jal         func_800372B4
    andi        $a0, $t1, 0xFFFF
.L8003AC84:
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5AF8
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end roster_selection_update
