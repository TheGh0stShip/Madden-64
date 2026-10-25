.text
.align 2
.set noreorder
.globl resource_archive_process
.ent resource_archive_process
resource_archive_process:
    addiu       $sp, $sp, -0x70
    sw          $s0, 0x48($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x6C($sp)
    sw          $fp, 0x68($sp)
    sw          $s7, 0x64($sp)
    sw          $s6, 0x60($sp)
    sw          $s5, 0x5C($sp)
    sw          $s4, 0x58($sp)
    sw          $s3, 0x54($sp)
    sw          $s2, 0x50($sp)
    sw          $s1, 0x4C($sp)
    lw          $s2, 0x8($s0)
    lh          $s1, 0x38($s2)
    addiu       $v0, $zero, 0x1
    bne         $s1, $v0, .L8001850C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    lw          $s5, 0x40($v0)
    jal         func_8000C810
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    lui         $a0, 0x80
    jal         func_80009E58
    addu        $a0, $zero, $zero
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A8B8
    addu        $a0, $zero, $zero
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000A13C
    addiu       $a3, $zero, 0x80
    lui         $a0, 0x40
    ori         $a0, $a0, 0x4340
    lui         $a1, 0x10
    jal         func_8000A63C
    ori         $a1, $a1, 0x4340
    lui         $a0, 0xE
    jal         func_8000B008
    ori         $a0, $a0, 0x3001
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $s1, 0x10($sp)
    lui         $a2, 0xFC12
    ori         $a2, $a2, 0x1824
    lui         $a1, 0xFF33
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0xFFFF
    ori         $a0, $zero, 0x8000
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A940
    sw          $a1, 0x4($v1)
    lw          $a0, 0x8($s2)
    jal         func_800093F4
    nop
    lh          $t3, 0x1E($s2)
    addiu       $v0, $zero, 0x800
    .word       0x004B001A  # div         $zero, $v0, $t3
    bnez        $t3, .L8001821C
    nop
    break       7
.L8001821C:
    addiu       $at, $zero, -0x1
    bne         $t3, $at, .L80018234
    lui         $at, 0x8000
    bne         $v0, $at, .L80018234
    nop
    break       6
.L80018234:
    .word       0x00009812  # mflo        $s3
    addu        $t4, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    lw          $a1, 0x20($s0)
    lhu         $v0, 0x10($s2)
    lh          $a2, 0x18($s2)
    lhu         $v1, 0x1FA($a0)
    srl         $s1, $v0, 1
    addu        $a3, $s1, $zero
    addiu       $s1, $s1, -0x1
    lhu         $v0, 0x1FE($a0)
    addu        $v1, $v1, $a1
    addu        $v1, $v1, $a2
    lw          $a1, 0x1C($s0)
    lh          $a2, 0x16($s2)
    srl         $v0, $v0, 1
    subu        $t0, $v1, $v0
    lhu         $v0, 0x1F8($a0)
    lhu         $v1, 0x1FC($a0)
    lh          $a0, 0x1A($s2)
    addu        $v0, $v0, $a1
    addu        $v0, $v0, $a2
    srl         $v1, $v1, 1
    lh          $a1, 0x1C($s2)
    subu        $a2, $v0, $v1
    addu        $t1, $a2, $a0
    addu        $a1, $t0, $a1
    beqz        $a3, .L80018308
    addu        $t2, $s3, $zero
    addiu       $a0, $s5, 0xA
.L800182B0:
    sh          $a2, 0x0($s5)
    sh          $t1, 0x6($a0)
    lhu         $v0, 0x1A($s2)
    sll         $v0, $v0, 6
    sh          $v0, 0xE($a0)
    slt         $v0, $a1, $t0
    beqz        $v0, .L800182D8
    subu        $v0, $t0, $a1
    subu        $s3, $s3, $v0
    addu        $t0, $a1, $zero
.L800182D8:
    sll         $v0, $s3, 6
    addu        $v1, $t0, $zero
    addu        $t0, $t0, $s3
    sh          $v1, 0x8($a0)
    sh          $v1, -0x8($a0)
    sh          $v0, 0x10($a0)
    sh          $v0, 0x0($a0)
    addiu       $a0, $a0, 0x20
    addiu       $s5, $s5, 0x20
    addu        $v0, $s1, $zero
    bnez        $v0, .L800182B0
    addiu       $s1, $s1, -0x1
.L80018308:
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    addu        $s3, $t2, $zero
    addiu       $fp, $zero, -0x20
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    lw          $s5, 0x40($v0)
    addiu       $s4, $zero, 0x2
    .word       0x01730018  # mult        $t3, $s3
    .word       0x00006812  # mflo        $t5
    sh          $zero, 0x1A($s5)
    sh          $zero, 0xA($s5)
    lhu         $v0, 0x10($s2)
    addu        $s0, $zero, $zero
    lw          $s7, 0x4($s2)
    srl         $s1, $v0, 1
    addiu       $s1, $s1, -0x1
    addu        $v0, $s1, $zero
    addiu       $s1, $s1, -0x1
    beqz        $v0, .L8001850C
    sw          $t5, 0x34($sp)
    addiu       $t1, $zero, 0x2
    lui         $t0, 0xB214
    addu        $s6, $zero, $zero
.L80018368:
    addu        $a0, $s7, $zero
    addiu       $a1, $zero, 0x2
    addiu       $a2, $zero, 0x1
    addu        $a3, $t3, $zero
    sw          $s3, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $t1, 0x18($sp)
    sw          $t1, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    sw          $t0, 0x38($sp)
    sw          $t1, 0x3C($sp)
    sw          $t3, 0x40($sp)
    jal         func_800094D0
    sw          $t4, 0x44($sp)
    addiu       $v0, $fp, 0x20
    slt         $v0, $s4, $v0
    lw          $t0, 0x38($sp)
    lw          $t1, 0x3C($sp)
    lw          $t3, 0x40($sp)
    lw          $t4, 0x44($sp)
    bnez        $v0, .L80018424
    nop
    lhu         $v0, 0x10($s2)
    addiu       $fp, $s4, -0x2
    subu        $a1, $v0, $fp
    slti        $v0, $a1, 0x21
    beql        $v0, $zero, .L800183E4
    addiu       $a1, $zero, 0x20
.L800183E4:
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    addu        $s0, $zero, $zero
    sll         $v1, $a1, 10
    addiu       $v0, $a0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v0, $a1, 4
    addiu       $v0, $v0, -0x1
    or          $v1, $v1, $v0
    andi        $v1, $v1, 0xFFFF
    lui         $v0, 0x400
    or          $v1, $v1, $v0
    addu        $v0, $s5, $s6
    sw          $v1, 0x0($a0)
    sw          $v0, 0x4($a0)
.L80018424:
    beqz        $t4, .L80018480
    sll         $v0, $s0, 1
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    andi        $v0, $v0, 0xFFFF
    or          $v0, $v0, $t0
    sw          $v0, 0x0($a0)
    addiu       $v0, $s0, 0x1
    sll         $v0, $v0, 1
    andi        $v0, $v0, 0xFFFF
    or          $v0, $v0, $t0
    sw          $zero, 0x4($a0)
    sw          $v0, 0x8($a0)
    lh          $v1, 0x1A($s2)
    addiu       $v0, $a0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a0, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v1, $v1, 21
    j .L80018484
    sw          $v1, 0xC($a0)
.L80018480:
    addiu       $t4, $zero, 0x1
.L80018484:
    lw          $t5, 0x34($sp)
    addiu       $s6, $s6, 0x20
    addiu       $s4, $s4, 0x2
    sll         $a1, $s0, 1
    addiu       $v1, $s0, 0x1
    addiu       $a0, $s0, 0x3
    addiu       $v0, $s0, 0x2
    addu        $s0, $v0, $zero
    lui         $a2, 0x8008
    lw          $a2, 0x4F5C($a2)
    addu        $a3, $s1, $zero
    addiu       $s1, $s1, -0x1
    andi        $a1, $a1, 0xFF
    sll         $a1, $a1, 16
    sll         $v1, $v1, 9
    andi        $v1, $v1, 0xFE00
    or          $v1, $a1, $v1
    sll         $a0, $a0, 1
    andi        $a0, $a0, 0xFF
    or          $v1, $v1, $a0
    sll         $a0, $a0, 8
    or          $a1, $a1, $a0
    addu        $s7, $s7, $t5
    addiu       $v0, $a2, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB100
    or          $v1, $v1, $v0
    sll         $v0, $s0, 1
    andi        $v0, $v0, 0xFF
    or          $a1, $a1, $v0
    sw          $v1, 0x0($a2)
    bnez        $a3, .L80018368
    sw          $a1, 0x4($a2)
.L8001850C:
    lw          $ra, 0x6C($sp)
    lw          $fp, 0x68($sp)
    lw          $s7, 0x64($sp)
    lw          $s6, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end resource_archive_process
