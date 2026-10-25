.text
.align 2
.set noreorder
.globl func_8009DC40
.ent func_8009DC40
func_8009DC40:
    addiu       $sp, $sp, -0x140
    sw          $ra, 0x13C($sp)
    sw          $fp, 0x138($sp)
    sw          $s7, 0x134($sp)
    sw          $s6, 0x130($sp)
    sw          $s5, 0x12C($sp)
    sw          $s4, 0x128($sp)
    sw          $s3, 0x124($sp)
    sw          $s2, 0x120($sp)
    sw          $s1, 0x11C($sp)
    sw          $s0, 0x118($sp)
    sw          $a1, 0xF4($sp)
    sw          $a2, 0xFC($sp)
    lh          $v0, 0x4($a0)
    lh          $s4, 0x0($a0)
    lh          $v1, 0x6($a0)
    lh          $s5, 0x2($a0)
    addu        $a2, $v0, $zero
    addu        $s6, $s4, $v0
    addu        $a0, $v1, $zero
    slt         $v0, $v0, $v1
    beqz        $v0, .L8009DCA0
    addu        $s7, $s5, $v1
    addu        $a2, $a0, $zero
.L8009DCA0:
    lui         $a3, 0x6666
    ori         $a3, $a3, 0x6667
    addiu       $a0, $sp, 0xD0
    addiu       $a1, $sp, 0xE0
    addiu       $s3, $sp, 0x90
    addiu       $s2, $sp, 0x50
    addiu       $t0, $sp, 0x10
    sw          $t0, 0x114($sp)
    lw          $s1, 0x114($sp)
    sll         $a2, $a2, 16
    lui         $v1, 0x8009
    lhu         $v1, -0x4C2C($v1)
    sra         $v0, $a2, 16
    sra         $a2, $a2, 31
    .word       0x00470018  # mult        $v0, $a3
    sw          $s4, 0x10($sp)
    sw          $s5, 0x14($sp)
    sw          $s6, 0x20($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x30($sp)
    sw          $s7, 0x34($sp)
    sw          $s6, 0x40($sp)
    sw          $s7, 0x44($sp)
    sw          $zero, 0xD0($sp)
    sw          $zero, 0xD4($sp)
    sw          $zero, 0xD8($sp)
    sw          $v1, 0x18($sp)
    sw          $v1, 0x28($sp)
    sw          $v1, 0x38($sp)
    sw          $v1, 0x48($sp)
    .word       0x00004010  # mfhi        $t0
    sra         $s0, $t0, 3
    subu        $s0, $s0, $a2
    sll         $s0, $s0, 16
    jal         func_80099814
    sra         $s0, $s0, 16
    subu        $fp, $s4, $s0
    addu        $s6, $s6, $s0
    subu        $s4, $s5, $s0
    addu        $s0, $s7, $s0
.L8009DD40:
    addu        $a0, $s1, $zero
    jal         func_80099814
    addu        $a1, $s2, $zero
    addiu       $a0, $sp, 0xE0
    lw          $a3, 0xFC($sp)
    addu        $a1, $s2, $zero
    jal         func_800998F8
    addu        $a2, $s3, $zero
    beqz        $v0, .L8009DDE8
    addu        $a0, $s3, $zero
    jal         func_80099ABC
    addu        $a1, $s1, $zero
    lw          $a0, 0x0($s1)
    slt         $v0, $a0, $fp
    beqz        $v0, .L8009DD88
    addu        $a1, $s1, $zero
    j           func_80099674
    addu        $v1, $fp, $zero
.L8009DD88:
    slt         $v0, $s6, $a0
    bnez        $v0, .L8009DD98
    addu        $v1, $s6, $zero
    addu        $v1, $a0, $zero
.L8009DD98:
    sw          $v1, 0x0($a1)
    lw          $a0, 0x4($s1)
    slt         $v0, $a0, $s4
    beqz        $v0, .L8009DDB4
    addu        $a1, $s1, $zero
    j           func_800996A0
    addu        $v1, $s4, $zero
.L8009DDB4:
    slt         $v0, $s0, $a0
    bnez        $v0, .L8009DDC4
    addu        $v1, $s0, $zero
    addu        $v1, $a0, $zero
.L8009DDC4:
    addu        $a0, $s1, $zero
    sw          $v1, 0x4($a1)
    jal         func_80099814
    addu        $a1, $s2, $zero
    addiu       $a0, $sp, 0xE0
    lw          $a3, 0xFC($sp)
    addu        $a1, $s2, $zero
    jal         func_800998F8
    addu        $a2, $s3, $zero
.L8009DDE8:
    addiu       $s3, $s3, 0x10
    lw          $t0, 0x114($sp)
    addiu       $s1, $s1, 0x10
    addiu       $v0, $t0, 0x40
    slt         $v0, $s1, $v0
    bnez        $v0, .L8009DD40
    addiu       $s2, $s2, 0x10
    lw          $a0, 0xB0($sp)
    lw          $v1, 0xC0($sp)
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L8009DE18
    addu        $a0, $v1, $zero
.L8009DE18:
    lw          $v1, 0x90($sp)
    lw          $a1, 0xA0($sp)
    slt         $v0, $a1, $v1
    bnel        $v0, $zero, .L8009DE2C
    addu        $v1, $a1, $zero
.L8009DE2C:
    slt         $v0, $a0, $v1
    bnel        $v0, $zero, .L8009DE38
    addu        $v1, $a0, $zero
.L8009DE38:
    lw          $t0, 0xF4($sp)
    sh          $v1, 0x0($t0)
    lw          $a0, 0xB4($sp)
    lw          $v1, 0xC4($sp)
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L8009DE54
    addu        $a0, $v1, $zero
.L8009DE54:
    lw          $v1, 0x94($sp)
    lw          $a1, 0xA4($sp)
    slt         $v0, $a1, $v1
    bnel        $v0, $zero, .L8009DE68
    addu        $v1, $a1, $zero
.L8009DE68:
    slt         $v0, $a0, $v1
    bnel        $v0, $zero, .L8009DE74
    addu        $v1, $a0, $zero
.L8009DE74:
    lw          $t0, 0xF4($sp)
    sh          $v1, 0x2($t0)
    lw          $a0, 0xB0($sp)
    lw          $v1, 0xC0($sp)
    slt         $v0, $a0, $v1
    bnel        $v0, $zero, .L8009DE90
    addu        $a0, $v1, $zero
.L8009DE90:
    lw          $v1, 0x90($sp)
    lw          $a1, 0xA0($sp)
    slt         $v0, $v1, $a1
    bnel        $v0, $zero, .L8009DEA4
    addu        $v1, $a1, $zero
.L8009DEA4:
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L8009DEB0
    addu        $v1, $a0, $zero
.L8009DEB0:
    lw          $t0, 0xF4($sp)
    lhu         $v0, 0x0($t0)
    subu        $v0, $v1, $v0
    sh          $v0, 0x4($t0)
    lw          $a0, 0xB4($sp)
    lw          $v1, 0xC4($sp)
    slt         $v0, $a0, $v1
    bnel        $v0, $zero, .L8009DED4
    addu        $a0, $v1, $zero
.L8009DED4:
    lw          $v1, 0x94($sp)
    lw          $a1, 0xA4($sp)
    slt         $v0, $v1, $a1
    bnel        $v0, $zero, .L8009DEE8
    addu        $v1, $a1, $zero
.L8009DEE8:
    slt         $v0, $v1, $a0
    bnel        $v0, $zero, .L8009DEF4
    addu        $v1, $a0, $zero
.L8009DEF4:
    lw          $t0, 0xF4($sp)
    lhu         $v0, 0x2($t0)
    subu        $v0, $v1, $v0
    sh          $v0, 0x6($t0)
    lw          $ra, 0x13C($sp)
    lw          $fp, 0x138($sp)
    lw          $s7, 0x134($sp)
    lw          $s6, 0x130($sp)
    lw          $s5, 0x12C($sp)
    lw          $s4, 0x128($sp)
    lw          $s3, 0x124($sp)
    lw          $s2, 0x120($sp)
    lw          $s1, 0x11C($sp)
    lw          $s0, 0x118($sp)
    addiu       $sp, $sp, 0x140
    jr          $ra
    nop
.end func_8009DC40
