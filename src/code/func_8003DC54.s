.text
.align 2
.set noreorder
.globl func_8003DC54
.ent func_8003DC54
func_8003DC54:
    addiu       $sp, $sp, -0x38
    addu        $a3, $a0, $zero
    addu        $a2, $a3, $zero
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x2C80
    lwl         $v0, 0x0($a1)
    lwr         $v0, 0x3($a1)
    lwl         $v1, 0x4($a1)
    lwr         $v1, 0x7($a1)
    lwl         $a0, 0x8($a1)
    lwr         $a0, 0xB($a1)
    swl         $v0, 0x0($sp)
    swr         $v0, 0x3($sp)
    swl         $v1, 0x4($sp)
    swr         $v1, 0x7($sp)
    swl         $a0, 0x8($sp)
    swr         $a0, 0xB($sp)
    lwl         $v0, 0xC($a1)
    lwr         $v0, 0xF($a1)
    lwl         $v1, 0x10($a1)
    lwr         $v1, 0x13($a1)
    lh          $a0, 0x14($a1)
    swl         $v0, 0xC($sp)
    swr         $v0, 0xF($sp)
    swl         $v1, 0x10($sp)
    swr         $v1, 0x13($sp)
    sh          $a0, 0x14($sp)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x2C98
    lwl         $v0, 0x0($a1)
    lwr         $v0, 0x3($a1)
    lwl         $v1, 0x4($a1)
    lwr         $v1, 0x7($a1)
    lwl         $a0, 0x8($a1)
    lwr         $a0, 0xB($a1)
    swl         $v0, 0x18($sp)
    swr         $v0, 0x1B($sp)
    swl         $v1, 0x1C($sp)
    swr         $v1, 0x1F($sp)
    swl         $a0, 0x20($sp)
    swr         $a0, 0x23($sp)
    lwl         $v0, 0xC($a1)
    lwr         $v0, 0xF($a1)
    lwl         $v1, 0x10($a1)
    lwr         $v1, 0x13($a1)
    lwl         $a0, 0x14($a1)
    lwr         $a0, 0x17($a1)
    swl         $v0, 0x24($sp)
    swr         $v0, 0x27($sp)
    swl         $v1, 0x28($sp)
    swr         $v1, 0x2B($sp)
    swl         $a0, 0x2C($sp)
    swr         $a0, 0x2F($sp)
    lwl         $v0, 0x18($a1)
    lwr         $v0, 0x1B($a1)
    lb          $v1, 0x1C($a1)
    lb          $a0, 0x1D($a1)
    swl         $v0, 0x30($sp)
    swr         $v0, 0x33($sp)
    sb          $v1, 0x34($sp)
    sb          $a0, 0x35($sp)
    andi        $v0, $a2, 0xFFFF
    sltiu       $v0, $v0, 0x52
    bnez        $v0, .L8003DD5C
    addiu       $a0, $sp, 0x18
    addiu       $a2, $a3, -0x52
.L8003DD5C:
    andi        $v0, $a2, 0xFFFF
    sltiu       $v0, $v0, 0x29
    beql        $v0, $zero, .L8003DD6C
    addiu       $a2, $a2, -0x29
.L8003DD6C:
    andi        $v1, $a2, 0xFFFF
    sltiu       $v0, $v1, 0x1E
    bnez        $v0, .L8003DD90
    addu        $v0, $a0, $v1
    sll         $v0, $v1, 1
    addu        $v0, $v0, $sp
    lhu         $v0, -0x3C($v0)
    j .L8003DD98
    andi        $v0, $v0, 0xFFFF
.L8003DD90:
    lbu         $v0, 0x0($v0)
    andi        $v0, $v0, 0xFFFF
.L8003DD98:
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8003DC54
