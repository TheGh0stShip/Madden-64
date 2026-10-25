.text
.align 2
.set noreorder
.globl func_8002F46C
.ent func_8002F46C
func_8002F46C:
    addiu       $sp, $sp, -0x30
    sw          $s4, 0x20($sp)
    lui         $s4, 0x8008
    lh          $s4, 0x4F6C($s4)
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $zero, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $s5, 0x24($sp)
    addiu       $s5, $zero, 0x1
    sw          $ra, 0x28($sp)
    sw          $s0, 0x10($sp)
.L8002F4A4:
    lui         $a0, 0x8008
    lh          $a0, 0x4F6C($a0)
    jal         func_800E154C
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L8002F514
    nop
    jal         func_800E1B0C
    nop
    jal         func_800AD9B8
    andi        $a0, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    bne         $v0, $s5, .L8002F50C
    addu        $a0, $zero, $zero
    jal         func_800E1690
    addu        $a1, $zero, $zero
    sll         $v0, $v0, 16
    bnez        $v0, .L8002F504
    ori         $a0, $zero, 0x86D0
    jal         func_800E1E40
    addiu       $s3, $zero, 0x1
    j .L8002F56C
    addu        $v0, $s3, $zero
.L8002F504:
    jal         func_800E1FCC
    addu        $a1, $zero, $zero
.L8002F50C:
    jal         func_800E1E40
    nop
.L8002F514:
    lui         $s0, 0x8008
    lhu         $s0, 0x4F6C($s0)
    jal         func_800E1418
    addu        $a0, $zero, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x4F6C($v1)
    sll         $s0, $s0, 16
    sra         $s0, $s0, 16
    beq         $s0, $v1, .L8002F55C
    addiu       $s1, $s1, 0x1
    xor         $v1, $v1, $s4
    sltiu       $v1, $v1, 0x1
    andi        $v0, $s1, 0xFF
    sltiu       $v0, $v0, 0x4
    xori        $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L8002F564
    addu        $v0, $s2, $zero
.L8002F55C:
    addiu       $s2, $zero, 0x1
    addu        $v0, $s2, $zero
.L8002F564:
    beqz        $v0, .L8002F4A4
    addu        $v0, $s3, $zero
.L8002F56C:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8002F46C
