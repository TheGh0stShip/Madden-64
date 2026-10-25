.text
.align 2
.set noreorder
.globl func_8009D57C
.ent func_8009D57C
func_8009D57C:
    addiu       $sp, $sp, -0x30
    sw          $s6, 0x28($sp)
    addu        $s6, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    addu        $a0, $zero, $zero
    sw          $ra, 0x2C($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x8($s6)
    addiu       $a2, $zero, 0x48
    addu        $a3, $zero, $zero
    jal         func_80033308
    addu        $a1, $s0, $zero
    lhu         $v1, 0x0($s3)
    addu        $s5, $s3, $zero
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8009D944
    sw          $v1, 0x0($s0)
    beqz        $v1, .L8009D5F4
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8009D98C
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L8009D700
    addiu       $v0, $zero, 0x1
    j           func_8009926C
    nop
.L8009D5F4:
    lhu         $v0, 0xE($s3)
    sh          $v0, 0x3A($s0)
    lhu         $v0, 0x2($s3)
    sw          $v0, 0x1C($s0)
    lhu         $v0, 0x4($s3)
    sw          $v0, 0x20($s0)
    lhu         $a0, 0x6($s3)
    lhu         $a1, 0x8($s3)
    jal         func_80035D7C
    nop
    addu        $v1, $v0, $zero
    lhu         $v0, 0x0($v1)
    addu        $a2, $v1, $v0
    lhu         $v0, 0x2($v1)
    lw          $a0, 0x0($a2)
    sw          $v0, 0x24($s0)
    lhu         $v0, 0x4($v1)
    lw          $v1, 0x1C($s0)
    sw          $v0, 0x28($s0)
    lhu         $v0, 0x4($a2)
    sh          $v0, 0x14($s0)
    lhu         $a1, 0x6($a2)
    addu        $s4, $a2, $a0
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x34($s0)
    lw          $v0, 0x20($s0)
    sra         $v1, $v1, 1
    negu        $v1, $v1
    sh          $v1, 0x2C($s0)
    sra         $v0, $v0, 1
    negu        $v0, $v0
    sh          $v0, 0x2E($s0)
    sh          $a1, 0x16($s0)
    lhu         $v0, 0x4($s4)
    sh          $v0, 0x38($s0)
    lw          $v0, 0x0($a2)
    addiu       $s1, $a2, 0x8
    addu        $a0, $zero, $zero
    addiu       $s2, $v0, -0x8
    jal         func_80032E00
    addu        $a1, $s2, $zero
    addu        $a0, $v0, $zero
    addu        $a1, $s1, $zero
    addu        $a2, $s2, $zero
    jal         func_8002E17C
    sw          $a0, 0xC($s0)
    lhu         $v0, 0x0($s4)
    addiu       $s2, $v0, -0x6
    beqz        $s2, .L8009D6D8
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $s2, $zero
    sw          $v0, 0x10($s0)
    addu        $a0, $v0, $zero
    addiu       $a1, $s4, 0x6
    jal         func_8002E17C
    addu        $a2, $s2, $zero
.L8009D6D8:
    lhu         $a0, 0x6($s3)
    lhu         $a1, 0x8($s3)
    jal         func_80035F88
    nop
    lhu         $v0, 0x3A($s0)
    andi        $v0, $v0, 0x8000
    beqz        $v0, .L8009D90C
    nop
    j           func_800991D0
    nop
.L8009D700:
    lhu         $v0, 0xE($s3)
    sh          $v0, 0x3A($s0)
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L8009D728
    nop
    lw          $a0, 0x10($s3)
    jal         func_8009A440
    addu        $a1, $s0, $zero
    j           func_800990F0
    nop
.L8009D728:
    lhu         $v0, 0x2($s3)
    sw          $v0, 0x1C($s0)
    lhu         $v0, 0x4($s3)
    sw          $v0, 0x20($s0)
    lhu         $a0, 0x6($s3)
    lhu         $a1, 0x8($s3)
    jal         func_80035D7C
    nop
    addu        $v1, $v0, $zero
    lhu         $v0, 0x0($v1)
    addu        $a2, $v1, $v0
    lhu         $v0, 0x2($v1)
    lw          $a0, 0x0($a2)
    sw          $v0, 0x24($s0)
    lhu         $v0, 0x4($v1)
    lw          $v1, 0x1C($s0)
    sw          $v0, 0x28($s0)
    lhu         $v0, 0x4($a2)
    sh          $v0, 0x14($s0)
    lhu         $a1, 0x6($a2)
    addu        $s4, $a2, $a0
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x34($s0)
    lw          $v0, 0x20($s0)
    sra         $v1, $v1, 1
    negu        $v1, $v1
    sh          $v1, 0x2C($s0)
    sra         $v0, $v0, 1
    negu        $v0, $v0
    sh          $v0, 0x2E($s0)
    sh          $a1, 0x16($s0)
    lhu         $v0, 0x4($s4)
    sh          $v0, 0x38($s0)
    lw          $v0, 0x0($a2)
    addiu       $s1, $a2, 0x8
    addu        $a0, $zero, $zero
    addiu       $s2, $v0, -0x8
    jal         func_80032E00
    addu        $a1, $s2, $zero
    addu        $a0, $v0, $zero
    addu        $a1, $s1, $zero
    addu        $a2, $s2, $zero
    jal         func_8002E17C
    sw          $a0, 0xC($s0)
    lhu         $v0, 0x0($s4)
    addiu       $s2, $v0, -0x6
    beqz        $s2, .L8009D804
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $s2, $zero
    sw          $v0, 0x10($s0)
    addu        $a0, $v0, $zero
    addiu       $a1, $s4, 0x6
    jal         func_8002E17C
    addu        $a2, $s2, $zero
.L8009D804:
    lhu         $a0, 0x6($s3)
    lhu         $a1, 0x8($s3)
    jal         func_80035F88
    nop
    lw          $v0, 0x0($s0)
    addiu       $v1, $zero, 0x4
    sh          $v1, 0x36($s0)
    addiu       $v1, $zero, 0x3
    bne         $v0, $v1, .L8009D8B4
    addiu       $s2, $zero, 0x40
    lhu         $v0, 0x14($s5)
    sh          $v0, 0x40($s0)
    lhu         $v0, 0x3A($s0)
    lhu         $v1, 0x16($s5)
    addiu       $s2, $zero, 0x80
    andi        $v0, $v0, 0x1000
    beqz        $v0, .L8009D878
    sh          $v1, 0x42($s0)
    lhu         $v0, 0x14($s0)
    srl         $v1, $v0, 1
    beqz        $v1, .L8009D878
    nop
.L8009D85C:
    lhu         $v0, 0x3C($s0)
    srl         $v1, $v1, 1
    addiu       $v0, $v0, 0x1
    sh          $v0, 0x3C($s0)
    andi        $v0, $v1, 0xFFFF
    bnez        $v0, .L8009D85C
    nop
.L8009D878:
    lhu         $v0, 0x3A($s0)
    andi        $v0, $v0, 0x800
    beqz        $v0, .L8009D8B8
    addu        $a0, $zero, $zero
    lhu         $v0, 0x16($s0)
    srl         $v1, $v0, 1
    beqz        $v1, .L8009D8B8
    nop
.L8009D898:
    lhu         $v0, 0x3E($s0)
    srl         $v1, $v1, 1
    addiu       $v0, $v0, 0x1
    sh          $v0, 0x3E($s0)
    andi        $v0, $v1, 0xFFFF
    bnez        $v0, .L8009D898
    nop
.L8009D8B4:
    addu        $a0, $zero, $zero
.L8009D8B8:
    jal         func_80032E00
    addu        $a1, $s2, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s2, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0x4($s0)
    lw          $v0, 0x4($s0)
    lhu         $v1, 0x3A($s0)
    srl         $s2, $s2, 1
    addu        $v0, $v0, $s2
    andi        $v1, $v1, 0x8000
    beqz        $v1, .L8009D90C
    sw          $v0, 0x8($s0)
    lhu         $v0, 0x2E($s0)
    lw          $v1, 0x20($s0)
    negu        $v0, $v0
    negu        $v1, $v1
    sh          $v0, 0x2E($s0)
    sw          $v1, 0x20($s0)
.L8009D90C:
    lhu         $v0, 0x3A($s0)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L8009D934
    nop
    lhu         $v0, 0x2C($s0)
    lw          $v1, 0x1C($s0)
    negu        $v0, $v0
    negu        $v1, $v1
    sh          $v0, 0x2C($s0)
    sw          $v1, 0x1C($s0)
.L8009D934:
    jal         func_80098178
    addu        $a0, $s0, $zero
    j           func_8009926C
    addiu       $v0, $zero, 0x1
.L8009D944:
    lhu         $a0, 0x6($s5)
    lhu         $a1, 0x8($s5)
    jal         func_80035598
    nop
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $v0, $zero
    sw          $v0, 0xC($s0)
    addiu       $v0, $zero, 0x17D
    sw          $v0, 0x8($s0)
    lui         $v0, 0x8006
    addiu       $v0, $v0, 0x56E0
    sw          $v0, 0x4($s0)
    lhu         $a0, 0x6($s5)
    lhu         $a1, 0x8($s5)
    lw          $a2, 0xC($s0)
    jal         func_80036268
    nop
.L8009D98C:
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x14($s6)
    sw          $zero, 0x18($s6)
    sw          $zero, 0x24($s6)
    sw          $zero, 0x20($s6)
    sw          $zero, 0x1C($s6)
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009D57C
