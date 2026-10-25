.text
.align 2
.set noreorder
.globl object_decode_pipeline
.ent object_decode_pipeline
object_decode_pipeline:
    addiu       $sp, $sp, -0x1B0
    sw          $s0, 0x188($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x1AC($sp)
    sw          $fp, 0x1A8($sp)
    sw          $s7, 0x1A4($sp)
    sw          $s6, 0x1A0($sp)
    sw          $s5, 0x19C($sp)
    sw          $s4, 0x198($sp)
    sw          $s3, 0x194($sp)
    sw          $s2, 0x190($sp)
    sw          $s1, 0x18C($sp)
    lw          $a0, 0x90($s0)
    lw          $v0, 0x13C($s0)
    lw          $v1, 0x98($s0)
    lw          $t6, 0x1A8($s0)
    addu        $s1, $a1, $zero
    addiu       $v0, $v0, -0x1
    sw          $v0, 0xA4($sp)
    slt         $v0, $v1, $a0
    j .L8005C084
    sw          $t6, 0x9C($sp)
.L8005C038:
    bne         $a0, $v1, .L8005C060
    nop
    lw          $v0, 0x18C($s0)
    lw          $v1, 0x9C($s0)
    lw          $a0, 0x94($s0)
    sltiu       $v0, $v0, 0x1
    addu        $v1, $v1, $v0
    sltu        $v1, $v1, $a0
    bnez        $v1, .L8005C09C
    nop
.L8005C060:
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    beqz        $v0, .L8005C8FC
    addu        $v0, $zero, $zero
    lw          $a0, 0x90($s0)
    lw          $v1, 0x98($s0)
    slt         $v0, $v1, $a0
.L8005C084:
    bnez        $v0, .L8005C09C
    nop
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x14($v0)
    beqz        $v0, .L8005C038
    nop
.L8005C09C:
    lw          $v0, 0x20($s0)
    lw          $t6, 0xD8($s0)
    sw          $zero, 0xB4($sp)
    blez        $v0, .L8005C8DC
    sw          $t6, 0xD4($sp)
    addiu       $t4, $t6, 0x24
    lw          $t6, 0x9C($sp)
    addiu       $t5, $zero, 0x1
    sw          $s1, 0x134($sp)
    sw          $zero, 0x13C($sp)
    sw          $zero, 0x144($sp)
    sw          $t6, 0x14C($sp)
.L8005C0CC:
    lw          $v0, 0xC($t4)
    beqz        $v0, .L8005C880
    nop
    lw          $v0, 0x9C($s0)
    lw          $t6, 0xA4($sp)
    sltu        $v0, $v0, $t6
    beqz        $v0, .L8005C100
    nop
    lw          $t6, -0x18($t4)
    sw          $zero, 0xEC($sp)
    sll         $v1, $t6, 1
    j .L8005C134
    sw          $t6, 0xBC($sp)
.L8005C100:
    lw          $v0, -0x4($t4)
    lw          $v1, -0x18($t4)
    .word       0x0043001B  # divu        $zero, $v0, $v1
    bnez        $v1, .L8005C118
    nop
    break       7
.L8005C118:
    .word       0x00007010  # mfhi        $t6
    bnez        $t6, .L8005C128
    sw          $t6, 0xBC($sp)
    sw          $v1, 0xBC($sp)
.L8005C128:
    lw          $v1, 0xBC($sp)
    addiu       $t6, $zero, 0x1
    sw          $t6, 0xEC($sp)
.L8005C134:
    lw          $a2, 0x9C($s0)
    beqz        $a2, .L8005C190
    addiu       $a2, $a2, -0x1
    lw          $a3, -0x18($t4)
    lw          $v0, 0x4($s0)
    lw          $t6, 0x14C($sp)
    .word       0x00C70018  # mult        $a2, $a3
    .word       0x00003012  # mflo        $a2
    sw          $zero, 0x10($sp)
    lw          $a1, 0x48($t6)
    lw          $v0, 0x20($v0)
    addu        $a0, $s0, $zero
    addu        $a3, $v1, $a3
    sw          $t4, 0x164($sp)
    jalr        $v0
    sw          $t5, 0x168($sp)
    lw          $t4, 0x164($sp)
    lw          $t5, 0x168($sp)
    lw          $v1, -0x18($t4)
    sw          $zero, 0xE4($sp)
    sll         $v1, $v1, 2
    j .L8005C1D0
    addu        $a0, $v0, $v1
.L8005C190:
    lw          $v0, 0x4($s0)
    lw          $t6, 0x14C($sp)
    addu        $a0, $s0, $zero
    addu        $a2, $zero, $zero
    sw          $zero, 0x10($sp)
    lw          $a1, 0x48($t6)
    lw          $v0, 0x20($v0)
    addu        $a3, $v1, $zero
    addiu       $t6, $zero, 0x1
    sw          $t6, 0xE4($sp)
    sw          $t4, 0x164($sp)
    jalr        $v0
    sw          $t5, 0x168($sp)
    addu        $a0, $v0, $zero
    lw          $t5, 0x168($sp)
    lw          $t4, 0x164($sp)
.L8005C1D0:
    lw          $t6, 0x134($sp)
    lw          $t6, 0x0($t6)
    sw          $t6, 0xC4($sp)
    lw          $t6, 0x9C($sp)
    lw          $v1, 0x28($t4)
    lw          $v0, 0x70($t6)
    lw          $t6, 0x144($sp)
    lhu         $t2, 0x0($v1)
    lhu         $a1, 0x2($v1)
    addu        $t3, $v0, $t6
    lhu         $t6, 0x10($v1)
    sw          $t6, 0xF4($sp)
    lhu         $t6, 0x20($v1)
    sw          $t6, 0xFC($sp)
    lw          $v0, 0x1BC($s0)
    lw          $t6, 0x13C($sp)
    lhu         $t9, 0x12($v1)
    lhu         $t8, 0x4($v1)
    addu        $v0, $t6, $v0
    lw          $v0, 0x4($v0)
    lw          $t6, 0xBC($sp)
    addu        $t7, $zero, $zero
    blez        $t6, .L8005C880
    sw          $v0, 0xDC($sp)
    sll         $t6, $a1, 7
    sll         $a1, $a1, 8
    sw          $t6, 0x114($sp)
    sw          $a1, 0x184($sp)
    sw          $a0, 0x12C($sp)
.L8005C244:
    lw          $t6, 0x12C($sp)
    lw          $s1, 0x0($t6)
    lw          $t6, 0xE4($sp)
    sltiu       $v0, $t7, 0x1
    and         $v0, $t6, $v0
    bnez        $v0, .L8005C268
    addu        $s6, $s1, $zero
    lw          $t6, 0x12C($sp)
    lw          $s6, -0x4($t6)
.L8005C268:
    lw          $t6, 0xEC($sp)
    beqz        $t6, .L8005C284
    nop
    lw          $t6, 0xBC($sp)
    addiu       $v0, $t6, -0x1
    beq         $t7, $v0, .L8005C28C
    addu        $s5, $s1, $zero
.L8005C284:
    lw          $t6, 0x12C($sp)
    lw          $s5, 0x4($t6)
.L8005C28C:
    lh          $s4, 0x0($s6)
    lh          $s2, 0x0($s1)
    lh          $s3, 0x0($s5)
    addu        $t1, $zero, $zero
    sw          $zero, 0xCC($sp)
    addu        $t0, $s4, $zero
    addu        $fp, $s2, $zero
    sw          $s4, 0x104($sp)
    lw          $v0, -0x8($t4)
    addu        $a3, $s2, $zero
    addu        $s7, $s3, $zero
    sw          $s3, 0x10C($sp)
    addiu       $v0, $v0, -0x1
    sw          $v0, 0xAC($sp)
.L8005C2C4:
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x18
    addiu       $a2, $zero, 0x1
    sw          $a3, 0x150($sp)
    sw          $t0, 0x154($sp)
    sw          $t1, 0x158($sp)
    sw          $t2, 0x15C($sp)
    sw          $t3, 0x160($sp)
    sw          $t4, 0x164($sp)
    sw          $t5, 0x168($sp)
    sw          $t7, 0x170($sp)
    sw          $t8, 0x174($sp)
    jal         func_800632C8
    sw          $t9, 0x178($sp)
    lw          $t1, 0x158($sp)
    lw          $t6, 0xAC($sp)
    lw          $a3, 0x150($sp)
    lw          $t0, 0x154($sp)
    lw          $t2, 0x15C($sp)
    lw          $t3, 0x160($sp)
    lw          $t4, 0x164($sp)
    lw          $t5, 0x168($sp)
    lw          $t7, 0x170($sp)
    lw          $t8, 0x174($sp)
    lw          $t9, 0x178($sp)
    sltu        $v0, $t1, $t6
    beqz        $v0, .L8005C340
    nop
    lh          $s4, 0x80($s6)
    lh          $s2, 0x80($s1)
    lh          $s3, 0x80($s5)
.L8005C340:
    lw          $a0, 0x4($t3)
    beqz        $a0, .L8005C41C
    nop
    lh          $v0, 0x1A($sp)
    bnez        $v0, .L8005C41C
    subu        $v1, $a3, $s2
    sll         $v0, $v1, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    .word       0x01420018  # mult        $t2, $v0
    .word       0x00001012  # mflo        $v0
    bltz        $v0, .L8005C3C8
    nop
    lw          $t6, 0x114($sp)
    addu        $v0, $t6, $v0
    lw          $t6, 0x184($sp)
    .word       0x004E001A  # div         $zero, $v0, $t6
    bnez        $t6, .L8005C390
    nop
    break       7
.L8005C390:
    addiu       $at, $zero, -0x1
    bne         $t6, $at, .L8005C3A8
    lui         $at, 0x8000
    bne         $v0, $at, .L8005C3A8
    nop
    break       6
.L8005C3A8:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C418
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C418
    addiu       $v1, $a0, -0x1
    j .L8005C41C
    sh          $v1, 0x1A($sp)
.L8005C3C8:
    lw          $t6, 0x114($sp)
    subu        $v0, $t6, $v0
    lw          $t6, 0x184($sp)
    .word       0x004E001A  # div         $zero, $v0, $t6
    bnez        $t6, .L8005C3E4
    nop
    break       7
.L8005C3E4:
    addiu       $at, $zero, -0x1
    bne         $t6, $at, .L8005C3FC
    lui         $at, 0x8000
    bne         $v0, $at, .L8005C3FC
    nop
    break       6
.L8005C3FC:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C414
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C414
    addiu       $v1, $a0, -0x1
.L8005C414:
    negu        $v1, $v1
.L8005C418:
    sh          $v1, 0x1A($sp)
.L8005C41C:
    lw          $a0, 0x8($t3)
    beqz        $a0, .L8005C500
    nop
    lh          $v0, 0x28($sp)
    bnez        $v0, .L8005C500
    subu        $v1, $t0, $s7
    sll         $v0, $v1, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    .word       0x01420018  # mult        $t2, $v0
    .word       0x00001012  # mflo        $v0
    bltz        $v0, .L8005C4A8
    nop
    lw          $t6, 0xF4($sp)
    sll         $v1, $t6, 7
    addu        $v1, $v1, $v0
    sll         $v0, $t6, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C470
    nop
    break       7
.L8005C470:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C488
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C488
    nop
    break       6
.L8005C488:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C4FC
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C4FC
    addiu       $v1, $a0, -0x1
    j .L8005C500
    sh          $v1, 0x28($sp)
.L8005C4A8:
    lw          $t6, 0xF4($sp)
    sll         $v1, $t6, 7
    subu        $v1, $v1, $v0
    sll         $v0, $t6, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C4C8
    nop
    break       7
.L8005C4C8:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C4E0
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C4E0
    nop
    break       6
.L8005C4E0:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C4F8
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C4F8
    addiu       $v1, $a0, -0x1
.L8005C4F8:
    negu        $v1, $v1
.L8005C4FC:
    sh          $v1, 0x28($sp)
.L8005C500:
    lw          $a0, 0xC($t3)
    beqz        $a0, .L8005C5E8
    nop
    lh          $v0, 0x38($sp)
    bnez        $v0, .L8005C5E8
    addu        $v1, $t0, $s7
    sll         $v0, $fp, 1
    subu        $v1, $v1, $v0
    sll         $v0, $v1, 3
    addu        $v0, $v0, $v1
    .word       0x01420018  # mult        $t2, $v0
    .word       0x00001012  # mflo        $v0
    bltz        $v0, .L8005C590
    nop
    lw          $t6, 0xFC($sp)
    sll         $v1, $t6, 7
    addu        $v1, $v1, $v0
    sll         $v0, $t6, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C558
    nop
    break       7
.L8005C558:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C570
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C570
    nop
    break       6
.L8005C570:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C5E4
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C5E4
    addiu       $v1, $a0, -0x1
    j .L8005C5E8
    sh          $v1, 0x38($sp)
.L8005C590:
    lw          $t6, 0xFC($sp)
    sll         $v1, $t6, 7
    subu        $v1, $v1, $v0
    sll         $v0, $t6, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C5B0
    nop
    break       7
.L8005C5B0:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C5C8
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C5C8
    nop
    break       6
.L8005C5C8:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C5E0
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C5E0
    addiu       $v1, $a0, -0x1
.L8005C5E0:
    negu        $v1, $v1
.L8005C5E4:
    sh          $v1, 0x38($sp)
.L8005C5E8:
    lw          $a0, 0x10($t3)
    beqz        $a0, .L8005C6CC
    nop
    lh          $v0, 0x2A($sp)
    bnez        $v0, .L8005C6CC
    nop
    lw          $t6, 0x104($sp)
    subu        $v1, $t6, $s4
    lw          $t6, 0x10C($sp)
    subu        $v1, $v1, $t6
    addu        $v1, $v1, $s3
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    .word       0x01420018  # mult        $t2, $v0
    .word       0x00001012  # mflo        $v0
    bltz        $v0, .L8005C67C
    sll         $v1, $t9, 7
    addu        $v1, $v1, $v0
    sll         $v0, $t9, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C644
    nop
    break       7
.L8005C644:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C65C
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C65C
    nop
    break       6
.L8005C65C:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C6C8
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C6C8
    addiu       $v1, $a0, -0x1
    j .L8005C6CC
    sh          $v1, 0x2A($sp)
.L8005C67C:
    subu        $v1, $v1, $v0
    sll         $v0, $t9, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C694
    nop
    break       7
.L8005C694:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C6AC
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C6AC
    nop
    break       6
.L8005C6AC:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C6C4
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C6C4
    addiu       $v1, $a0, -0x1
.L8005C6C4:
    negu        $v1, $v1
.L8005C6C8:
    sh          $v1, 0x2A($sp)
.L8005C6CC:
    lw          $a0, 0x14($t3)
    beqz        $a0, .L8005C7A4
    nop
    lh          $v0, 0x1C($sp)
    bnez        $v0, .L8005C7A4
    addu        $v1, $a3, $s2
    sll         $v0, $fp, 1
    subu        $v1, $v1, $v0
    sll         $v0, $v1, 3
    addu        $v0, $v0, $v1
    .word       0x01420018  # mult        $t2, $v0
    .word       0x00001012  # mflo        $v0
    bltz        $v0, .L8005C754
    sll         $v1, $t8, 7
    addu        $v1, $v1, $v0
    sll         $v0, $t8, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C71C
    nop
    break       7
.L8005C71C:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C734
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C734
    nop
    break       6
.L8005C734:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C7A0
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C7A0
    addiu       $v1, $a0, -0x1
    j .L8005C7A4
    sh          $v1, 0x1C($sp)
.L8005C754:
    subu        $v1, $v1, $v0
    sll         $v0, $t8, 8
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005C76C
    nop
    break       7
.L8005C76C:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005C784
    lui         $at, 0x8000
    bne         $v1, $at, .L8005C784
    nop
    break       6
.L8005C784:
    .word       0x00001812  # mflo        $v1
    blez        $a0, .L8005C79C
    sllv        $a0, $t5, $a0
    slt         $v0, $v1, $a0
    beql        $v0, $zero, .L8005C79C
    addiu       $v1, $a0, -0x1
.L8005C79C:
    negu        $v1, $v1
.L8005C7A0:
    sh          $v1, 0x1C($sp)
.L8005C7A4:
    lw          $t6, 0xCC($sp)
    lw          $a1, 0xD4($sp)
    lw          $a3, 0xC4($sp)
    sw          $t6, 0x10($sp)
    lw          $t6, 0xDC($sp)
    addu        $a0, $s0, $zero
    addiu       $a2, $sp, 0x18
    sw          $t0, 0x154($sp)
    sw          $t1, 0x158($sp)
    sw          $t2, 0x15C($sp)
    sw          $t3, 0x160($sp)
    sw          $t4, 0x164($sp)
    sw          $t5, 0x168($sp)
    sw          $t7, 0x170($sp)
    sw          $t8, 0x174($sp)
    jalr        $t6
    sw          $t9, 0x178($sp)
    lw          $t0, 0x154($sp)
    addu        $a3, $fp, $zero
    addu        $fp, $s2, $zero
    sw          $s7, 0x10C($sp)
    addu        $s7, $s3, $zero
    lw          $t4, 0x164($sp)
    lw          $t1, 0x158($sp)
    lw          $t6, 0xCC($sp)
    lw          $t2, 0x15C($sp)
    lw          $t3, 0x160($sp)
    lw          $t5, 0x168($sp)
    lw          $t7, 0x170($sp)
    lw          $t8, 0x174($sp)
    addiu       $s1, $s1, 0x80
    addiu       $s6, $s6, 0x80
    sw          $t0, 0x104($sp)
    lw          $v1, 0x0($t4)
    lw          $t9, 0x178($sp)
    addiu       $s5, $s5, 0x80
    addu        $t6, $t6, $v1
    sw          $t6, 0xCC($sp)
    lw          $t6, 0xAC($sp)
    addiu       $t1, $t1, 0x1
    sltu        $v0, $t6, $t1
    beqz        $v0, .L8005C2C4
    addu        $t0, $s4, $zero
    lw          $t6, 0xC4($sp)
    sll         $v0, $v1, 2
    addu        $t6, $t6, $v0
    sw          $t6, 0xC4($sp)
    lw          $t6, 0x12C($sp)
    addiu       $t6, $t6, 0x4
    sw          $t6, 0x12C($sp)
    lw          $t6, 0xBC($sp)
    addiu       $t7, $t7, 0x1
    slt         $v0, $t7, $t6
    bnez        $v0, .L8005C244
    nop
.L8005C880:
    lw          $t6, 0x134($sp)
    addiu       $t6, $t6, 0x4
    sw          $t6, 0x134($sp)
    lw          $t6, 0x13C($sp)
    addiu       $t6, $t6, 0x4
    sw          $t6, 0x13C($sp)
    lw          $t6, 0x144($sp)
    addiu       $t6, $t6, 0x18
    sw          $t6, 0x144($sp)
    lw          $t6, 0x14C($sp)
    addiu       $t6, $t6, 0x4
    sw          $t6, 0x14C($sp)
    lw          $t6, 0xB4($sp)
    addiu       $t6, $t6, 0x1
    sw          $t6, 0xB4($sp)
    lw          $t6, 0xD4($sp)
    lw          $v0, 0x20($s0)
    addiu       $t6, $t6, 0x54
    sw          $t6, 0xD4($sp)
    lw          $t6, 0xB4($sp)
    slt         $v0, $t6, $v0
    bnez        $v0, .L8005C0CC
    addiu       $t4, $t4, 0x54
.L8005C8DC:
    lw          $v1, 0x9C($s0)
    lw          $a0, 0x13C($s0)
    addiu       $v1, $v1, 0x1
    sw          $v1, 0x9C($s0)
    sltu        $v1, $v1, $a0
    bnez        $v1, .L8005C8FC
    addiu       $v0, $zero, 0x3
    addiu       $v0, $zero, 0x4
.L8005C8FC:
    lw          $ra, 0x1AC($sp)
    lw          $fp, 0x1A8($sp)
    lw          $s7, 0x1A4($sp)
    lw          $s6, 0x1A0($sp)
    lw          $s5, 0x19C($sp)
    lw          $s4, 0x198($sp)
    lw          $s3, 0x194($sp)
    lw          $s2, 0x190($sp)
    lw          $s1, 0x18C($sp)
    lw          $s0, 0x188($sp)
    addiu       $sp, $sp, 0x1B0
    jr          $ra
    nop
.end object_decode_pipeline
