.text
.align 2
.set noreorder
.globl audio_voice_update
.ent audio_voice_update
audio_voice_update:
    lui         $v0, 0x8007
    lhu         $v0, -0x4856($v0)
    addiu       $sp, $sp, -0x50
    sw          $s0, 0x28($sp)
    addu        $s0, $a1, $zero
    sw          $s7, 0x44($sp)
    addu        $s7, $a0, $zero
    sw          $fp, 0x48($sp)
    addu        $fp, $zero, $zero
    sw          $ra, 0x4C($sp)
    sw          $s6, 0x40($sp)
    sw          $s5, 0x3C($sp)
    sw          $s4, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s2, 0x30($sp)
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L80037624
    sw          $s1, 0x2C($sp)
    andi        $v0, $s7, 0xFFFF
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $a0, 0x2DC1($at)
    jal         func_800393E0
    nop
    sll         $v0, $v0, 16
    sltu        $v0, $zero, $v0
    addu        $fp, $v0, $zero
.L80037624:
    lbu         $v0, 0x0($s0)
    andi        $v1, $v0, 0x80
    beqz        $v1, .L80037798
    addiu       $s2, $s0, 0x6
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    addiu       $s0, $s0, 0x6
    srl         $v0, $v0, 1
    beqz        $v0, .L800378B0
    addu        $s3, $zero, $zero
    andi        $s5, $s7, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5040
    sll         $v0, $s5, 1
    addu        $v0, $v0, $s5
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sw          $v0, 0x1C($sp)
    addiu       $s6, $sp, 0x11
    xori        $a2, $fp, 0x1
    sw          $a2, 0x24($sp)
.L80037680:
    lw          $a2, 0x1C($sp)
    andi        $v0, $s3, 0xFFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    lw          $s1, 0x0($v0)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x200
    sw          $v0, 0x14($v1)
    lhu         $v0, 0x28($s1)
    andi        $v0, $v0, 0x10
    bnel        $v0, $zero, .L800376BC
    sb          $zero, 0x68($s1)
    jal         func_800E1C98
    addu        $a0, $s1, $zero
.L800376BC:
    lw          $a2, 0x24($sp)
    sb          $zero, 0x10($sp)
    sltiu       $s4, $a2, 0x1
.L800376C8:
    lbu         $s2, 0x0($s0)
    andi        $v0, $s2, 0x7F
    sb          $v0, 0x10($sp)
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lb          $v0, 0x2C1C($at)
    addiu       $s0, $s0, 0x1
    blez        $v0, .L8003772C
    addu        $a0, $zero, $zero
.L800376EC:
    lbu         $v1, 0x0($s0)
    sll         $v0, $a0, 24
    sra         $v0, $v0, 24
    addu        $v0, $s6, $v0
    sb          $v1, 0x0($v0)
    lbu         $v1, 0x10($sp)
    addiu       $v0, $a0, 0x1
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lb          $v1, 0x2C1C($at)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slt         $v0, $v0, $v1
    bnez        $v0, .L800376EC
    addiu       $s0, $s0, 0x1
.L8003772C:
    lui         $v0, 0x8009
    lhu         $v0, -0x751C($v0)
    xor         $v0, $v0, $s5
    sltiu       $v0, $v0, 0x1
    and         $v0, $v0, $s4
    beql        $v0, $zero, .L80037754
    addu        $a0, $s1, $zero
    jal         func_80037B38
    addiu       $a0, $sp, 0x10
    addu        $a0, $s1, $zero
.L80037754:
    jal         func_800E1B00
    addiu       $a1, $sp, 0x10
    jal         func_80037AFC
    addiu       $a0, $sp, 0x10
    andi        $v0, $s2, 0x80
    beqz        $v0, .L800376C8
    sb          $s2, 0x10($sp)
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    srl         $v1, $v1, 1
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80037680
    addu        $v1, $fp, $zero
    j .L800378B4
    nop
.L80037798:
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    sltu        $v0, $v1, $v0
    beqz        $v0, .L800378B0
    addu        $s3, $zero, $zero
    andi        $s4, $s7, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5040
    sll         $v0, $s4, 1
    addu        $v0, $v0, $s4
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s4
    sll         $v0, $v0, 3
    addu        $s6, $v0, $v1
    addu        $s5, $fp, $zero
    andi        $v0, $s3, 0xFFFF
