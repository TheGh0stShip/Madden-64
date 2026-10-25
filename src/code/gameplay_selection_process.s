.text
.align 2
.set noreorder
.globl gameplay_selection_process
.ent gameplay_selection_process
gameplay_selection_process:
    lui         $v1, 0x8007
    lhu         $v1, -0x4628($v1)
    addiu       $sp, $sp, -0x60
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x5C($sp)
    sw          $fp, 0x58($sp)
    sw          $s7, 0x54($sp)
    sw          $s6, 0x50($sp)
    sw          $s5, 0x4C($sp)
    sw          $s4, 0x48($sp)
    sw          $s3, 0x44($sp)
    sw          $s2, 0x40($sp)
    sw          $s1, 0x3C($sp)
    sw          $s0, 0x38($sp)
    sh          $a0, 0x26($sp)
    bne         $v1, $v0, .L8002A324
    sh          $a1, 0x2E($sp)
    lhu         $s4, 0x26($sp)
    jal         func_8002C304
    addu        $a0, $s4, $zero
    lhu         $s5, 0x2E($sp)
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 1
    lui         $s0, 0x8007
    lw          $s0, -0x4624($s0)
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $a0, $s5, $zero
    jal         func_8002C304
    addu        $s0, $s0, $v1
    lwl         $v1, 0x0($s0)
    lwr         $v1, 0x3($s0)
    lwl         $a0, 0x4($s0)
    lwr         $a0, 0x7($s0)
    lwl         $a1, 0x8($s0)
    lwr         $a1, 0xB($s0)
    swl         $v1, 0x10($sp)
    swr         $v1, 0x13($sp)
    swl         $a0, 0x14($sp)
    swr         $a0, 0x17($sp)
    swl         $a1, 0x18($sp)
    swr         $a1, 0x1B($sp)
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 1
    lui         $a1, 0x8007
    lw          $a1, -0x4624($a1)
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $a3, $a1, $v1
    lwl         $v0, 0x0($a3)
    lwr         $v0, 0x3($a3)
    lwl         $v1, 0x4($a3)
    lwr         $v1, 0x7($a3)
    lwl         $a1, 0x8($a3)
    lwr         $a1, 0xB($a3)
    swl         $v0, 0x0($s0)
    swr         $v0, 0x3($s0)
    swl         $v1, 0x4($s0)
    swr         $v1, 0x7($s0)
    swl         $a1, 0x8($s0)
    swr         $a1, 0xB($s0)
    lwl         $v0, 0x10($sp)
    lwr         $v0, 0x13($sp)
    lwl         $v1, 0x14($sp)
    lwr         $v1, 0x17($sp)
    lwl         $a1, 0x18($sp)
    lwr         $a1, 0x1B($sp)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a1, 0x8($a3)
    swr         $a1, 0xB($a3)
    jal         func_80024B90
    addu        $a0, $s4, $zero
    addu        $a0, $s4, $zero
    andi        $v0, $v0, 0xFF
    jal         func_80024BD4
    sh          $v0, 0x36($sp)
    addu        $a0, $s5, $zero
    jal         func_80024B90
    andi        $s7, $v0, 0xFF
    addu        $a0, $s5, $zero
    jal         func_80024BD4
    andi        $fp, $v0, 0xFF
    lhu         $s3, 0x36($sp)
    andi        $s2, $fp, 0xFFFF
    bne         $s3, $s2, .L8002A0A8
    andi        $s6, $v0, 0xFF
    addu        $a0, $s4, $zero
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x24
    addu        $s0, $v0, $zero
    addu        $a0, $s5, $zero
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x24
    beqz        $s0, .L8002A02C
    addu        $s1, $v0, $zero
    lw          $v0, 0x0($s0)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s6, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
.L8002A02C:
    beqz        $s1, .L8002A04C
    lui         $v1, 0x1FF
    lw          $v0, 0x0($s1)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s7, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s1)
.L8002A04C:
    addu        $a0, $s4, $zero
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x21
    addu        $s0, $v0, $zero
    addu        $a0, $s5, $zero
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x21
    beqz        $s0, .L8002A08C
    addu        $s1, $v0, $zero
    lw          $v0, 0x0($s0)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s6, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
.L8002A08C:
    beqz        $s1, .L8002A324
    lui         $v1, 0x1FF
    lw          $v0, 0x0($s1)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    j .L8002A31C
    sll         $v1, $s7, 25
