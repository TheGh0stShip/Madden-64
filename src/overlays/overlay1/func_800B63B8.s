.text
.align 2
.set noreorder
.globl func_800B63B8
.ent func_800B63B8
func_800B63B8:
    jal         func_800B13A4
    addu        $s0, $v0, $zero
    lui         $v0, 0x8007
    lw          $v0, 0x208C($v0)
    lui         $v1, 0x8007
    addiu       $v1, $v1, 0x2088
    addiu       $a1, $v1, -0xC
    lui         $at, 0x8009
    sb          $s1, -0x6D50($at)
    lui         $t0, 0x8000
    addiu       $t0, $t0, 0x15F8
    lwl         $a0, 0x0($t0)
    lwr         $a0, 0x3($t0)
    lwl         $a2, 0x4($t0)
    lwr         $a2, 0x7($t0)
    lwl         $a3, 0x8($t0)
    lwr         $a3, 0xB($t0)
    swl         $a0, 0x0($v0)
    swr         $a0, 0x3($v0)
    swl         $a2, 0x4($v0)
    swr         $a2, 0x7($v0)
    swl         $a3, 0x8($v0)
    swr         $a3, 0xB($v0)
    lb          $a0, 0xC($t0)
    lb          $a2, 0xD($t0)
    lb          $a3, 0xE($t0)
    sb          $a0, 0xC($v0)
    sb          $a2, 0xD($v0)
    sb          $a3, 0xE($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x36D8
    sw          $v0, 0x0($v1)
    addiu       $v0, $zero, 0x40
    lui         $at, 0x8007
    sh          $v0, 0x2098($at)
    jal         func_800DC978
    addiu       $a2, $zero, 0x3C
    jal         func_800DCBC4
    nop
    jal         func_80041658
    nop
    jal         func_800B1744
    nop
    jal         func_800BDF68
    nop
    jal         func_8003190C
    addiu       $a0, $zero, 0x1000
    jal         func_8001AEA8
    addu        $a0, $s0, $zero
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x4
    jal         func_800AAC94
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x5088($v0)
    lui         $at, 0x8008
    sb          $zero, 0x7AF2($at)
    blez        $v0, .L800B64E0
    addu        $a0, $zero, $zero
    addu        $a2, $v0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x5C18
.L800B64BC:
    lw          $v1, 0x0($a1)
    beqz        $v1, .L800B64D4
    addiu       $a0, $a0, 0x1
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
.L800B64D4:
    slt         $v0, $a0, $a2
    bnez        $v0, .L800B64BC
    addiu       $a1, $a1, 0x4
.L800B64E0:
    lui         $a0, 0xFFFE
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    ori         $a0, $a0, 0xFFFF
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x6D60($at)
    and         $v1, $v1, $a0
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B63B8
