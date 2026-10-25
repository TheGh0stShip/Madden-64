.text
.align 2
.set noreorder
.globl resource_display_finalize
.ent resource_display_finalize
resource_display_finalize:
    addiu       $sp, $sp, -0x48
    sw          $s0, 0x30($sp)
    addu        $s0, $a0, $zero
    sw          $s3, 0x3C($sp)
    addu        $s3, $zero, $zero
    sw          $ra, 0x44($sp)
    sw          $s4, 0x40($sp)
    sw          $s2, 0x38($sp)
    sw          $s1, 0x34($sp)
    lbu         $v0, 0x0($s0)
    lw          $s2, 0xC($s0)
    addu        $s4, $zero, $zero
    andi        $v0, $v0, 0xE7
    sb          $v0, 0x0($s0)
    lw          $s1, 0x0($s2)
    lw          $a1, 0x8($s2)
    addiu       $a2, $zero, 0x1
    jal         func_80019944
    addu        $a0, $s1, $zero
    addu        $a0, $s1, $zero
    addiu       $a1, $s2, 0x4
    addiu       $a2, $zero, 0x4
    jal         func_80019868
    addiu       $a3, $zero, 0x1
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x20
    addiu       $a2, $zero, 0x2
    jal         func_80019868
    addu        $a3, $zero, $zero
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x22
    addiu       $a2, $zero, 0x2
    jal         func_80019868
    addu        $a3, $zero, $zero
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x18
    addiu       $a2, $zero, 0x8
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    addiu       $a0, $sp, 0x18
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0xA30
    jal         func_8002E148
    addiu       $a2, $zero, 0x8
    bnez        $v0, .L8001A2EC
    addiu       $a0, $sp, 0x18
    lbu         $v0, 0x0($s0)
    addiu       $s4, $zero, 0x8
    ori         $v0, $v0, 0x8
    sb          $v0, 0x0($s0)
.L8001A2EC:
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0xA3C
    jal         func_8002E148
    addiu       $a2, $zero, 0x8
    bnez        $v0, .L8001A314
    nop
    lbu         $v0, 0x0($s0)
    addiu       $s4, $zero, 0x10
    ori         $v0, $v0, 0x10
    sb          $v0, 0x0($s0)
.L8001A314:
    lhu         $v0, 0x22($sp)
    sw          $zero, 0x28($sp)
    beqz        $v0, .L8001A3FC
    sw          $zero, 0x2C($sp)
    addu        $a0, $s1, $zero
.L8001A328:
    addiu       $a1, $sp, 0x24
    addiu       $a2, $zero, 0x4
    jal         func_80019868
    addiu       $a3, $zero, 0x1
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x20
    addiu       $a2, $zero, 0x2
    jal         func_80019868
    addu        $a3, $zero, $zero
    lhu         $a0, 0x20($sp)
    jal         func_800199A0
    nop
    addu        $v1, $v0, $zero
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8001A380
    addu        $a0, $s1, $zero
    beqz        $v1, .L8001A3D0
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8001A3A0
    addiu       $v0, $sp, 0x2C
    j .L8001A3D0
    nop
.L8001A380:
    lhu         $a1, 0x20($sp)
    lw          $a3, 0x8($s0)
    jal         func_800199E4
    addiu       $a2, $sp, 0x28
    lbu         $v0, 0x0($s0)
    ori         $v0, $v0, 0x4
    j .L8001A3E4
    sb          $v0, 0x0($s0)
.L8001A3A0:
    lhu         $a1, 0x20($sp)
    lhu         $a2, 0xC($s2)
    lhu         $a3, 0xE($s2)
    sw          $v0, 0x10($sp)
    lw          $v0, 0x4($s0)
    addu        $a0, $s1, $zero
    jal         func_8001A14C
    sw          $v0, 0x14($sp)
    lbu         $v0, 0x0($s0)
    ori         $v0, $v0, 0x2
    j .L8001A3E4
    sb          $v0, 0x0($s0)
.L8001A3D0:
    lw          $a1, 0x24($sp)
    addu        $a0, $s1, $zero
    addu        $a2, $zero, $zero
    jal         func_80019944
    addiu       $a1, $a1, -0x6
.L8001A3E4:
    lhu         $v1, 0x22($sp)
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8001A328
    addu        $a0, $s1, $zero
.L8001A3FC:
    addu        $v0, $s4, $zero
    lw          $ra, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end resource_display_finalize
