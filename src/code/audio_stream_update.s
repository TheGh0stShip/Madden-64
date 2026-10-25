.text
.align 2
.set noreorder
.globl audio_stream_update
.ent audio_stream_update
audio_stream_update:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    sw          $s7, 0x2C($sp)
    addu        $s7, $a3, $zero
    sw          $s1, 0x14($sp)
    addiu       $s1, $a3, 0x1
    sw          $s6, 0x28($sp)
    sll         $s6, $a2, 16
    sw          $s4, 0x20($sp)
    ori         $s4, $zero, 0xFFFF
    sll         $a3, $a3, 16
    sra         $a3, $a3, 16
    sw          $s5, 0x24($sp)
    addiu       $s5, $a3, 0x1
    sw          $ra, 0x30($sp)
    sw          $s0, 0x10($sp)
    sll         $v0, $s1, 16
.L8003C248:
    sra         $s0, $v0, 16
    sra         $a0, $s6, 16
    jal         func_8003C154
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L8003C2E4
    addiu       $v0, $s1, 0x1
    beqz        $s2, .L8003C2DC
    addu        $a0, $zero, $zero
    addu        $a1, $s0, $zero
    sll         $v0, $a0, 16
.L8003C274:
    sra         $v1, $v0, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $s2
    lhu         $v0, 0x0($v0)
    beq         $v0, $s4, .L8003C2A8
    addiu       $v0, $a0, 0x1
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s3
    lbu         $v0, 0xD($v0)
    beq         $v0, $a1, .L8003C2C0
    addiu       $v0, $a0, 0x1
.L8003C2A8:
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L8003C274
    sll         $v0, $a0, 16
.L8003C2C0:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x37
    bnel        $v0, $v1, .L8003C2E4
    addiu       $v0, $s1, 0x1
    j .L8003C3AC
    sll         $v0, $s1, 16
.L8003C2DC:
    j .L8003C3DC
    addu        $v0, $s0, $zero
.L8003C2E4:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x64
    beql        $v0, $zero, .L8003C2FC
    addiu       $s1, $zero, 0x1
.L8003C2FC:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    bne         $v0, $s5, .L8003C248
    sll         $v0, $s1, 16
    addiu       $v0, $s1, 0x1
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x64
    beql        $v0, $zero, .L8003C328
    addiu       $s1, $zero, 0x1
.L8003C328:
    ori         $a2, $zero, 0xFFFF
    addiu       $t0, $zero, 0x37
    sll         $v0, $s7, 16
    sra         $v0, $v0, 16
    addiu       $a3, $v0, 0x1
    addu        $a0, $zero, $zero
.L8003C340:
    sll         $v0, $s1, 16
    sra         $a1, $v0, 16
    sll         $v0, $a0, 16
.L8003C34C:
    sra         $v1, $v0, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $s2
    lhu         $v0, 0x0($v0)
    beq         $v0, $a2, .L8003C380
    addiu       $v0, $a0, 0x1
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s3
    lbu         $v0, 0xD($v0)
    beq         $v0, $a1, .L8003C398
    addiu       $v0, $a0, 0x1
.L8003C380:
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L8003C34C
    sll         $v0, $a0, 16
.L8003C398:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    bne         $v0, $t0, .L8003C3B4
    addiu       $v0, $s1, 0x1
    sll         $v0, $s1, 16
.L8003C3AC:
    j .L8003C3DC
    sra         $v0, $v0, 16
.L8003C3B4:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x64
    beql        $v0, $zero, .L8003C3CC
    addiu       $s1, $zero, 0x1
.L8003C3CC:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    bne         $v0, $a3, .L8003C340
    addu        $a0, $zero, $zero
.L8003C3DC:
    lw          $ra, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end audio_stream_update
