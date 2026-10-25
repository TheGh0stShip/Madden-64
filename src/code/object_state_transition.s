.text
.align 2
.set noreorder
.globl object_state_transition
.ent object_state_transition
object_state_transition:
    addu        $s1, $a0, $zero
    sw          $ra, 0x44($sp)
    sw          $fp, 0x40($sp)
    sw          $s7, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $v0, 0x18C($s1)
    lw          $s5, 0x1B8($s1)
    sltiu       $s7, $v0, 0x1
    beqz        $s7, .L80059AC8
    addu        $a0, $zero, $zero
    lw          $v0, 0x190($s1)
    j .L80059AF4
    sltu        $a0, $zero, $v0
.L80059AC8:
    lw          $v1, 0x190($s1)
    slt         $v0, $v1, $v0
    bnel        $v0, $zero, .L80059AE4
    addiu       $a0, $zero, 0x1
    slti        $v0, $v1, 0x40
    beql        $v0, $zero, .L80059AE4
    addiu       $a0, $zero, 0x1
.L80059AE4:
    lw          $v1, 0x144($s1)
    addiu       $v0, $zero, 0x1
    bnel        $v1, $v0, .L80059AF4
    addiu       $a0, $zero, 0x1
.L80059AF4:
    lw          $v0, 0x194($s1)
    beqz        $v0, .L80059B0C
    addiu       $v0, $v0, -0x1
    lw          $v1, 0x198($s1)
    bnel        $v1, $v0, .L80059B0C
    addiu       $a0, $zero, 0x1
.L80059B0C:
    lw          $v0, 0x198($s1)
    slti        $v0, $v0, 0xE
    beql        $v0, $zero, .L80059B1C
    addiu       $a0, $zero, 0x1
