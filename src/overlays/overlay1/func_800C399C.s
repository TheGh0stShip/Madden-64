.text
.align 2
.set noreorder
.globl func_800C399C
.ent func_800C399C
func_800C399C:
    addiu       $sp, $sp, -0x40
    sw          $ra, 0x38($sp)
    sw          $s7, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lui         $at, 0x8008
    sh          $a0, 0x50F0($at)
    lui         $at, 0x8008
    sw          $zero, 0x5100($at)
    jal         func_8000F31C
    nop
    lui         $v1, 0x8008
    lbu         $v1, 0x7A6A($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800C3A00
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x50F2($at)
    j           func_800BF2E4
    nop
.L800C3A00:
    lui         $at, 0x8008
    sh          $zero, 0x50F2($at)
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0x8
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x50F4
    addiu       $s1, $s2, -0x4
    addu        $a2, $s1, $zero
    addiu       $v0, $zero, 0x8
    jal         func_8000D740
    sh          $v0, 0x0($s2)
    addu        $s6, $v0, $zero
    addu        $a0, $s6, $zero
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x49E0
    jal         func_8000EB8C
    sw          $s6, 0x0($s0)
    addu        $a0, $s6, $zero
    jal         func_8000F324
    addiu       $a1, $zero, 0x95
    lui         $s4, 0x800C
    addiu       $s4, $s4, -0x9BC
    sw          $s4, 0xC($s6)
    lw          $a0, 0x0($s0)
    jal         func_800B95D8
    addiu       $s5, $zero, 0x12C
    jal         func_8000EC58
    addu        $a0, $s6, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lw          $v1, 0x14($s6)
    lw          $a3, 0x48($s6)
    addiu       $a1, $zero, 0x8
    lui         $v0, 0x3EA
    addiu       $s3, $zero, 0x64
    addiu       $s0, $zero, 0x3
    sw          $zero, 0x1C($s6)
    sw          $zero, 0x24($s6)
    sw          $v0, 0x20($s6)
    sh          $s5, 0x3C($s6)
    sh          $s3, 0x3E($s6)
    sw          $zero, 0x2C($s6)
    sw          $zero, 0x30($s6)
    sw          $zero, 0x34($s6)
    ori         $v1, $v1, 0x201
    sw          $v1, 0x14($s6)
    sh          $s0, 0x16($a3)
    lui         $at, 0x8008
    sw          $s6, 0x5100($at)
    jal         func_8000D740
    addu        $a2, $s1, $zero
    addu        $s6, $v0, $zero
    addu        $a0, $s6, $zero
    lui         $at, 0x8009
    sw          $s6, -0x49DC($at)
    jal         func_8000F324
    addiu       $a1, $zero, 0x95
    addu        $a0, $s6, $zero
    jal         func_8000EB8C
    sw          $s4, 0xC($s6)
    lui         $a0, 0x8009
    lw          $a0, -0x49DC($a0)
    lui         $s4, 0x8007
    addiu       $s4, $s4, 0x3D94
    jal         func_800B95D8
    addu        $s7, $zero, $zero
    jal         func_8000EC58
    addu        $a0, $s6, $zero
    lw          $v1, 0x14($s6)
    lw          $a2, 0x48($s6)
    addu        $a0, $s6, $zero
    addiu       $a1, $sp, 0x10
    lui         $v0, 0xFC16
    sw          $v0, 0x20($a0)
    addiu       $v0, $zero, 0x800
    sw          $zero, 0x1C($a0)
    sw          $zero, 0x24($a0)
    sh          $s5, 0x3C($a0)
    sh          $s3, 0x3E($a0)
    sw          $zero, 0x2C($a0)
    sw          $zero, 0x30($a0)
    sw          $zero, 0x34($a0)
    ori         $v1, $v1, 0x201
    sw          $v1, 0x14($a0)
    sh          $s0, 0x16($a2)
    sh          $zero, 0x10($sp)
    sh          $zero, 0x12($sp)
    jal         func_8000EC8C
    sh          $v0, 0x14($sp)
    jal         func_8000F31C
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0x8
    addu        $a2, $s1, $zero
    lui         $at, 0x8008
    sw          $zero, 0x5100($at)
    lui         $at, 0x8008
    sh          $s0, 0x50F2($at)
    jal         func_8000D740
    sh          $zero, 0x0($s2)
    addu        $s6, $v0, $zero
    lui         $at, 0x8009
    sw          $s6, -0x7B80($at)
    jal         func_8000EC58
    addu        $a0, $s6, $zero
    addu        $a0, $s6, $zero
    addiu       $a1, $sp, 0x10
    lui         $v0, 0x1B0
    sw          $v0, 0x1C($a0)
    addiu       $v0, $zero, -0x400
    sw          $zero, 0x20($a0)
    sw          $zero, 0x24($a0)
    sw          $zero, 0xC($a0)
    jal         func_8000EC8C
    sh          $v0, 0x14($sp)
    jal         func_8000F31C
    nop
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, 0x50F2($at)
.L800C3BE8:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addiu       $a1, $zero, 0x8
    jal         func_8000D740
    addu        $a2, $s1, $zero
    bnez        $s7, .L800C3C0C
    addu        $s6, $v0, $zero
    lui         $at, 0x8008
    sw          $s6, 0x5100($at)
.L800C3C0C:
    jal         func_8000EC58
    addu        $a0, $s6, $zero
    andi        $v0, $s7, 0x1
    beqz        $v0, .L800C3C24
    lui         $v1, 0xFE70
    lui         $v1, 0x190
.L800C3C24:
    srl         $v0, $s7, 1
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s4
    lh          $v0, 0x0($v0)
    addiu       $s7, $s7, 0x1
    sw          $v1, 0x1C($s6)
    sw          $zero, 0x24($s6)
    sll         $v0, $v0, 16
    sw          $v0, 0x20($s6)
    sltiu       $v0, $s7, 0x8
    bnez        $v0, .L800C3BE8
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lbu         $v1, 0x7A6A($v1)
    bne         $v1, $v0, .L800C3CE4
    sw          $zero, 0x10($s1)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x49E0
    lw          $a0, 0x0($s0)
    lui         $s1, 0x8007
    addiu       $s1, $s1, 0x3D7C
    jal         func_800B96C0
    addu        $a1, $s1, $zero
    lw          $a0, 0x0($s0)
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x3D88
    jal         func_800B970C
    addu        $a1, $s0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x49DC($a0)
    jal         func_800B96C0
    addu        $a1, $s1, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x49DC($a0)
    jal         func_800B970C
    addu        $a1, $s0, $zero
    lui         $v1, 0x8009
    lw          $v1, -0x49E0($v1)
    lui         $v0, 0x344
    sw          $v0, 0x20($v1)
    lui         $v1, 0x8009
    lw          $v1, -0x49DC($v1)
    lui         $v0, 0x320
    lui         $at, 0x8008
    sw          $v0, 0x5E5C($at)
    lui         $v0, 0xFCBC
    j           func_800BF5F4
    sw          $v0, 0x20($v1)
.L800C3CE4:
    lui         $a0, 0x8009
    lw          $a0, -0x49E0($a0)
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x3D70
    jal         func_800B96C0
    addu        $a1, $s0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x49DC($a0)
    jal         func_800B96C0
    addu        $a1, $s0, $zero
    lui         $v0, 0x3C0
    lui         $at, 0x8008
    sw          $v0, 0x5E5C($at)
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
.end func_800C399C
