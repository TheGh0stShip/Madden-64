.text
.align 2
.set noreorder
.globl resource_display_commit
.ent resource_display_commit
resource_display_commit:
    addiu       $sp, $sp, -0x40
    sw          $s4, 0x28($sp)
    lw          $s4, 0x50($sp)
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $s3, 0x24($sp)
    addu        $s3, $zero, $zero
    sw          $s1, 0x1C($sp)
    addu        $s1, $a3, $zero
    sw          $s6, 0x30($sp)
    addu        $s6, $a2, $zero
    andi        $v0, $s6, 0xFFFF
    sw          $ra, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s5, 0x2C($sp)
    beqz        $v0, .L8001A11C
    sw          $s0, 0x18($sp)
    andi        $s5, $a1, 0xFFFF
    sltu        $s7, $zero, $s5
    addu        $a0, $s2, $zero
.L8001A024:
    addiu       $a1, $sp, 0x10
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    beqz        $s7, .L8001A104
    addu        $s0, $zero, $zero
    addu        $a0, $s2, $zero
.L8001A040:
    addiu       $a1, $sp, 0x11
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lb          $a2, 0x11($sp)
    blez        $a2, .L8001A0BC
    addu        $a0, $s2, $zero
    addiu       $a1, $sp, 0x12
    addiu       $a2, $zero, 0x1
    jal         func_80019868
    addiu       $a3, $zero, 0x2
    lb          $v0, 0x11($sp)
    blez        $v0, .L8001A0F4
    addu        $a0, $zero, $zero
.L8001A078:
    lw          $v0, 0x0($s1)
    lbu         $v1, 0x12($sp)
    addu        $v0, $s4, $v0
    sb          $v1, 0x0($v0)
    lw          $v1, 0x0($s1)
    addiu       $v0, $a0, 0x1
    addu        $a0, $v0, $zero
    addiu       $v1, $v1, 0x1
    sw          $v1, 0x0($s1)
    lb          $v1, 0x11($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    slt         $v0, $v0, $v1
    bnez        $v0, .L8001A078
    addiu       $s0, $s0, 0x1
    j .L8001A0F8
    andi        $v0, $s0, 0xFFFF
.L8001A0BC:
    lw          $a1, 0x0($s1)
    negu        $a2, $a2
    andi        $a2, $a2, 0xFFFF
    addiu       $a3, $zero, 0x2
    jal         func_80019868
    addu        $a1, $s4, $a1
    lb          $v1, 0x11($sp)
    lw          $v0, 0x0($s1)
    subu        $v0, $v0, $v1
    sw          $v0, 0x0($s1)
    lbu         $v0, 0x11($sp)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    subu        $s0, $s0, $v0
.L8001A0F4:
    andi        $v0, $s0, 0xFFFF
.L8001A0F8:
    sltu        $v0, $v0, $s5
    bnez        $v0, .L8001A040
    addu        $a0, $s2, $zero
.L8001A104:
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    andi        $v1, $s6, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8001A024
    addu        $a0, $s2, $zero
.L8001A11C:
    lw          $ra, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end resource_display_commit
