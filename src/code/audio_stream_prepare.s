.text
.align 2
.set noreorder
.globl audio_stream_prepare
.ent audio_stream_prepare
audio_stream_prepare:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s0, 0x10($sp)
    lbu         $a0, 0x1E($s1)
    addu        $s3, $a1, $zero
    andi        $a1, $s3, 0xFFFF
    addu        $v0, $a2, $zero
    addiu       $a2, $v0, 0x15
    andi        $a2, $a2, 0xFFFF
    jal         func_80022B3C
    addu        $s2, $v0, $zero
    addu        $s0, $v0, $zero
    andi        $v1, $s2, 0xFFFF
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L8003BDF0
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L8003BE20
    nop
    lbu         $a0, 0x1C($s1)
    lbu         $a1, 0x20($s1)
    jal         func_8003BEE4
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L8003BE20
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    bltzl       $v0, .L8003BDE8
    addiu       $v0, $v0, 0x3
.L8003BDE8:
    j .L8003BE20
    srl         $s0, $v0, 2
.L8003BDF0:
    lbu         $a0, 0x1C($s1)
    lbu         $a1, 0x20($s1)
    jal         func_8003BEE4
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L8003BE20
    sll         $v0, $s0, 16
    sra         $v0, $v0, 16
    bltzl       $v0, .L8003BE18
    addiu       $v0, $v0, 0x3
.L8003BE18:
    sra         $v0, $v0, 2
    subu        $s0, $s0, $v0
.L8003BE20:
    lbu         $a0, 0x1E($s1)
    jal         func_8003BF54
    xori        $a0, $a0, 0x1
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    beqz        $v1, .L8003BE4C
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8003BE84
    lui         $v1, 0x5555
    j .L8003BEA8
    addu        $a0, $s1, $zero
.L8003BE4C:
    lbu         $v1, 0x1E($s1)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    bne         $v1, $v0, .L8003BEA8
    addu        $a0, $s1, $zero
    lui         $v1, 0x5555
    ori         $v1, $v1, 0x5556
    sll         $v0, $s0, 16
    sra         $v0, $v0, 15
    .word       0x00430018  # mult        $v0, $v1
    sra         $v0, $v0, 31
    .word       0x00004010  # mfhi        $t0
    j .L8003BEA8
    subu        $s0, $t0, $v0
.L8003BE84:
    ori         $v1, $v1, 0x5556
    sll         $v0, $s0, 16
    sra         $v0, $v0, 15
    .word       0x00430018  # mult        $v0, $v1
    sra         $v0, $v0, 31
    .word       0x00004010  # mfhi        $t0
    subu        $v0, $t0, $v0
    addiu       $s0, $v0, 0x55
    addu        $a0, $s1, $zero
.L8003BEA8:
    andi        $a1, $s3, 0xFFFF
    andi        $a2, $s2, 0xFFFF
    sll         $a3, $s0, 16
    jal         func_8003BF9C
    sra         $a3, $a3, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end audio_stream_prepare
