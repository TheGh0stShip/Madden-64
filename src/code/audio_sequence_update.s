.text
.align 2
.set noreorder
.globl audio_sequence_update
.ent audio_sequence_update
audio_sequence_update:
    lui         $v0, 0x8007
    lh          $v0, 0x40CC($v0)
    addiu       $sp, $sp, -0x38
    sw          $ra, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    beqz        $v0, .L8003F920
    sw          $s0, 0x28($sp)
    lui         $a1, 0x8008
    lb          $a1, 0x7AFC($a1)
    lui         $v1, 0x8008
    lb          $v1, 0x76F4($v1)
    lui         $a0, 0x8009
    lbu         $a0, -0x49D8($a0)
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x330C
    sw          $v0, 0x10($sp)
    sll         $a0, $a0, 24
    sra         $v0, $a0, 24
    sw          $v1, 0x18($sp)
    sll         $v1, $v1, 2
    sw          $v0, 0x1C($sp)
    sll         $v0, $a1, 5
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a1
    sll         $t0, $v0, 2
    addu        $v1, $v1, $t0
    sw          $a1, 0x14($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v0, 0x2D86($at)
    sltiu       $v0, $v0, 0x1E
    beqz        $v0, .L8003F764
    addiu       $v0, $zero, 0xAF
    addiu       $a0, $sp, 0x10
    jal         func_800AE924
    sh          $v0, 0x20($sp)
    lui         $at, 0x8009
    sb          $zero, -0x7B7C($at)
    j .L8003F7F8
    nop
.L8003F764:
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sb          $v0, -0x7B7C($at)
    addu        $a2, $zero, $zero
    addu        $a3, $a1, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x1860
    addu        $a1, $t0, $v0
.L8003F784:
    lh          $v1, 0x0($a1)
    sra         $v0, $a0, 24
    beq         $v0, $v1, .L8003F7A4
    nop
    addiu       $a2, $a2, 0x1
    sltiu       $v0, $a2, 0xB
    bnez        $v0, .L8003F784
    addiu       $a1, $a1, 0x2
.L8003F7A4:
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5040
    sll         $v0, $a3, 1
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a3
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sll         $v1, $a2, 2
    addu        $v1, $v1, $v0
    lw          $a1, 0x0($v1)
    jal         func_800A1B40
    addiu       $a0, $zero, 0x1
    addiu       $v1, $zero, 0x1
    bne         $v0, $v1, .L8003F7EC
    addiu       $v0, $zero, 0xAF
    j .L8003F7F0
    sh          $zero, 0x20($sp)
.L8003F7EC:
    sh          $v0, 0x20($sp)
.L8003F7F0:
    jal         func_800AE924
    addiu       $a0, $sp, 0x10
.L8003F7F8:
    lui         $v1, 0x8008
    lb          $v1, 0x7AFC($v1)
    lui         $a1, 0x8008
    lh          $a1, 0x79B0($a1)
    lui         $a2, 0x8009
    lb          $a2, -0x49D8($a2)
    addiu       $a0, $sp, 0x10
    lui         $v0, 0x800B
    addiu       $v0, $v0, -0x340C
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0xAF
    sh          $v0, 0x20($sp)
    sw          $v1, 0x14($sp)
    sw          $a1, 0x18($sp)
    jal         func_800AE924
    sw          $a2, 0x1C($sp)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L8003F910
    addiu       $a0, $zero, 0x19
    lui         $v0, 0x8008
    lh          $v0, 0x76DC($v0)
    xori        $v1, $v0, 0x2
    sltiu       $v1, $v1, 0x1
    xori        $v0, $v0, 0x4
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L8003F8F0
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v1, $v0, 0x79
    sltu        $v0, $zero, $v0
    and         $v1, $v1, $v0
    beqz        $v1, .L8003F8F0
    nop
    lui         $a0, 0x8008
    lb          $a0, 0x7AFC($a0)
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, 0x2D96($at)
    beqz        $v0, .L8003F8E8
    nop
    jal         func_8009EB14
    nop
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x7702($at)
    j .L8003F8F0
    nop
.L8003F8E8:
    jal         func_8009BD04
    addiu       $a0, $zero, 0x2
.L8003F8F0:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L8003F910
    addiu       $a0, $zero, 0x19
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    addiu       $a0, $zero, 0x19
.L8003F910:
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    j .L8003FA1C
    nop
.L8003F920:
    ori         $s2, $zero, 0xFFFF
    addiu       $s1, $zero, 0xE0
    addu        $s0, $zero, $zero
.L8003F92C:
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lhu         $v0, 0x2D84($at)
    beq         $v0, $s2, .L8003F99C
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v0, 0x2D87($at)
    bne         $v0, $s1, .L8003F99C
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2E
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v1, 0x2D86($at)
    andi        $v0, $v0, 0xFFFF
    sltu        $v1, $v1, $v0
    beqz        $v1, .L8003F99C
    nop
    jal         func_80031964
    nop
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L8003F99C
    nop
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x2D84
    jal         func_8003F230
    addu        $a0, $s0, $a0
.L8003F99C:
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lhu         $v0, 0x4ED0($at)
    beql        $v0, $s2, .L8003FA10
    addiu       $s0, $s0, 0x4
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v0, 0x4ED3($at)
    bnel        $v0, $s1, .L8003FA10
    addiu       $s0, $s0, 0x4
    jal         func_80031A1C
    addiu       $a0, $zero, 0x2E
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $v1, 0x4ED2($at)
    andi        $v0, $v0, 0xFFFF
    sltu        $v1, $v1, $v0
    beql        $v1, $zero, .L8003FA10
    addiu       $s0, $s0, 0x4
    jal         func_80031964
    nop
    andi        $v0, $v0, 0xC0
    bnel        $v0, $zero, .L8003FA10
    addiu       $s0, $s0, 0x4
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x4ED0
    jal         func_8003F230
    addu        $a0, $s0, $a0
    addiu       $s0, $s0, 0x4
.L8003FA10:
    sltiu       $v0, $s0, 0x10
    bnez        $v0, .L8003F92C
    nop
.L8003FA1C:
    lui         $at, 0x8007
    sh          $zero, 0x40CC($at)
    lw          $ra, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end audio_sequence_update
