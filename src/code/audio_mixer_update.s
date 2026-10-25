.text
.align 2
.set noreorder
.globl audio_mixer_update
.ent audio_mixer_update
audio_mixer_update:
    lui         $v0, 0x8009
    lhu         $v0, -0x751C($v0)
    addiu       $sp, $sp, -0x40
    andi        $a0, $a0, 0xFFFF
    sw          $ra, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    bne         $a0, $v0, .L800381A0
    sw          $s0, 0x18($sp)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6AE8($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x7F60($at)
.L800381A0:
    addu        $s3, $zero, $zero
    lui         $s7, 0x8008
    addiu       $s7, $s7, 0x5040
    addiu       $s6, $zero, 0x3
    addu        $s4, $a0, $zero
    sll         $v0, $s4, 5
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s4
    sll         $s1, $v0, 2
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x4F34
    sll         $v0, $s4, 1
.L800381E4:
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s4
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s7
    andi        $s0, $s3, 0xFFFF
    sll         $v1, $s0, 2
    addu        $v1, $v1, $v0
    lw          $s2, 0x0($v1)
    jal         func_800E1C98
    addu        $a0, $s2, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sltiu       $v1, $s0, 0x1
    xor         $v0, $s4, $v0
    sltiu       $v0, $v0, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L80038248
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1
    sb          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x6
    jal         func_800E1B00
    sb          $v0, 0x11($sp)
.L80038248:
    sb          $s6, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x2DB8($at)
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $s0, $v0, 2
    addu        $v1, $v1, $s0
    lh          $v0, 0x2($v1)
    lh          $v1, 0x0($s5)
    addu        $v0, $v0, $v1
    srl         $v0, $v0, 8
    sb          $v0, 0x11($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lbu         $v0, 0x3($v0)
    addu        $v0, $v0, $v1
    sb          $v0, 0x12($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    lh          $v1, -0x4($s5)
    addu        $v0, $v0, $s0
    lh          $v0, 0x0($v0)
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 2
    jal         func_800E1B00
    sb          $v0, 0x13($sp)
    addiu       $v0, $zero, 0x4
    sb          $v0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lw          $v0, 0x4($v0)
    sb          $v0, 0x12($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lw          $v0, 0x8($v0)
    sra         $v0, $v0, 29
    sll         $v0, $v0, 4
    sb          $v0, 0x13($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lbu         $v0, 0x6($v0)
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    jal         func_800E1B00
    sb          $v0, 0x11($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x751C($v0)
    bnel        $s4, $v0, .L800386E8
    addiu       $s3, $s3, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lw          $v0, 0x8($v0)
    sll         $v0, $v0, 3
    sra         $v0, $v0, 19
    andi        $v1, $v0, 0x7FF
    beqz        $v1, .L800386E4
    andi        $v0, $v0, 0x400
    beqz        $v0, .L80038370
    addu        $a0, $v1, $zero
    ori         $a0, $v1, 0xF800
.L80038370:
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x7A18($at)
    sll         $v0, $a0, 16
    sra         $a2, $v0, 16
    lui         $at, 0x8009
    sh          $s3, -0x6AE8($at)
    bgez        $a2, .L80038404
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lh          $v1, 0x0($v0)
    lw          $a1, -0x4($s5)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    sll         $v1, $v1, 16
    addu        $v1, $v1, $a1
    addu        $v0, $v0, $s0
    lh          $a0, 0x0($v0)
    sll         $v0, $a2, 16
    addu        $v1, $v1, $v0
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    lui         $at, 0x8008
    sw          $v1, 0x76EC($at)
    sll         $a0, $a0, 16
    addu        $a0, $a0, $a1
    andi        $v0, $v0, 0x2000
    lui         $at, 0x8008
    sw          $a0, 0x76F0($at)
    beqz        $v0, .L80038474
    nop
    j .L8003846C
    nop
.L80038404:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, 0x2DB8($at)
    lw          $a0, -0x4($s5)
    addu        $v0, $v0, $s0
    lh          $v0, 0x0($v0)
    addu        $v1, $v1, $s0
    lh          $v1, 0x0($v1)
    sll         $v0, $v0, 16
    addu        $v0, $v0, $a0
    sll         $v1, $v1, 16
    addu        $v1, $v1, $a0
    lui         $a0, 0x8007
    lhu         $a0, -0x4856($a0)
    lui         $at, 0x8008
    sw          $v0, 0x76EC($at)
    sll         $v0, $a2, 16
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, 0x76F0($at)
    andi        $a0, $a0, 0x2000
    bnez        $a0, .L80038474
    nop
.L8003846C:
    lui         $at, 0x8009
    sb          $zero, -0x7A18($at)
.L80038474:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, 0x2DB8($at)
    andi        $v1, $s3, 0xFFFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $s0, $v0, 2
    addu        $a0, $a0, $s0
    lhu         $v0, 0x8($a0)
    andi        $v0, $v0, 0x1000
    beqz        $v0, .L8003850C
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6AE8($at)
    jal         func_800CA518
    nop
    sb          $s6, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v1, $v0, $s0
    lhu         $v0, 0x8($v1)
    andi        $v0, $v0, 0x800
    bnez        $v0, .L800385DC
    nop
    lh          $v0, 0x2($v1)
    lui         $v1, 0x8008
    lh          $v1, 0x4F34($v1)
    addu        $v0, $v0, $v1
    srl         $v0, $v0, 8
    sb          $v0, 0x11($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    j .L80038620
    addu        $v0, $v0, $s0
.L80038504:
    j .L80038564
    addu        $s0, $zero, $zero
.L8003850C:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x2
    bnel        $v0, $zero, .L800386E8
    addiu       $s3, $s3, 0x1
    lui         $v0, 0x8009
    lh          $v0, -0x6D30($v0)
    bnel        $v0, $zero, .L800386E8
    addiu       $s3, $s3, 0x1
    addiu       $s0, $zero, 0x1
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    addu        $a0, $zero, $zero
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x4FEC
    andi        $a1, $v0, 0x1FFF
.L8003854C:
    lhu         $v0, 0x0($v1)
    beq         $v0, $a1, .L80038504
    addiu       $a0, $a0, 0x1
    slti        $v0, $a0, 0x2
    bnez        $v0, .L8003854C
    addiu       $v1, $v1, 0x2
.L80038564:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x64
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x14
    beqz        $v0, .L800386E4
    addiu       $v0, $zero, 0x1
    bnel        $s0, $v0, .L800386E8
    addiu       $s3, $s3, 0x1
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x1
    sb          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x8
    jal         func_800E1B00
    sb          $v0, 0x11($sp)
    jal         func_800CA518
    nop
    sb          $s6, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, 0x2DB8($at)
    andi        $v1, $s3, 0xFFFF
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $a1, $v0, 2
    addu        $a0, $a0, $a1
    lhu         $v0, 0x8($a0)
    andi        $v0, $v0, 0x800
    beqz        $v0, .L800385F8
    nop
.L800385DC:
    lui         $v1, 0x8008
    lh          $v1, 0x4F34($v1)
    addiu       $v1, $v1, -0x2A
    srl         $v0, $v1, 8
    sb          $v0, 0x11($sp)
    j .L8003862C
    sb          $v1, 0x12($sp)
.L800385F8:
    lh          $v0, 0x2($a0)
    lui         $v1, 0x8008
    lh          $v1, 0x4F34($v1)
    addu        $v0, $v0, $v1
    srl         $v0, $v0, 8
    sb          $v0, 0x11($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $a1
.L80038620:
    lbu         $v0, 0x3($v0)
    addu        $v0, $v0, $v1
    sb          $v0, 0x12($sp)
.L8003862C:
    addu        $a0, $s2, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a2, 0x2DB8($at)
    andi        $v0, $s3, 0xFFFF
    sll         $s0, $v0, 1
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addiu       $a1, $sp, 0x10
    addu        $a2, $a2, $s0
    lw          $v1, 0x8($a2)
    lh          $v0, 0x0($a2)
    lui         $a2, 0x8008
    lh          $a2, 0x4F30($a2)
    sll         $v1, $v1, 3
    sra         $v1, $v1, 19
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a2
    sra         $v0, $v0, 2
    jal         func_800E1B00
    sb          $v0, 0x13($sp)
    addiu       $v0, $zero, 0x4
    sb          $v0, 0x10($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lw          $v0, 0x4($v0)
    sb          $v0, 0x12($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lw          $v0, 0x8($v0)
    sra         $v0, $v0, 29
    sll         $v0, $v0, 4
    sb          $v0, 0x13($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB8($at)
    addu        $v0, $v0, $s0
    lbu         $v0, 0x6($v0)
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x10
    jal         func_800E1B00
    sb          $v0, 0x11($sp)
.L800386E4:
    addiu       $s3, $s3, 0x1
.L800386E8:
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800381E4
    sll         $v0, $s4, 1
    lw          $ra, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end audio_mixer_update
