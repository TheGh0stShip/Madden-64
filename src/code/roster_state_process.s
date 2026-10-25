.text
.align 2
.set noreorder
.globl roster_state_process
.ent roster_state_process
roster_state_process:
    lui         $v0, 0x8007
    lhu         $v0, -0x4628($v0)
    addiu       $sp, $sp, -0x28
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    bnez        $v0, .L80024DFC
    sw          $s0, 0x10($sp)
    andi        $a0, $a0, 0xFFFF
    ori         $v0, $zero, 0xFFFF
    bne         $a0, $v0, .L80024D70
    addu        $a2, $zero, $zero
    lui         $v0, 0x8008
    lhu         $v0, 0xCFC($v0)
    j .L80024E78
    nop
.L80024D70:
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0xCFC
    ori         $t0, $zero, 0xFFFF
    addu        $t1, $a3, $zero
    addiu       $v1, $a3, 0x214C
.L80024D84:
    andi        $a1, $a2, 0xFFFF
    sltiu       $v0, $a1, 0x37
    beqz        $v0, .L80024DA8
    nop
    sll         $v0, $a1, 1
    addu        $v0, $v0, $a3
    lhu         $v0, 0x0($v0)
    bne         $v0, $t0, .L80024DBC
    nop
.L80024DA8:
    bne         $a3, $t1, .L80024E74
    ori         $s1, $zero, 0xFFFF
    addiu       $a3, $a3, 0x214C
    j .L80024D84
    addu        $a2, $zero, $zero
.L80024DBC:
    bne         $v0, $a0, .L80024D84
    addiu       $a2, $a2, 0x1
    andi        $a0, $a2, 0xFFFF
    sltiu       $v0, $a0, 0x37
    beqz        $v0, .L80024DE8
    nop
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a3
    lhu         $v0, 0x0($v0)
    bne         $v0, $t0, .L80024E74
    addu        $s1, $v0, $zero
.L80024DE8:
    beq         $a3, $v1, .L80024E74
    ori         $s1, $zero, 0xFFFF
    lhu         $s1, 0x0($v1)
    j .L80024E78
    andi        $v0, $s1, 0xFFFF
.L80024DFC:
    andi        $a0, $a0, 0xFFFF
    ori         $v0, $zero, 0xFFFF
    beq         $a0, $v0, .L80024E18
    addu        $s1, $zero, $zero
    jal         func_80024C9C
    nop
    addu        $s1, $v0, $zero
.L80024E18:
    andi        $v1, $s1, 0xFFFF
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L80024E78
    andi        $v0, $s1, 0xFFFF
    addiu       $s4, $zero, 0xFF
    ori         $s3, $zero, 0xFFFF
    andi        $s0, $s1, 0xFFFF
.L80024E34:
    jal         func_80024B90
    addu        $a0, $s0, $zero
    andi        $s2, $v0, 0xFF
    bne         $s2, $s4, .L80024E78
    andi        $v0, $s1, 0xFFFF
    jal         func_80024BD4
    addu        $a0, $s0, $zero
    andi        $v0, $v0, 0xFF
    bne         $v0, $s2, .L80024E78
    andi        $v0, $s1, 0xFFFF
    jal         func_80024C9C
    addu        $a0, $s0, $zero
    addu        $s1, $v0, $zero
    andi        $v0, $s1, 0xFFFF
    bnel        $v0, $s3, .L80024E34
    andi        $s0, $s1, 0xFFFF
.L80024E74:
    andi        $v0, $s1, 0xFFFF
.L80024E78:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end roster_state_process
