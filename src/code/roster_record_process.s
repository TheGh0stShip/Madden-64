.text
.align 2
.set noreorder
.globl roster_record_process
.ent roster_record_process
roster_record_process:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    addu        $a0, $zero, $zero
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    lui         $at, 0x8007
    sw          $zero, 0x3440($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x1456
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x2BA8
    addu        $a1, $v0, $zero
    sll         $a2, $s1, 16
    lui         $at, 0x8007
    sw          $a1, 0x3438($at)
    jal         func_800E2068
    sra         $a2, $a2, 16
    sll         $s0, $s0, 16
    sra         $s0, $s0, 16
    addiu       $v0, $zero, 0x1
    bne         $s0, $v0, .L80039940
    addu        $s4, $s1, $zero
    lui         $v0, 0x8007
    lhu         $v0, -0x4620($v0)
    beqz        $v0, .L80039930
    addu        $s1, $zero, $zero
    lui         $s3, 0x8007
    addiu       $s3, $s3, -0x461C
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0xC90
    addiu       $s2, $s0, 0x6C
    andi        $v0, $s1, 0xFFFF
.L800398E4:
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s3
    lhu         $v1, 0x0($v0)
    sb          $v1, 0x0($s0)
    lhu         $a0, 0x0($v0)
    jal         func_8003A8CC
    addu        $a1, $s2, $zero
    addu        $a0, $s2, $zero
    jal         func_8003AE80
    addiu       $a1, $s0, 0xDA
    jal         func_80039ACC
    addu        $a0, $zero, $zero
    lui         $v1, 0x8007
    lhu         $v1, -0x4620($v1)
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800398E4
    andi        $v0, $s1, 0xFFFF
.L80039930:
    jal         func_80039BB0
    nop
    j .L800399CC
    nop
.L80039940:
    addiu       $v0, $zero, 0x2
    bne         $s0, $v0, .L800399CC
    nop
    lui         $v0, 0x800C
    lbu         $v0, 0x4EEB($v0)
    beqz        $v0, .L800399CC
    addu        $s1, $zero, $zero
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x6190
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0xC90
    addiu       $s2, $s0, 0x6C
    andi        $v0, $s1, 0xFFFF
.L80039974:
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s3
    lhu         $v1, 0x0($v0)
    sb          $v1, 0x0($s0)
    lhu         $a0, 0x0($v0)
    jal         func_8003A8CC
    addu        $a1, $s2, $zero
    addu        $a0, $s2, $zero
    jal         func_8003AE80
    addiu       $a1, $s0, 0xDA
    jal         func_80039ACC
    addu        $a0, $zero, $zero
    lui         $v0, 0x800C
    lbu         $v0, 0x4EEB($v0)
    addiu       $s1, $s1, 0x1
    andi        $v1, $s1, 0xFFFF
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    andi        $v0, $v0, 0xFFFF
    sltu        $v1, $v1, $v0
    bnez        $v1, .L80039974
    andi        $v0, $s1, 0xFFFF
.L800399CC:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x2BA8
    lui         $a1, 0x8007
    lw          $a1, 0x3438($a1)
    sll         $s0, $s4, 16
    sra         $s0, $s0, 16
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sw          $v0, 0x3440($at)
    jal         func_800E2190
    addu        $a2, $s0, $zero
    lui         $a1, 0x8007
    lw          $a1, 0x3438($a1)
    addu        $s1, $zero, $zero
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sw          $zero, 0x3438($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x3C0
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x2BB0
    addu        $a1, $v0, $zero
    lui         $at, 0x8007
    sw          $a1, 0x343C($at)
    jal         func_800E2068
    addu        $a2, $s0, $zero
    addiu       $a1, $zero, 0xFF
    andi        $v1, $s1, 0xFFFF
.L80039A44:
    addiu       $s1, $s1, 0x1
    lui         $a0, 0x8007
    lw          $a0, 0x343C($a0)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $a0
    sb          $a1, 0xD($v0)
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x18
    bnez        $v0, .L80039A44
    andi        $v1, $s1, 0xFFFF
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x2BB0
    lui         $a1, 0x8007
    lw          $a1, 0x343C($a1)
    sll         $a2, $s4, 16
    jal         func_800E2190
    sra         $a2, $a2, 16
    lui         $a1, 0x8007
    lw          $a1, 0x343C($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8007
    sw          $zero, 0x343C($at)
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end roster_record_process
