.text
.align 2
.set noreorder
.globl func_8006389C
.ent func_8006389C
func_8006389C:
    addiu       $sp, $sp, -0x38
    sw          $s4, 0x28($sp)
    addu        $s4, $a2, $zero
    lui         $v0, 0x3B9A
    ori         $v0, $v0, 0xC9F0
    sw          $s0, 0x18($sp)
    .word       0x0054001B  # divu        $zero, $v0, $s4
    bnez        $s4, .L800638C4
    nop
    break       7
.L800638C4:
    .word       0x00008012  # mflo        $s0
    sw          $s3, 0x24($sp)
    addu        $s3, $a0, $zero
    sw          $s6, 0x30($sp)
    addu        $s6, $a1, $zero
    sw          $s2, 0x20($sp)
    sw          $ra, 0x34($sp)
    sw          $s5, 0x2C($sp)
    sw          $s1, 0x1C($sp)
    lw          $s5, 0x4($s3)
    bgtz        $s0, .L80063910
    addu        $s2, $a3, $zero
    lw          $v1, 0x0($s3)
    addiu       $v0, $zero, 0x45
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s3)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L80063910:
    slt         $v0, $s0, $s2
    beqz        $v0, .L80063920
    addu        $s1, $s2, $zero
    addu        $s1, $s0, $zero
.L80063920:
    sw          $s1, 0x4C($s5)
    addu        $a0, $s3, $zero
    addu        $a1, $s6, $zero
    jal         func_800635DC
    sll         $a2, $s2, 2
    addu        $s0, $zero, $zero
    beqz        $s2, .L8006399C
    addu        $s5, $v0, $zero
    subu        $v1, $s2, $s0
.L80063944:
    sltu        $v0, $v1, $s1
    bnel        $v0, $zero, .L80063950
    addu        $s1, $v1, $zero
.L80063950:
    .word       0x02340018  # mult        $s1, $s4
    .word       0x00003012  # mflo        $a2
    addu        $a0, $s3, $zero
    jal         func_800637A4
    addu        $a1, $s6, $zero
    addu        $v1, $s1, $zero
    beqz        $v1, .L80063990
    addu        $a0, $v0, $zero
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s5
.L80063978:
    sw          $a0, 0x0($v0)
    addiu       $v0, $v0, 0x4
    addiu       $s0, $s0, 0x1
    addiu       $v1, $v1, -0x1
    bnez        $v1, .L80063978
    addu        $a0, $a0, $s4
.L80063990:
    sltu        $v0, $s0, $s2
    bnel        $v0, $zero, .L80063944
    subu        $v1, $s2, $s0
.L8006399C:
    addu        $v0, $s5, $zero
    lw          $ra, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8006389C