.L8002A0A8:
    addu        $a0, $s4, $zero
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x24
    addu        $s0, $v0, $zero
    addu        $a0, $s5, $zero
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x24
    addu        $s1, $v0, $zero
    sltu        $a0, $zero, $s0
    sltu        $v1, $zero, $s1
    or          $v0, $a0, $v1
    beqz        $v0, .L8002A1E0
    and         $v0, $a0, $v1
    beqz        $v0, .L8002A124
    lui         $a0, 0x1FF
    lw          $v0, 0x0($s0)
    sw          $v0, 0x10($sp)
    lw          $v0, 0x0($s1)
    sw          $v0, 0x0($s0)
    lw          $v0, 0x10($sp)
    sw          $v0, 0x0($s1)
    lw          $v0, 0x0($s0)
    ori         $a0, $a0, 0xFFFF
    sll         $v1, $s7, 25
    and         $v0, $v0, $a0
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lw          $v0, 0x0($s1)
    sll         $v1, $s6, 25
    j .L8002A1D8
    and         $v0, $v0, $a0
.L8002A124:
    beqz        $s0, .L8002A188
    addiu       $v0, $zero, 0xFF
    beq         $s2, $v0, .L8002A174
    addu        $a0, $s2, $zero
    jal         func_8002C500
    addiu       $a1, $zero, 0x24
    addu        $a3, $v0, $zero
    beqz        $a3, .L8002A174
    nop
    lwl         $v0, 0x0($s0)
    lwr         $v0, 0x3($s0)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    lw          $v0, 0x0($a3)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s6, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a3)
.L8002A174:
    lw          $v0, 0x0($s0)
    lui         $v1, 0xFE00
    or          $v0, $v0, $v1
    j .L8002A1E0
    sw          $v0, 0x0($s0)
.L8002A188:
    beq         $s3, $v0, .L8002A1D0
    addu        $a0, $s3, $zero
    jal         func_8002C500
    addiu       $a1, $zero, 0x24
    addu        $a3, $v0, $zero
    beqz        $a3, .L8002A1D0
    nop
    lwl         $v0, 0x0($s1)
    lwr         $v0, 0x3($s1)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    lw          $v0, 0x0($a3)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s7, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a3)
.L8002A1D0:
    lw          $v0, 0x0($s1)
    lui         $v1, 0xFE00
.L8002A1D8:
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s1)
.L8002A1E0:
    lhu         $a0, 0x26($sp)
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x21
    lhu         $a0, 0x2E($sp)
    addu        $s0, $v0, $zero
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x21
    addu        $s1, $v0, $zero
    sltu        $a0, $zero, $s0
    sltu        $v1, $zero, $s1
    or          $v0, $a0, $v1
    beqz        $v0, .L8002A324
    and         $v0, $a0, $v1
    beqz        $v0, .L8002A25C
    lui         $a0, 0x1FF
    lw          $v0, 0x0($s0)
    sw          $v0, 0x10($sp)
    lw          $v0, 0x0($s1)
    sw          $v0, 0x0($s0)
    lw          $v0, 0x10($sp)
    sw          $v0, 0x0($s1)
    lw          $v0, 0x0($s0)
    ori         $a0, $a0, 0xFFFF
    sll         $v1, $s7, 25
    and         $v0, $v0, $a0
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lw          $v0, 0x0($s1)
    sll         $v1, $s6, 25
    j .L8002A31C
    and         $v0, $v0, $a0
.L8002A25C:
    beqz        $s0, .L8002A2C4
    andi        $a0, $fp, 0xFFFF
    addiu       $v0, $zero, 0xFF
    beq         $a0, $v0, .L8002A2B0
    nop
    jal         func_8002C500
    addiu       $a1, $zero, 0x21
    addu        $a3, $v0, $zero
    beqz        $a3, .L8002A2B0
    nop
    lwl         $v0, 0x0($s0)
    lwr         $v0, 0x3($s0)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    lw          $v0, 0x0($a3)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s6, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a3)
.L8002A2B0:
    lw          $v0, 0x0($s0)
    lui         $v1, 0xFE00
    or          $v0, $v0, $v1
    j .L8002A324
    sw          $v0, 0x0($s0)
.L8002A2C4:
    lhu         $a0, 0x36($sp)
    addiu       $v0, $zero, 0xFF
    beq         $a0, $v0, .L8002A314
    nop
    jal         func_8002C500
    addiu       $a1, $zero, 0x21
    addu        $a3, $v0, $zero
    beqz        $a3, .L8002A314
    nop
    lwl         $v0, 0x0($s1)
    lwr         $v0, 0x3($s1)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    lw          $v0, 0x0($a3)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s7, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a3)
.L8002A314:
    lw          $v0, 0x0($s1)
    lui         $v1, 0xFE00
.L8002A31C:
    or          $v0, $v0, $v1
    sw          $v0, 0x0($s1)
.L8002A324:
    lw          $ra, 0x5C($sp)
    lw          $fp, 0x58($sp)
    lw          $s7, 0x54($sp)
    lw          $s6, 0x50($sp)
    lw          $s5, 0x4C($sp)
    lw          $s4, 0x48($sp)
    lw          $s3, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x60
    jr          $ra
    nop
.end gameplay_selection_process