.L800377DC:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s6
    lw          $s1, 0x0($v0)
    lw          $v1, 0x24($s1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x200
    sw          $v0, 0x14($v1)
    lhu         $v0, 0x28($s1)
    andi        $v0, $v0, 0x10
    bnel        $v0, $zero, .L80037818
    sb          $zero, 0x68($s1)
    jal         func_800E1C98
    addu        $a0, $s1, $zero
    j .L8003781C
    sb          $zero, 0x10($sp)
.L80037818:
    sb          $zero, 0x10($sp)
.L8003781C:
    addiu       $s0, $s2, 0x3
.L80037820:
    lbu         $v0, 0x0($s2)
    andi        $v0, $v0, 0x7F
    sb          $v0, 0x10($sp)
    lbu         $v0, -0x2($s0)
    sb          $v0, 0x11($sp)
    lbu         $v0, -0x1($s0)
    sb          $v0, 0x12($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x751C($v0)
    lbu         $v1, 0x0($s0)
    xor         $v0, $v0, $s4
    sltiu       $v0, $v0, 0x1
    and         $v0, $v0, $s5
    beqz        $v0, .L80037864
    sb          $v1, 0x13($sp)
    jal         func_80037B38
    addiu       $a0, $sp, 0x10
.L80037864:
    addu        $a0, $s1, $zero
    jal         func_800E1B00
    addiu       $a1, $sp, 0x10
    jal         func_80037AFC
    addiu       $a0, $sp, 0x10
    lbu         $v0, 0x0($s2)
    addiu       $s0, $s0, 0x4
    sb          $v0, 0x10($sp)
    andi        $v0, $v0, 0x80
    beqz        $v0, .L80037820
    addiu       $s2, $s2, 0x4
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    srl         $v1, $v1, 1
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800377DC
    andi        $v0, $s3, 0xFFFF
.L800378B0:
    addu        $v1, $fp, $zero
.L800378B4:
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800378E8
    andi        $v0, $s7, 0xFFFF
    lui         $v1, 0x8009
    lhu         $v1, -0x751C($v1)
    bne         $v1, $v0, .L800378E8
    nop
    sll         $s0, $s7, 16
    sra         $s0, $s0, 16
    jal         func_80037F08
    addu        $a0, $s0, $zero
    jal         func_800380D4
    addu        $a0, $s0, $zero
.L800378E8:
    lui         $v1, 0x8009
    lb          $v1, -0x49E8($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80037908
    nop
    sll         $a0, $s7, 16
    jal         func_80037DA4
    sra         $a0, $a0, 16
.L80037908:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L8003799C
    addu        $s3, $zero, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x7920($v1)
    addiu       $v0, $zero, 0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sb          $v0, 0x11($sp)
    sb          $v0, 0x10($sp)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $s0, $v0, $a0
    andi        $v0, $s3, 0xFFFF
.L8003795C:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a0, 0x0($v0)
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0x10
    bnel        $v0, $zero, .L80037984
    addiu       $s3, $s3, 0x1
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x10
    addiu       $s3, $s3, 0x1
.L80037984:
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L8003795C
    andi        $v0, $s3, 0xFFFF
    j .L80037AC8
    nop
.L8003799C:
    lui         $v1, 0x8009
    lhu         $v1, -0x751C($v1)
    addiu       $v0, $zero, 0x6
    sb          $v0, 0x11($sp)
    addiu       $v0, $zero, 0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sb          $v0, 0x10($sp)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $s0, $v0, $a0
    andi        $v0, $s3, 0xFFFF
.L800379E0:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a0, 0x0($v0)
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0x10
    bnel        $v0, $zero, .L80037A08
    addiu       $s3, $s3, 0x1
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x10
    addiu       $s3, $s3, 0x1
.L80037A08:
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L800379E0
    andi        $v0, $s3, 0xFFFF
    lui         $v1, 0x8009
    lhu         $v1, -0x7920($v1)
    addiu       $s3, $zero, 0x1
    addiu       $s4, $zero, 0x6
    addiu       $v0, $zero, 0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sb          $v0, 0x10($sp)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    addiu       $s1, $v1, 0x2
    sll         $s0, $v1, 1
    addu        $v0, $s0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $s2, $v0, $a0
    andi        $v1, $s3, 0xFFFF
.L80037A60:
    sltiu       $v0, $v1, 0x6
    bnez        $v0, .L80037A70
    subu        $v0, $s4, $v1
    addiu       $v0, $v1, -0x5
.L80037A70:
    .word       0x00510018  # mult        $v0, $s1
    .word       0x00001012  # mflo        $v0
    srl         $v1, $v0, 31
    addu        $v0, $v0, $v1
    sra         $v0, $v0, 1
    addu        $v0, $v0, $s0
    sb          $v0, 0x11($sp)
    andi        $v0, $s3, 0xFFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    lw          $a0, 0x0($v0)
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0x10
    bnel        $v0, $zero, .L80037AB8
    addiu       $s3, $s3, 0x1
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x10
    addiu       $s3, $s3, 0x1
.L80037AB8:
    andi        $v0, $s3, 0xFFFF
    sltiu       $v0, $v0, 0xB
    bnez        $v0, .L80037A60
    andi        $v1, $s3, 0xFFFF
.L80037AC8:
    lw          $ra, 0x4C($sp)
    lw          $fp, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end audio_voice_update