.L80059B1C:
    beqz        $a0, .L80059B6C
    addiu       $v0, $zero, 0xE
    lw          $v1, 0x0($s1)
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x18C($s1)
    sw          $v0, 0x18($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x190($s1)
    sw          $v0, 0x1C($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x194($s1)
    sw          $v0, 0x20($v1)
    lw          $v1, 0x0($s1)
    lw          $v0, 0x198($s1)
    sw          $v0, 0x24($v1)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
.L80059B6C:
    lw          $v0, 0x144($s1)
    blez        $v0, .L80059C58
    addu        $s4, $zero, $zero
    addiu       $fp, $zero, 0x6F
    addu        $s6, $s1, $zero
.L80059B80:
    lw          $v0, 0x148($s6)
    lw          $s3, 0x4($v0)
    lw          $v1, 0xA0($s1)
    sll         $v0, $s3, 8
    bnez        $s7, .L80059BCC
    addu        $s2, $v1, $v0
    lw          $v0, 0x0($s2)
    bgez        $v0, .L80059BCC
    addu        $a0, $s1, $zero
    lw          $v0, 0x0($s1)
    sw          $fp, 0x14($v0)
    lw          $v0, 0x0($s1)
    sw          $s3, 0x18($v0)
    lw          $v0, 0x0($s1)
    sw          $zero, 0x1C($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addiu       $a1, $zero, -0x1
.L80059BCC:
    lw          $s0, 0x18C($s1)
    lw          $v0, 0x190($s1)
    slt         $v0, $v0, $s0
    bnez        $v0, .L80059C44
    sll         $v0, $s0, 2
    addu        $s2, $v0, $s2
.L80059BE4:
    lw          $v0, 0x0($s2)
    lw          $a0, 0x194($s1)
    nor         $v1, $zero, $v0
    sra         $v1, $v1, 31
    and         $v0, $v0, $v1
    beq         $a0, $v0, .L80059C28
    addu        $a0, $s1, $zero
    lw          $v0, 0x0($s1)
    sw          $fp, 0x14($v0)
    lw          $v0, 0x0($s1)
    sw          $s3, 0x18($v0)
    lw          $v0, 0x0($s1)
    sw          $s0, 0x1C($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x4($v0)
    jalr        $v0
    addiu       $a1, $zero, -0x1
.L80059C28:
    lw          $v0, 0x198($s1)
    sw          $v0, 0x0($s2)
    lw          $v0, 0x190($s1)
    addiu       $s0, $s0, 0x1
    slt         $v0, $v0, $s0
    beqz        $v0, .L80059BE4
    addiu       $s2, $s2, 0x4
.L80059C44:
    lw          $v0, 0x144($s1)
    addiu       $s4, $s4, 0x1
    slt         $v0, $s4, $v0
    bnez        $v0, .L80059B80
    addiu       $s6, $s6, 0x4
.L80059C58:
    lw          $v0, 0x194($s1)
    bnez        $v0, .L80059C8C
    nop
    beqz        $s7, .L80059C7C
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x6144
    j .L80059CB0
    sw          $v0, 0x4($s5)
.L80059C7C:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x5E74
    j .L80059CB0
    sw          $v0, 0x4($s5)
.L80059C8C:
    beqz        $s7, .L80059CA4
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x5BA4
    j .L80059CB0
    sw          $v0, 0x4($s5)
.L80059CA4:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x5A40
    sw          $v0, 0x4($s5)
.L80059CB0:
    lw          $v0, 0x144($s1)
    blez        $v0, .L80059DC8
    addu        $s4, $zero, $zero
    addiu       $s6, $zero, 0x31
    addu        $s3, $s5, $zero
    addu        $s2, $s1, $zero
.L80059CC8:
    lw          $a2, 0x148($s2)
    beqz        $s7, .L80059D44
    nop
    lw          $v0, 0x194($s1)
    bnel        $v0, $zero, .L80059DB0
    sw          $zero, 0x18($s3)
    lw          $s0, 0x14($a2)
    sltiu       $v0, $s0, 0x4
    beqz        $v0, .L80059D00
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s1
    lw          $v0, 0xB4($v0)
    bnez        $v0, .L80059D24
    addu        $a0, $s1, $zero
.L80059D00:
    lw          $v0, 0x0($s1)
    sw          $s6, 0x14($v0)
    lw          $v0, 0x0($s1)
    sw          $s0, 0x18($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    addu        $a0, $s1, $zero
.L80059D24:
    sll         $a2, $s0, 2
    addu        $v0, $a2, $s1
    lw          $a1, 0xB4($v0)
    addiu       $a2, $a2, 0x2C
    jal         func_80058F2C
    addu        $a2, $s5, $a2
    j .L80059DB0
    sw          $zero, 0x18($s3)
.L80059D44:
    lw          $s0, 0x18($a2)
    sltiu       $v0, $s0, 0x4
    beqz        $v0, .L80059D64
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s1
    lw          $v0, 0xC4($v0)
    bnez        $v0, .L80059D88
    addu        $a0, $s1, $zero
.L80059D64:
    lw          $v0, 0x0($s1)
    sw          $s6, 0x14($v0)
    lw          $v0, 0x0($s1)
    sw          $s0, 0x18($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    addu        $a0, $s1, $zero
.L80059D88:
    sll         $s0, $s0, 2
    addu        $v0, $s0, $s1
    lw          $a1, 0xC4($v0)
    addiu       $a2, $s0, 0x2C
    jal         func_80058F2C
    addu        $a2, $s5, $a2
    addu        $s0, $s0, $s5
    lw          $v0, 0x2C($s0)
    sw          $v0, 0x3C($s5)
    sw          $zero, 0x18($s3)
.L80059DB0:
    addiu       $s3, $s3, 0x4
    lw          $v0, 0x144($s1)
    addiu       $s4, $s4, 0x1
    slt         $v0, $s4, $v0
    bnez        $v0, .L80059CC8
    addiu       $s2, $s2, 0x4
.L80059DC8:
    sw          $zero, 0xC($s5)
    sw          $zero, 0x8($s5)
    sw          $zero, 0x10($s5)
    sw          $zero, 0x14($s5)
    lw          $v0, 0x114($s1)
    sw          $v0, 0x28($s5)
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end object_state_transition
