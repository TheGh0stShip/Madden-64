.text
.align 2
.set noreorder
.globl menu_record_process
.ent menu_record_process
menu_record_process:
    lui         $v1, 0x8007
    lhu         $v1, -0x4628($v1)
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a2, $zero
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x24($sp)
    sw          $s3, 0x1C($sp)
    bne         $v1, $v0, .L80029E64
    sw          $s0, 0x10($sp)
    jal         func_8002C304
    andi        $a0, $s1, 0xFFFF
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 1
    lui         $a0, 0x8007
    lw          $a0, -0x4624($a0)
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addiu       $v0, $zero, 0xFF
    addu        $s0, $a0, $v1
    andi        $a0, $s2, 0xFFFF
    beql        $a0, $v0, .L80029D20
    addiu       $v1, $zero, 0x672
    jal         func_80028A58
    nop
    andi        $v0, $v0, 0xFFFF
    sll         $v1, $v0, 3
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    subu        $v1, $v1, $v0
.L80029D20:
    andi        $a0, $s1, 0xFFFF
    addiu       $a1, $zero, 0x24
    andi        $v1, $v1, 0xFFFF
    andi        $s3, $s4, 0xFFFF
    addu        $v1, $v1, $s3
    sll         $v0, $v1, 1
    lui         $a2, 0x8007
    lw          $a2, -0x4624($a2)
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $t0, $a2, $v0
    lwl         $v0, 0x0($s0)
    lwr         $v0, 0x3($s0)
    lwl         $v1, 0x4($s0)
    lwr         $v1, 0x7($s0)
    lwl         $a2, 0x8($s0)
    lwr         $a2, 0xB($s0)
    swl         $v0, 0x0($t0)
    swr         $v0, 0x3($t0)
    swl         $v1, 0x4($t0)
    swr         $v1, 0x7($t0)
    swl         $a2, 0x8($t0)
    jal         func_8002C3FC
    swr         $a2, 0xB($t0)
    addu        $s0, $v0, $zero
    beqz        $s0, .L80029DEC
    andi        $a0, $s2, 0xFFFF
    addiu       $v0, $zero, 0xFF
    beql        $a0, $v0, .L80029DDC
    addu        $a0, $s0, $zero
    jal         func_8002C500
    addiu       $a1, $zero, 0x24
    addu        $t0, $v0, $zero
    beqz        $t0, .L80029DDC
    addu        $a0, $s0, $zero
    lwl         $v0, 0x0($s0)
    lwr         $v0, 0x3($s0)
    swl         $v0, 0x0($t0)
    swr         $v0, 0x3($t0)
    lw          $v0, 0x0($t0)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s3, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($t0)
    addu        $a0, $s0, $zero
.L80029DDC:
    lw          $v0, 0x0($a0)
    lui         $v1, 0xFE00
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a0)
.L80029DEC:
    andi        $a0, $s1, 0xFFFF
    jal         func_8002C3FC
    addiu       $a1, $zero, 0x21
    addu        $s0, $v0, $zero
    beqz        $s0, .L80029E64
    andi        $a0, $s2, 0xFFFF
    addiu       $v0, $zero, 0xFF
    beql        $a0, $v0, .L80029E54
    addu        $a0, $s0, $zero
    jal         func_8002C500
    addiu       $a1, $zero, 0x21
    addu        $t0, $v0, $zero
    beqz        $t0, .L80029E54
    addu        $a0, $s0, $zero
    lwl         $v0, 0x0($s0)
    lwr         $v0, 0x3($s0)
    swl         $v0, 0x0($t0)
    swr         $v0, 0x3($t0)
    lw          $v0, 0x0($t0)
    lui         $v1, 0x1FF
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    sll         $v1, $s4, 25
    or          $v0, $v0, $v1
    sw          $v0, 0x0($t0)
    addu        $a0, $s0, $zero
.L80029E54:
    lw          $v0, 0x0($a0)
    lui         $v1, 0xFE00
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a0)
.L80029E64:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end menu_record_process
