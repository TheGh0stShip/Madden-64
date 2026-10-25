.text
.align 2
.set noreorder
.globl func_80055A80
.ent func_80055A80
func_80055A80:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s0, 0x10($sp)
    lw          $v0, 0x4($s1)
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0x580
    addiu       $s0, $v0, 0x100
    addiu       $a0, $s0, -0x100
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0x100
    jal         func_8002E58C
    sw          $s0, 0x140($s1)
    addiu       $v0, $zero, 0xFF
    addiu       $v1, $s0, 0xFF
.L80055AC8:
    sb          $v0, 0x0($v1)
    addiu       $v0, $v0, -0x1
    bgez        $v0, .L80055AC8
    addiu       $v1, $v1, -0x1
    addiu       $s0, $s0, 0x80
    addiu       $a1, $zero, 0xFF
    addiu       $v1, $s0, 0x80
    addiu       $a0, $s0, 0x200
    sb          $a1, 0x0($v1)
.L80055AEC:
    addiu       $v1, $v1, 0x1
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L80055AEC
    sb          $a1, 0x0($v1)
    addiu       $a0, $s0, 0x200
    addu        $a1, $zero, $zero
    jal         func_8002E58C
    addiu       $a2, $zero, 0x180
    lw          $a2, 0x140($s1)
    addiu       $a3, $s0, 0x380
    or          $v0, $a2, $a3
    andi        $v0, $v0, 0x3
    beqz        $v0, .L80055B78
    addiu       $t0, $a2, 0x80
.L80055B24:
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
    bne         $a2, $t0, .L80055B24
    addiu       $a3, $a3, 0x10
    j .L80055BA4
    nop
.L80055B78:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L80055B78
    addiu       $a3, $a3, 0x10
.L80055BA4:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80055A80
