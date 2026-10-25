.text
.align 2
.set noreorder
.globl audio_stream_process
.ent audio_stream_process
audio_stream_process:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    sw          $s7, 0x2C($sp)
    addu        $s7, $a3, $zero
    sw          $s1, 0x14($sp)
    addiu       $s1, $a3, -0x1
    sw          $s6, 0x28($sp)
    sll         $s6, $a2, 16
    sw          $s4, 0x20($sp)
    ori         $s4, $zero, 0xFFFF
    sll         $a3, $a3, 16
    sra         $a3, $a3, 16
    sw          $s5, 0x24($sp)
    addiu       $s5, $a3, -0x1
    sw          $ra, 0x30($sp)
    sw          $s0, 0x10($sp)
.L8003C458:
    sll         $v0, $s1, 16
.L8003C45C:
    sra         $s0, $v0, 16
    sra         $a0, $s6, 16
    jal         func_8003C154
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    beql        $v0, $zero, .L8003C4FC
    addiu       $v0, $s1, -0x1
    beqz        $s2, .L8003C4F4
    addu        $a0, $zero, $zero
    addu        $a1, $s0, $zero
    sll         $v0, $a0, 16
.L8003C488:
    sra         $v1, $v0, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $s2
    lhu         $v0, 0x0($v0)
    beq         $v0, $s4, .L8003C4BC
    addiu       $v0, $a0, 0x1
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s3
    lbu         $v0, 0xD($v0)
    beq         $v0, $a1, .L8003C4D4
    addiu       $v0, $a0, 0x1
.L8003C4BC:
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L8003C488
    sll         $v0, $a0, 16
.L8003C4D4:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x37
    bnel        $v0, $v1, .L8003C4FC
    addiu       $v0, $s1, -0x1
    sll         $v0, $s1, 16
    j .L8003C5DC
    sra         $v0, $v0, 16
.L8003C4F4:
    j .L8003C5DC
    addu        $v0, $s0, $zero
.L8003C4FC:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    beql        $v0, $s5, .L8003C520
    addiu       $v0, $s1, -0x1
    blezl       $v0, .L8003C458
    addiu       $s1, $zero, 0x63
    j .L8003C45C
    sll         $v0, $s1, 16
.L8003C520:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    bgtz        $v0, .L8003C534
    addu        $a0, $zero, $zero
    addiu       $s1, $zero, 0x63
.L8003C534:
    ori         $a2, $zero, 0xFFFF
    sll         $v0, $s1, 16
    sra         $a1, $v0, 16
    sll         $v0, $a0, 16
.L8003C544:
    sra         $v1, $v0, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $s2
    lhu         $v0, 0x0($v0)
    beq         $v0, $a2, .L8003C578
    addiu       $v0, $a0, 0x1
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s3
    lbu         $v0, 0xD($v0)
    beq         $v0, $a1, .L8003C590
    addiu       $v0, $a0, 0x1
.L8003C578:
    addu        $a0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x37
    bnez        $v0, .L8003C544
    sll         $v0, $a0, 16
.L8003C590:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x37
    beq         $v0, $v1, .L8003C5D4
    addiu       $v0, $s1, -0x1
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    sll         $v0, $s7, 16
    sra         $v0, $v0, 16
    addiu       $v0, $v0, -0x1
    beq         $v1, $v0, .L8003C5DC
    nop
    bgtz        $v1, .L8003C534
    addu        $a0, $zero, $zero
    j .L8003C534
    addiu       $s1, $zero, 0x63
.L8003C5D4:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
.L8003C5DC:
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
.end audio_stream_process
