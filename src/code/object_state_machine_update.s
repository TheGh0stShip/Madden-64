.text
.align 2
.set noreorder
.globl object_state_machine_update
.ent object_state_machine_update
object_state_machine_update:
    addiu       $sp, $sp, -0x78
    sw          $s3, 0x5C($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x74($sp)
    sw          $fp, 0x70($sp)
    sw          $s7, 0x6C($sp)
    sw          $s6, 0x68($sp)
    sw          $s5, 0x64($sp)
    sw          $s4, 0x60($sp)
    sw          $s2, 0x58($sp)
    sw          $s1, 0x54($sp)
    sw          $s0, 0x50($sp)
    lw          $v0, 0x114($s3)
    lw          $s4, 0x1B8($s3)
    beqz        $v0, .L8005953C
    addu        $s0, $a1, $zero
    lw          $v0, 0x24($s4)
    bnel        $v0, $zero, .L80059540
    sw          $s3, 0x2C($sp)
    jal         func_80059434
    nop
    bnel        $v0, $zero, .L80059540
    sw          $s3, 0x2C($sp)
.L80059534:
    j .L800599CC
    addu        $v0, $zero, $zero
.L8005953C:
    sw          $s3, 0x2C($sp)
.L80059540:
    lw          $v0, 0x14($s3)
    lw          $v0, 0x0($v0)
    sw          $v0, 0x18($sp)
    lw          $v0, 0x14($s3)
    lw          $v0, 0x4($v0)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x19C($s3)
    sw          $v0, 0x20($sp)
    lw          $t0, 0x8($s4)
    lw          $a2, 0xC($s4)
    addiu       $v0, $s4, 0x10
    sw          $v0, 0x30($sp)
    lw          $v0, 0x14($s4)
    lw          $v1, 0x18($s4)
    lw          $a0, 0x1C($s4)
    lw          $a1, 0x20($s4)
    sw          $v0, 0x38($sp)
    sw          $v1, 0x3C($sp)
    sw          $a0, 0x40($sp)
    sw          $a1, 0x44($sp)
    lw          $v0, 0x160($s3)
    blez        $v0, .L80059974
    addu        $s6, $zero, $zero
    addu        $fp, $s0, $zero
.L800595A0:
    sll         $v0, $s6, 2
    addu        $v0, $v0, $s3
    lw          $s5, 0x164($v0)
    sll         $v0, $s5, 2
    addu        $v0, $v0, $s3
    lw          $s1, 0x148($v0)
    lw          $v0, 0x14($s1)
    lw          $s7, 0x0($fp)
    lw          $v1, 0x18($s1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    lw          $s0, 0x28($v0)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s4
    lw          $s2, 0x38($v1)
    slti        $v0, $a2, 0x8
    beqz        $v0, .L80059610
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $zero, $zero
    beqz        $v0, .L800599CC
    addu        $v0, $zero, $zero
    lw          $a2, 0x28($sp)
    lw          $t0, 0x24($sp)
    slti        $v0, $a2, 0x8
    bnez        $v0, .L80059644
    addiu       $v0, $zero, 0x1
.L80059610:
    addiu       $v0, $a2, -0x8
    srav        $v0, $t0, $v0
    andi        $v1, $v0, 0xFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s0
    lw          $v0, 0xD4($v0)
    beql        $v0, $zero, .L80059644
    addiu       $v0, $zero, 0x9
    subu        $a2, $a2, $v0
    addu        $v0, $s0, $v1
    lbu         $s0, 0x4D4($v0)
    j .L8005966C
    nop
.L80059644:
    sw          $v0, 0x10($sp)
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_800592E8
    addu        $a3, $s0, $zero
    addu        $s0, $v0, $zero
    bltz        $s0, .L800599CC
    addu        $v0, $zero, $zero
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L8005966C:
    beqz        $s0, .L800596E4
    slt         $v0, $a2, $s0
    beqz        $v0, .L80059698
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $s0, $zero
    beqz        $v0, .L800599CC
    addu        $v0, $zero, $zero
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L80059698:
    subu        $a2, $a2, $s0
    srav        $a0, $t0, $a2
    addiu       $v1, $zero, 0x1
    sllv        $v1, $v1, $s0
    addiu       $v1, $v1, -0x1
    sll         $a1, $s0, 2
    lui         $t1, 0x8000
    addiu       $t1, $t1, 0x3230
    addu        $v0, $a1, $t1
    lw          $v0, 0x0($v0)
    and         $a0, $a0, $v1
    slt         $v0, $a0, $v0
    beqz        $v0, .L800596E0
    addu        $a3, $a0, $zero
    lui         $at, 0x8000
    addu        $at, $at, $a1
    lw          $v0, 0x3270($at)
    addu        $a3, $a0, $v0
.L800596E0:
    addu        $s0, $a3, $zero
.L800596E4:
    lw          $v0, 0x30($s1)
    beqz        $v0, .L80059870
    sll         $v1, $s5, 2
    addiu       $v0, $sp, 0x18
    addu        $v1, $v1, $v0
    lw          $v0, 0x20($v1)
    addu        $s0, $s0, $v0
    sw          $s0, 0x20($v1)
    sh          $s0, 0x0($s7)
    lw          $v0, 0x24($s1)
    slti        $v0, $v0, 0x2
    bnez        $v0, .L80059874
    addiu       $s1, $zero, 0x1
    slti        $v0, $a2, 0x8
.L8005971C:
    beqz        $v0, .L8005974C
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $zero, $zero
    beqz        $v0, .L800599CC
    addu        $v0, $zero, $zero
    lw          $a2, 0x28($sp)
    lw          $t0, 0x24($sp)
    slti        $v0, $a2, 0x8
    bnez        $v0, .L80059780
    addiu       $v0, $zero, 0x1
.L8005974C:
    addiu       $v0, $a2, -0x8
    srav        $v0, $t0, $v0
    andi        $v1, $v0, 0xFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s2
    lw          $v0, 0xD4($v0)
    beql        $v0, $zero, .L80059780
    addiu       $v0, $zero, 0x9
    subu        $a2, $a2, $v0
    addu        $v0, $s2, $v1
    lbu         $s0, 0x4D4($v0)
    j .L800597A8
    sra         $a0, $s0, 4
.L80059780:
    sw          $v0, 0x10($sp)
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_800592E8
    addu        $a3, $s2, $zero
    addu        $s0, $v0, $zero
    bltz        $s0, .L80059534
    sra         $a0, $s0, 4
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L800597A8:
    andi        $s0, $s0, 0xF
    beqz        $s0, .L80059848
    slt         $v0, $a2, $s0
    beqz        $v0, .L800597DC
    addu        $s1, $s1, $a0
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $s0, $zero
    beqz        $v0, .L800599CC
    addu        $v0, $zero, $zero
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L800597DC:
    subu        $a2, $a2, $s0
    srav        $a0, $t0, $a2
    addiu       $v0, $zero, 0x1
    sllv        $v0, $v0, $s0
    addiu       $v0, $v0, -0x1
    sll         $a3, $s0, 2
    lui         $t1, 0x8000
    addiu       $t1, $t1, 0x3230
    addu        $v1, $a3, $t1
    lw          $v1, 0x0($v1)
    and         $a0, $a0, $v0
    slt         $v1, $a0, $v1
    beqz        $v1, .L80059824
    addu        $a1, $a0, $zero
    lui         $at, 0x8000
    addu        $at, $at, $a3
    lw          $v0, 0x3270($at)
    addu        $a1, $a0, $v0
.L80059824:
    sll         $v0, $s1, 2
    lui         $t1, 0x8000
    addiu       $t1, $t1, 0x3528
    addu        $v0, $v0, $t1
    lw          $v0, 0x0($v0)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s7
    j .L80059858
    sh          $a1, 0x0($v0)
.L80059848:
    addiu       $t1, $zero, 0xF
    bne         $a0, $t1, .L80059960
    nop
    addiu       $s1, $s1, 0xF
.L80059858:
    addiu       $s1, $s1, 0x1
    slti        $v0, $s1, 0x40
    bnez        $v0, .L8005971C
    slti        $v0, $a2, 0x8
    j .L80059960
    nop
.L80059870:
    addiu       $s1, $zero, 0x1
.L80059874:
    slti        $v0, $a2, 0x8
.L80059878:
    beqz        $v0, .L800598A8
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $zero, $zero
    beqz        $v0, .L800599CC
    addu        $v0, $zero, $zero
    lw          $a2, 0x28($sp)
    lw          $t0, 0x24($sp)
    slti        $v0, $a2, 0x8
    bnez        $v0, .L800598DC
    addiu       $v0, $zero, 0x1
.L800598A8:
    addiu       $v0, $a2, -0x8
    srav        $v0, $t0, $v0
    andi        $v1, $v0, 0xFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s2
    lw          $v0, 0xD4($v0)
    beql        $v0, $zero, .L800598DC
    addiu       $v0, $zero, 0x9
    subu        $a2, $a2, $v0
    addu        $v0, $s2, $v1
    lbu         $s0, 0x4D4($v0)
    j .L80059904
    sra         $a0, $s0, 4
.L800598DC:
    sw          $v0, 0x10($sp)
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_800592E8
    addu        $a3, $s2, $zero
    addu        $s0, $v0, $zero
    bltz        $s0, .L80059534
    sra         $a0, $s0, 4
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L80059904:
    andi        $s0, $s0, 0xF
    beqz        $s0, .L80059940
    slt         $v0, $a2, $s0
    beqz        $v0, .L80059938
    addu        $s1, $s1, $a0
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $s0, $zero
    beqz        $v0, .L800599CC
    addu        $v0, $zero, $zero
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L80059938:
    j .L80059950
    subu        $a2, $a2, $s0
.L80059940:
    addiu       $t1, $zero, 0xF
    bne         $a0, $t1, .L80059960
    nop
    addiu       $s1, $s1, 0xF
.L80059950:
    addiu       $s1, $s1, 0x1
    slti        $v0, $s1, 0x40
    bnez        $v0, .L80059878
    slti        $v0, $a2, 0x8
.L80059960:
    lw          $v0, 0x160($s3)
    addiu       $s6, $s6, 0x1
    slt         $v0, $s6, $v0
    bnez        $v0, .L800595A0
    addiu       $fp, $fp, 0x4
.L80059974:
    lw          $v1, 0x14($s3)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x0($v1)
    lw          $v1, 0x14($s3)
    lw          $v0, 0x1C($sp)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x20($sp)
    sw          $v0, 0x19C($s3)
    sw          $t0, 0x8($s4)
    sw          $a2, 0xC($s4)
    lw          $v0, 0x38($sp)
    lw          $v1, 0x3C($sp)
    lw          $a0, 0x40($sp)
    lw          $a1, 0x44($sp)
    sw          $v0, 0x14($s4)
    sw          $v1, 0x18($s4)
    sw          $a0, 0x1C($s4)
    sw          $a1, 0x20($s4)
    lw          $v1, 0x24($s4)
    addiu       $v0, $zero, 0x1
    addiu       $v1, $v1, -0x1
    sw          $v1, 0x24($s4)
.L800599CC:
    lw          $ra, 0x74($sp)
    lw          $fp, 0x70($sp)
    lw          $s7, 0x6C($sp)
    lw          $s6, 0x68($sp)
    lw          $s5, 0x64($sp)
    lw          $s4, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
    nop
.end object_state_machine_update
