.text
.align 2
.set noreorder
.globl func_80028B08
.ent func_80028B08
func_80028B08:
    addiu       $sp, $sp, -0x18
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x134
    sw          $ra, 0x14($sp)
    jal         func_80032E00
    sw          $s0, 0x10($sp)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x1190
    addu        $s0, $v0, $zero
    addu        $a1, $s0, $zero
    jal         func_800E2068
    addu        $a2, $zero, $zero
    lui         $a2, 0x800C
    addiu       $a2, $a2, 0x2EF0
    or          $v0, $s0, $a2
    andi        $v0, $v0, 0x3
    beqz        $v0, .L80028BA8
    addu        $a3, $s0, $zero
    addiu       $t0, $a2, 0x130
.L80028B54:
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
    bne         $a2, $t0, .L80028B54
    addiu       $a3, $a3, 0x10
    j .L80028BD8
    nop
.L80028BA8:
    addiu       $t0, $a2, 0x130
.L80028BAC:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L80028BAC
    addiu       $a3, $a3, 0x10
.L80028BD8:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x1190
    addu        $a1, $s0, $zero
    jal         func_800E2190
    addu        $a2, $zero, $zero
    addu        $a0, $zero, $zero
    jal         func_80032F3C
    addu        $a1, $s0, $zero
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80028B08
