.text
.align 2
.set noreorder
.globl ui_scene_render
.ent ui_scene_render
ui_scene_render:
    addiu       $sp, $sp, -0x198
    sw          $ra, 0x194($sp)
    sw          $fp, 0x190($sp)
    sw          $s7, 0x18C($sp)
    sw          $s6, 0x188($sp)
    sw          $s5, 0x184($sp)
    sw          $s4, 0x180($sp)
    sw          $s3, 0x17C($sp)
    sw          $s2, 0x178($sp)
    sw          $s1, 0x174($sp)
    sw          $s0, 0x170($sp)
    sw          $a0, 0x34($sp)
    lw          $s3, 0x8($a0)
    lh          $s0, 0x38($s3)
    addiu       $v0, $zero, 0x1
    bne         $s0, $v0, .L80019764
    lui         $a0, 0x20
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    lui         $a0, 0x80
    jal         func_8000A22C
    addiu       $a0, $zero, 0xC0
    jal         func_80009E9C
    addiu       $a0, $zero, 0x30
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000A13C
    addiu       $a3, $zero, 0xFF
    lui         $a0, 0xE
    jal         func_8000B008
    ori         $a0, $a0, 0x3205
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $s0, 0x10($sp)
    addu        $a0, $zero, $zero
    jal         func_8000A63C
    addu        $a1, $zero, $zero
    jal         func_80009E58
    addiu       $a0, $zero, 0x1
    jal         func_8000A984
    addu        $a0, $zero, $zero
    jal         func_8000A8B8
    addu        $a0, $zero, $zero
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    lui         $a0, 0xFCFF
    ori         $a0, $a0, 0xFFFF
    lui         $v0, 0x8008
    lw          $v0, 0x4F5C($v0)
    lui         $v1, 0xFFFC
    ori         $v1, $v1, 0xF279
    sw          $a0, 0x0($v0)
    sw          $v1, 0x4($v0)
    lhu         $s6, 0xC($s3)
    addiu       $v0, $v0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0x8
    beq         $s6, $v0, .L800186C4
    sltiu       $v0, $s6, 0x9
    beqz        $v0, .L80018688
    addiu       $v0, $zero, 0x4
    beq         $s6, $v0, .L8001869C
    nop
    j .L800186E8
    nop
.L80018688:
    addiu       $v0, $zero, 0x10
    beq         $s6, $v0, .L800186E0
    nop
    j .L800186E8
    nop
.L8001869C:
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lh          $a1, 0x3C($s3)
    lw          $v0, 0x8($s3)
    addu        $a0, $zero, $zero
    sll         $a1, $a1, 5
    jal         func_80009310
    addu        $a1, $v0, $a1
    j .L800186E8
    nop
.L800186C4:
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lw          $a0, 0x8($s3)
    jal         func_800093F4
    nop
    j .L800186E8
    nop
.L800186E0:
    jal         func_8000A940
    addu        $a0, $zero, $zero
.L800186E8:
    lh          $a2, 0x12($s3)
    lh          $a3, 0x14($s3)
    lw          $t6, 0x34($sp)
    lhu         $v1, 0x18($s3)
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    lw          $a0, 0x20($t6)
    lhu         $t6, 0x12($s3)
    addu        $v1, $v1, $a0
    sh          $t6, 0x56($sp)
    sh          $v1, 0x66($sp)
    lhu         $t6, 0x1F8($v0)
    sh          $t6, 0x6E($sp)
    lhu         $v1, 0x1FC($v0)
    lhu         $t6, 0x1FA($v0)
    .word       0x00C70018  # mult        $a2, $a3
    .word       0x00002812  # mflo        $a1
    sh          $t6, 0x76($sp)
    lhu         $t6, 0x6E($sp)
    addu        $t0, $t6, $v1
    lw          $t6, 0x34($sp)
    sh          $t0, 0x7E($sp)
    lhu         $v0, 0x1FE($v0)
    .word       0x00B60018  # mult        $a1, $s6
    .word       0x00002812  # mflo        $a1
    lw          $a0, 0x1C($t6)
    lhu         $t6, 0x76($sp)
    lhu         $v1, 0x16($s3)
    addu        $t1, $t6, $v0
    sh          $t1, 0x86($sp)
    lw          $v0, 0x0($s3)
    addu        $fp, $a3, $zero
    addu        $t2, $v1, $a0
    sh          $t2, 0x5E($sp)
    srl         $a1, $a1, 3
    beqz        $v0, .L80019000
    sw          $a1, 0x44($sp)
    sw          $v0, 0x94($sp)
    lhu         $s7, 0x0($v0)
    addu        $t6, $v0, $zero
    addiu       $t6, $t6, 0x2
    ori         $t4, $zero, 0xFFFF
    sw          $t6, 0x94($sp)
    sll         $v0, $s7, 1
    addu        $v0, $t6, $v0
    sw          $v0, 0x8C($sp)
    addu        $v0, $s7, $zero
    andi        $v0, $v0, 0xFFFF
    beqz        $v0, .L80018CC8
    addiu       $s7, $s7, -0x1
    lhu         $t6, 0x6E($sp)
    addu        $s5, $a2, $zero
    addu        $s4, $a3, $zero
    sll         $v0, $t6, 16
    lhu         $t6, 0x76($sp)
    addiu       $t5, $zero, 0x2
    sra         $v0, $v0, 16
    sw          $v0, 0xAC($sp)
    sll         $v0, $t0, 16
    sra         $v0, $v0, 16
    sw          $v0, 0xB4($sp)
    sll         $v0, $t6, 16
    sra         $v0, $v0, 16
    sw          $v0, 0xBC($sp)
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    sw          $v0, 0xC4($sp)
.L800187F4:
    lw          $t6, 0x94($sp)
    lhu         $t6, 0x0($t6)
    sh          $t6, 0x4E($sp)
    lhu         $v0, 0xE($s3)
    lhu         $a1, 0x4E($sp)
    .word       0x00A2001B  # divu        $zero, $a1, $v0
    bnez        $v0, .L80018818
    nop
    break       7
.L80018818:
    .word       0x00001012  # mflo        $v0
    .word       0x00001810  # mfhi        $v1
    nop
    nop
    .word       0x02A30018  # mult        $s5, $v1
    .word       0x00001812  # mflo        $v1
    lw          $t6, 0x94($sp)
    nop
    .word       0x02820018  # mult        $s4, $v0
    .word       0x00001012  # mflo        $v0
    addiu       $t6, $t6, 0x2
    sw          $t6, 0x94($sp)
    lhu         $t6, 0x5E($sp)
    addu        $v1, $t6, $v1
    lhu         $t6, 0x66($sp)
    addu        $s1, $v1, $zero
    sll         $v1, $v1, 16
    addu        $a0, $t6, $v0
    lw          $t6, 0xAC($sp)
    sra         $v1, $v1, 16
    addu        $v0, $v1, $s5
    slt         $v0, $t6, $v0
    lw          $t6, 0xB4($sp)
    slt         $v1, $v1, $t6
    and         $v0, $v0, $v1
    beqz        $v0, .L80018CB8
    addu        $s2, $a0, $zero
    sll         $v1, $a0, 16
    lw          $t6, 0xBC($sp)
    sra         $v1, $v1, 16
    addu        $v0, $v1, $s4
    slt         $v0, $t6, $v0
    lw          $t6, 0xC4($sp)
    slt         $v1, $v1, $t6
    and         $v0, $v0, $v1
    beqz        $v0, .L80018CBC
    addu        $v0, $s7, $zero
    lw          $t6, 0x8C($sp)
    sll         $v0, $a1, 1
    addu        $v0, $v0, $t6
    lhu         $v0, 0x0($v0)
    andi        $s0, $v0, 0x1FFF
    andi        $a0, $s0, 0xFFFF
    andi        $v0, $t4, 0xFFFF
    beq         $a0, $v0, .L800189A4
    addiu       $v0, $zero, 0x8
    beq         $s6, $v0, .L8001894C
    sltiu       $v0, $s6, 0x9
    beqz        $v0, .L800188F0
    addiu       $v0, $zero, 0x4
    beq         $s6, $v0, .L80018904
    addiu       $a1, $zero, 0x2
    j .L800189A4
    addu        $t4, $s0, $zero
.L800188F0:
    addiu       $v0, $zero, 0x10
    beq         $s6, $v0, .L80018958
    addu        $a1, $zero, $zero
    j .L800189A4
    addu        $t4, $s0, $zero
.L80018904:
    lw          $t6, 0x44($sp)
    lw          $v0, 0x4($s3)
    addu        $a2, $s5, $zero
    .word       0x008E0018  # mult        $a0, $t6
    .word       0x00002012  # mflo        $a0
    addu        $a3, $s4, $zero
    sw          $zero, 0x10($sp)
    sw          $t5, 0x14($sp)
    sw          $t5, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $t5, 0x168($sp)
    jal         func_8000979C
    addu        $a0, $v0, $a0
    j .L8001899C
    nop
.L8001894C:
    addiu       $a1, $zero, 0x2
    j .L8001895C
    addiu       $a2, $zero, 0x1
.L80018958:
    addiu       $a2, $zero, 0x2
.L8001895C:
    lw          $t6, 0x44($sp)
    lw          $v0, 0x4($s3)
    addu        $a3, $s5, $zero
    .word       0x008E0018  # mult        $a0, $t6
    .word       0x00002012  # mflo        $a0
    sw          $s4, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $t5, 0x18($sp)
    sw          $t5, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    sw          $t5, 0x168($sp)
    jal         func_800094D0
    addu        $a0, $v0, $a0
.L8001899C:
    lw          $t5, 0x168($sp)
    addu        $t4, $s0, $zero
.L800189A4:
    addu        $a3, $s1, $zero
    addu        $t0, $s2, $zero
    lhu         $t6, 0x56($sp)
    addu        $a2, $s2, $fp
    addu        $a0, $a2, $zero
    addu        $t2, $zero, $zero
    addu        $t1, $zero, $zero
    sll         $v0, $a3, 16
    addu        $a1, $a3, $t6
    lw          $t6, 0xAC($sp)
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t6
    beqz        $v0, .L800189E8
    addu        $v1, $a1, $zero
    lhu         $t6, 0x6E($sp)
    subu        $t1, $t6, $a3
    lhu         $a3, 0x6E($sp)
.L800189E8:
    lw          $t6, 0xBC($sp)
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t6
    beqz        $v0, .L80018A0C
    nop
    lhu         $t6, 0x76($sp)
    lhu         $t0, 0x76($sp)
    subu        $t2, $t6, $s2
.L80018A0C:
    lw          $t6, 0xB4($sp)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    slt         $v0, $t6, $v0
    beqz        $v0, .L80018A28
    nop
    lhu         $v1, 0x7E($sp)
.L80018A28:
    lw          $t6, 0xC4($sp)
    sll         $v0, $a2, 16
    sra         $v0, $v0, 16
    slt         $v0, $t6, $v0
    beqz        $v0, .L80018A44
    nop
    lhu         $a0, 0x86($sp)
.L80018A44:
    lhu         $t6, 0x4E($sp)
    sll         $t3, $a3, 2
    sll         $t0, $t0, 2
    sll         $v0, $t6, 1
    lw          $t6, 0x8C($sp)
    addiu       $v1, $v1, -0x1
    addiu       $a0, $a0, -0x1
    addu        $v0, $v0, $t6
    lhu         $v0, 0x0($v0)
    sll         $a3, $a0, 2
    srl         $a0, $v0, 14
    addiu       $v0, $zero, 0x1
    beq         $a0, $v0, .L80018B18
    sll         $v1, $v1, 2
    slti        $v0, $a0, 0x2
    beqz        $v0, .L80018A98
    nop
    beqz        $a0, .L80018AB0
    lui         $a2, 0x1000
    j .L80018CBC
    addu        $v0, $s7, $zero
.L80018A98:
    beq         $a0, $t5, .L80018BB0
    addiu       $v0, $zero, 0x3
    beq         $a0, $v0, .L80018C10
    lui         $a2, 0xF000
    j .L80018CBC
    addu        $v0, $s7, $zero
.L80018AB0:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    ori         $a2, $a2, 0x400
    andi        $a0, $v1, 0xFFC
    sll         $a0, $a0, 12
    lui         $v1, 0xE400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a3, 0xFFC
    or          $v0, $v0, $v1
    or          $a0, $a0, $v0
    andi        $v0, $t3, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $t0, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sll         $v1, $t1, 21
    sw          $v0, 0x8($a1)
    sll         $v0, $t2, 5
    j .L80018C94
    andi        $v0, $v0, 0xFFE0
.L80018B18:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $a2, 0xF000
    ori         $a2, $a2, 0x400
    andi        $a0, $v1, 0xFFC
    sll         $a0, $a0, 12
    lui         $v1, 0xE400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a3, 0xFFC
    or          $v0, $v0, $v1
    or          $a0, $a0, $v0
    andi        $v0, $t3, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $t0, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($a1)
    sll         $v0, $t1, 16
    sra         $v0, $v0, 16
    subu        $v0, $s5, $v0
    addiu       $v0, $v0, -0x1
    sll         $v0, $v0, 21
    sll         $v1, $t2, 5
    andi        $v1, $v1, 0xFFE0
    or          $v0, $v0, $v1
    sw          $v0, 0xC($a1)
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    j .L80018CB0
    sw          $a0, 0x0($a1)
.L80018BB0:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $a2, 0x1000
    ori         $a2, $a2, 0xFC00
    andi        $a0, $v1, 0xFFC
    sll         $a0, $a0, 12
    lui         $v1, 0xE400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a3, 0xFFC
    or          $v0, $v0, $v1
    or          $a0, $a0, $v0
    andi        $v0, $t3, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $t0, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    j .L80018C78
    sll         $v1, $t1, 21
.L80018C10:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    ori         $a2, $a2, 0xFC00
    andi        $a0, $v1, 0xFFC
    sll         $a0, $a0, 12
    lui         $v1, 0xE400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a3, 0xFFC
    or          $v0, $v0, $v1
    or          $a0, $a0, $v0
    andi        $v0, $t3, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $t0, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sll         $v1, $t1, 16
    sra         $v1, $v1, 16
    subu        $v1, $s5, $v1
    addiu       $v1, $v1, -0x1
    sll         $v1, $v1, 21
.L80018C78:
    sw          $v0, 0x8($a1)
    sll         $v0, $t2, 16
    sra         $v0, $v0, 16
    subu        $v0, $s4, $v0
    addiu       $v0, $v0, -0x1
    sll         $v0, $v0, 5
    andi        $v0, $v0, 0xFFFF
.L80018C94:
    or          $v1, $v1, $v0
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $a0, 0x0($a1)
    sw          $v1, 0xC($a1)
.L80018CB0:
    sw          $v0, 0x10($a1)
    sw          $a2, 0x14($a1)
.L80018CB8:
    addu        $v0, $s7, $zero
.L80018CBC:
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L800187F4
    addiu       $s7, $s7, -0x1
.L80018CC8:
    lhu         $v0, 0x10($s3)
    lhu         $s2, 0x66($sp)
    beqz        $v0, .L80019700
    sw          $zero, 0x3C($sp)
    lhu         $t6, 0x56($sp)
    sll         $v0, $t6, 16
    lhu         $t6, 0x6E($sp)
    sra         $s7, $v0, 16
    sll         $v0, $t6, 16
    lhu         $t6, 0x7E($sp)
    sra         $v0, $v0, 16
    sw          $v0, 0xCC($sp)
    sll         $t6, $t6, 16
    sw          $t6, 0xDC($sp)
.L80018D00:
    lhu         $v0, 0xE($s3)
    lhu         $s1, 0x5E($sp)
    beqz        $v0, .L80018FDC
    addu        $s4, $zero, $zero
    lw          $t6, 0xDC($sp)
    sra         $t6, $t6, 16
    sll         $a2, $s2, 16
    sra         $a2, $a2, 16
    sll         $v0, $fp, 16
    sw          $t6, 0xD4($sp)
    lhu         $t6, 0x76($sp)
    sra         $s5, $v0, 16
    addu        $a1, $a2, $s5
    sll         $v1, $t6, 16
    lhu         $t6, 0x86($sp)
    sra         $v1, $v1, 16
    slt         $a1, $v1, $a1
    sll         $a0, $t6, 16
    sra         $a0, $a0, 16
    slt         $v0, $a2, $a0
    and         $a1, $a1, $v0
    slt         $a2, $a2, $v1
    addu        $t6, $s2, $fp
    sll         $v0, $t6, 16
    sra         $v0, $v0, 16
    slt         $a0, $a0, $v0
    sw          $a1, 0xE4($sp)
    sw          $a2, 0xF4($sp)
    sw          $t6, 0xEC($sp)
    sw          $a0, 0xFC($sp)
.L80018D78:
    lw          $t6, 0x8C($sp)
    lhu         $s0, 0x0($t6)
    sll         $v1, $s1, 16
    addiu       $t6, $t6, 0x2
    sw          $t6, 0x8C($sp)
    lw          $t6, 0xCC($sp)
    sra         $v1, $v1, 16
    addu        $v0, $v1, $s7
    slt         $v0, $t6, $v0
    lw          $t6, 0xD4($sp)
    slt         $v1, $v1, $t6
    and         $v0, $v0, $v1
    beqz        $v0, .L80018FC4
    nop
    lw          $t6, 0xE4($sp)
    beqz        $t6, .L80018FC4
    andi        $v0, $s0, 0x2000
    bnez        $v0, .L80018FC4
    addiu       $v0, $zero, 0x8
    beq         $s6, $v0, .L80018E48
    andi        $t4, $s0, 0x1FFF
    sltiu       $v0, $s6, 0x9
    beqz        $v0, .L80018DE8
    addiu       $v0, $zero, 0x4
    beq         $s6, $v0, .L80018DFC
    addiu       $a1, $zero, 0x2
    j .L80018EA0
    addu        $a3, $s1, $zero
.L80018DE8:
    addiu       $v0, $zero, 0x10
    beq         $s6, $v0, .L80018E54
    addu        $a1, $zero, $zero
    j .L80018EA0
    addu        $a3, $s1, $zero
.L80018DFC:
    addu        $a2, $s7, $zero
    lw          $t6, 0x44($sp)
    andi        $a0, $t4, 0xFFFF
    lw          $v1, 0x4($s3)
    .word       0x008E0018  # mult        $a0, $t6
    .word       0x00002012  # mflo        $a0
    addu        $a3, $s5, $zero
    addiu       $v0, $zero, 0x2
    sw          $zero, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    jal         func_8000979C
    addu        $a0, $v1, $a0
    j .L80018EA0
    addu        $a3, $s1, $zero
.L80018E48:
    addiu       $a1, $zero, 0x2
    j .L80018E58
    addiu       $a2, $zero, 0x1
.L80018E54:
    addiu       $a2, $zero, 0x2
.L80018E58:
    addu        $a3, $s7, $zero
    lw          $t6, 0x44($sp)
    lw          $v1, 0x4($s3)
    andi        $a0, $t4, 0xFFFF
    .word       0x008E0018  # mult        $a0, $t6
    .word       0x00002012  # mflo        $a0
    addiu       $v0, $zero, 0x2
    sw          $s5, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    jal         func_800094D0
    addu        $a0, $v1, $a0
    addu        $a3, $s1, $zero
.L80018EA0:
    addu        $t0, $s2, $zero
    lhu         $t6, 0x56($sp)
    lhu         $a0, 0xEE($sp)
    addu        $t2, $zero, $zero
    addu        $t1, $zero, $zero
    sll         $v0, $a3, 16
    addu        $a1, $a3, $t6
    lw          $t6, 0xCC($sp)
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t6
    beqz        $v0, .L80018EDC
    addu        $v1, $a1, $zero
    lhu         $t6, 0x6E($sp)
    subu        $t1, $t6, $a3
    lhu         $a3, 0x6E($sp)
.L80018EDC:
    lw          $t6, 0xF4($sp)
    beqz        $t6, .L80018EF4
    nop
    lhu         $t6, 0x76($sp)
    lhu         $t0, 0x76($sp)
    subu        $t2, $t6, $s2
.L80018EF4:
    lw          $t6, 0xD4($sp)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    slt         $v0, $t6, $v0
    beqz        $v0, .L80018F10
    nop
    lhu         $v1, 0x7E($sp)
.L80018F10:
    lw          $t6, 0xFC($sp)
    beqz        $t6, .L80018F20
    nop
    lhu         $a0, 0x86($sp)
.L80018F20:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $a2, 0x1000
    ori         $a2, $a2, 0x400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, -0x1
    addiu       $v1, $a0, -0x1
    sll         $v0, $v0, 2
    sll         $v1, $v1, 2
    andi        $v0, $v0, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $v1, 0xFFC
    lui         $a0, 0xE400
    or          $v1, $v1, $a0
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a1)
    sll         $v0, $a3, 2
    sll         $v1, $t0, 2
    andi        $v0, $v0, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $v1, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sll         $v1, $t1, 21
    sw          $v0, 0x8($a1)
    sll         $v0, $t2, 21
    srl         $v0, $v0, 16
    or          $v1, $v1, $v0
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $v1, 0xC($a1)
    sw          $v0, 0x10($a1)
    sw          $a2, 0x14($a1)
.L80018FC4:
    lhu         $t6, 0x56($sp)
    lhu         $v0, 0xE($s3)
    addiu       $s4, $s4, 0x1
    sltu        $v0, $s4, $v0
    bnez        $v0, .L80018D78
    addu        $s1, $s1, $t6
.L80018FDC:
    lw          $t6, 0x3C($sp)
    lhu         $v0, 0x10($s3)
    addu        $s2, $s2, $fp
    addiu       $t6, $t6, 0x1
    sltu        $v0, $t6, $v0
    bnez        $v0, .L80018D00
    sw          $t6, 0x3C($sp)
    j .L80019700
    nop
.L80019000:
    lhu         $v0, 0xE($s3)
    lhu         $s2, 0x66($sp)
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L80019024
    addu        $s5, $zero, $zero
    lhu         $v0, 0x10($s3)
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80019320
    addu        $s0, $fp, $zero
.L80019024:
    lhu         $v0, 0x10($s3)
    sltu        $v0, $s5, $v0
    beqz        $v0, .L80019700
    sw          $zero, 0x3C($sp)
    lhu         $t6, 0x6E($sp)
    addu        $s7, $a2, $zero
    sll         $t0, $t0, 16
    sll         $v0, $t6, 16
    sra         $v0, $v0, 16
    sw          $v0, 0x104($sp)
    sw          $t0, 0x114($sp)
.L80019050:
    lhu         $v0, 0xE($s3)
    lhu         $s1, 0x5E($sp)
    beqz        $v0, .L800192FC
    addu        $s4, $zero, $zero
    lw          $t6, 0x114($sp)
    sra         $t6, $t6, 16
    sll         $a2, $s2, 16
    sra         $a2, $a2, 16
    sll         $v0, $fp, 16
    sw          $t6, 0x10C($sp)
    lhu         $t6, 0x76($sp)
    sra         $s0, $v0, 16
    addu        $a1, $a2, $s0
    sll         $v1, $t6, 16
    lhu         $t6, 0x86($sp)
    sra         $v1, $v1, 16
    slt         $a1, $v1, $a1
    sll         $a0, $t6, 16
    sra         $a0, $a0, 16
    slt         $v0, $a2, $a0
    and         $a1, $a1, $v0
    slt         $a2, $a2, $v1
    addu        $t6, $s2, $fp
    sll         $v0, $t6, 16
    sra         $v0, $v0, 16
    slt         $a0, $a0, $v0
    sw          $a1, 0x11C($sp)
    sw          $a2, 0x12C($sp)
    sw          $t6, 0x124($sp)
    sw          $a0, 0x134($sp)
.L800190C8:
    sll         $v1, $s1, 16
    lw          $t6, 0x104($sp)
    sra         $v1, $v1, 16
    addu        $v0, $v1, $s7
    slt         $v0, $t6, $v0
    lw          $t6, 0x10C($sp)
    slt         $v1, $v1, $t6
    and         $v0, $v0, $v1
    beqz        $v0, .L800192DC
    nop
    lw          $t6, 0x11C($sp)
    beqz        $t6, .L800192DC
    addiu       $v0, $zero, 0x8
    beq         $s6, $v0, .L8001916C
    sltiu       $v0, $s6, 0x9
    beqz        $v0, .L8001911C
    addiu       $v0, $zero, 0x4
    beq         $s6, $v0, .L80019130
    addiu       $a1, $zero, 0x2
    j .L800191B8
    addu        $a3, $s1, $zero
.L8001911C:
    addiu       $v0, $zero, 0x10
    beq         $s6, $v0, .L8001917C
    addu        $a1, $zero, $zero
    j .L800191B8
    addu        $a3, $s1, $zero
.L80019130:
    lw          $a0, 0x4($s3)
    addu        $a2, $s7, $zero
    addu        $a3, $s0, $zero
    addiu       $v0, $zero, 0x2
    sw          $zero, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    jal         func_8000979C
    addu        $a0, $a0, $s5
    j .L800191B8
    addu        $a3, $s1, $zero
.L8001916C:
    addiu       $a1, $zero, 0x2
    lw          $a0, 0x4($s3)
    j .L80019184
    addiu       $a2, $zero, 0x1
.L8001917C:
    lw          $a0, 0x4($s3)
    addiu       $a2, $zero, 0x2
.L80019184:
    addu        $a3, $s7, $zero
    addiu       $v0, $zero, 0x2
    sw          $s0, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    jal         func_800094D0
    addu        $a0, $a0, $s5
    addu        $a3, $s1, $zero
.L800191B8:
    addu        $t0, $s2, $zero
    lhu         $t6, 0x56($sp)
    lhu         $a0, 0x126($sp)
    addu        $t2, $zero, $zero
    addu        $t1, $zero, $zero
    sll         $v0, $a3, 16
    addu        $a1, $a3, $t6
    lw          $t6, 0x104($sp)
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t6
    beqz        $v0, .L800191F4
    addu        $v1, $a1, $zero
    lhu         $t6, 0x6E($sp)
    subu        $t1, $t6, $a3
    lhu         $a3, 0x6E($sp)
.L800191F4:
    lw          $t6, 0x12C($sp)
    beqz        $t6, .L8001920C
    nop
    lhu         $t6, 0x76($sp)
    lhu         $t0, 0x76($sp)
    subu        $t2, $t6, $s2
.L8001920C:
    lw          $t6, 0x10C($sp)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    slt         $v0, $t6, $v0
    beqz        $v0, .L80019228
    nop
    lhu         $v1, 0x7E($sp)
.L80019228:
    lw          $t6, 0x134($sp)
    beqz        $t6, .L80019238
    nop
    lhu         $a0, 0x86($sp)
.L80019238:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $a2, 0x1000
    ori         $a2, $a2, 0x400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, -0x1
    addiu       $v1, $a0, -0x1
    sll         $v0, $v0, 2
    sll         $v1, $v1, 2
    andi        $v0, $v0, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $v1, 0xFFC
    lui         $a0, 0xE400
    or          $v1, $v1, $a0
    or          $v0, $v0, $v1
    sw          $v0, 0x0($a1)
    sll         $v0, $a3, 2
    sll         $v1, $t0, 2
    andi        $v0, $v0, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $v1, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sll         $v1, $t1, 21
    sw          $v0, 0x8($a1)
    sll         $v0, $t2, 21
    srl         $v0, $v0, 16
    or          $v1, $v1, $v0
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $v1, 0xC($a1)
    sw          $v0, 0x10($a1)
    sw          $a2, 0x14($a1)
.L800192DC:
    lhu         $t6, 0x56($sp)
    lhu         $v0, 0xE($s3)
    addu        $s1, $s1, $t6
    lw          $t6, 0x44($sp)
    addiu       $s4, $s4, 0x1
    sltu        $v0, $s4, $v0
    bnez        $v0, .L800190C8
    addu        $s5, $s5, $t6
.L800192FC:
    lw          $t6, 0x3C($sp)
    lhu         $v0, 0x10($s3)
    addu        $s2, $s2, $fp
    addiu       $t6, $t6, 0x1
    sltu        $v0, $t6, $v0
    bnez        $v0, .L80019050
    sw          $t6, 0x3C($sp)
    j .L80019700
    nop
.L80019320:
    lhu         $t6, 0x1E($s3)
    addiu       $v1, $zero, 0x800
    addiu       $v0, $zero, 0x10
    bne         $s6, $v0, .L80019338
    sh          $t6, 0x56($sp)
    addiu       $v1, $zero, 0x1000
.L80019338:
    lhu         $t6, 0x56($sp)
    sll         $v0, $t6, 16
    sra         $a2, $v0, 16
    .word       0x00D60018  # mult        $a2, $s6
    .word       0x00001012  # mflo        $v0
    srl         $a1, $v0, 3
    nop
    .word       0x0065001B  # divu        $zero, $v1, $a1
    bnez        $a1, .L80019364
    nop
    break       7
.L80019364:
    .word       0x00001812  # mflo        $v1
    srl         $a1, $v0, 6
    sll         $v0, $a1, 1
    lui         $at, 0x8006
    addu        $at, $at, $v0
    lhu         $v0, 0x4AB0($at)
    addu        $fp, $v1, $zero
    slt         $v1, $v0, $v1
    bnel        $v1, $zero, .L8001938C
    addu        $fp, $v0, $zero
.L8001938C:
    sll         $v0, $fp, 16
    beql        $v0, $zero, .L80019398
    addiu       $fp, $zero, 0x1
.L80019398:
    andi        $v0, $s0, 0xFFFF
    beqz        $v0, .L80019700
    sll         $v1, $t2, 16
    sra         $v1, $v1, 16
    lhu         $t6, 0x6E($sp)
    addu        $s1, $a2, $zero
    addu        $a0, $v1, $s1
    sll         $v0, $t6, 16
    sra         $v0, $v0, 16
    slt         $a0, $v0, $a0
    sw          $v0, 0x13C($sp)
    sll         $v0, $t0, 16
    sra         $v0, $v0, 16
    lhu         $t6, 0x76($sp)
    slt         $v1, $v1, $v0
    and         $a0, $a0, $v1
    sw          $v0, 0x144($sp)
    sw          $a0, 0x14C($sp)
    sll         $v0, $t6, 16
    sra         $s7, $v0, 16
    sll         $v0, $t1, 16
    sra         $s4, $v0, 16
.L800193F0:
    sll         $v1, $fp, 16
    sra         $v1, $v1, 16
    andi        $v0, $s0, 0xFFFF
    slt         $v0, $v0, $v1
    bnel        $v0, $zero, .L80019408
    addu        $fp, $s0, $zero
.L80019408:
    lw          $t6, 0x14C($sp)
    beqz        $t6, .L800196C8
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    sll         $v0, $fp, 16
    sra         $t0, $v0, 16
    addu        $v0, $v1, $t0
    slt         $v0, $s7, $v0
    slt         $v1, $v1, $s4
    and         $v0, $v0, $v1
    beqz        $v0, .L800196C8
    addiu       $v0, $zero, 0x8
    beq         $s6, $v0, .L800194A8
    sltiu       $v0, $s6, 0x9
    beqz        $v0, .L80019458
    addiu       $v0, $zero, 0x4
    beq         $s6, $v0, .L8001946C
    addiu       $a1, $zero, 0x2
    j .L800194F4
    addu        $t0, $s2, $zero
.L80019458:
    addiu       $v0, $zero, 0x10
    beq         $s6, $v0, .L800194B8
    addu        $a1, $zero, $zero
    j .L800194F4
    addu        $t0, $s2, $zero
.L8001946C:
    lw          $a0, 0x4($s3)
    addu        $a2, $s1, $zero
    addu        $a3, $t0, $zero
    addiu       $v0, $zero, 0x2
    sw          $zero, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    jal         func_8000979C
    addu        $a0, $a0, $s5
    j .L800194F4
    addu        $t0, $s2, $zero
.L800194A8:
    addiu       $a1, $zero, 0x2
    lw          $a0, 0x4($s3)
    j .L800194C0
    addiu       $a2, $zero, 0x1
.L800194B8:
    lw          $a0, 0x4($s3)
    addiu       $a2, $zero, 0x2
.L800194C0:
    addu        $a3, $s1, $zero
    addiu       $v0, $zero, 0x2
    sw          $t0, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    jal         func_800094D0
    addu        $a0, $a0, $s5
    addu        $t0, $s2, $zero
.L800194F4:
    addu        $a2, $s2, $fp
    addu        $a0, $a2, $zero
    lhu         $a3, 0x5E($sp)
    lhu         $t6, 0x56($sp)
    addu        $t2, $zero, $zero
    addu        $t1, $zero, $zero
    addu        $a1, $a3, $t6
    lw          $t6, 0x13C($sp)
    sll         $v0, $a3, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t6
    beqz        $v0, .L80019534
    addu        $v1, $a1, $zero
    lhu         $t6, 0x6E($sp)
    subu        $t1, $t6, $a3
    lhu         $a3, 0x6E($sp)
.L80019534:
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $s7
    beqz        $v0, .L80019554
    nop
    lhu         $t6, 0x76($sp)
    lhu         $t0, 0x76($sp)
    subu        $t2, $t6, $s2
.L80019554:
    lw          $t6, 0x144($sp)
    sll         $v0, $a1, 16
    sra         $v0, $v0, 16
    slt         $v0, $t6, $v0
    beqz        $v0, .L80019570
    sll         $v0, $a2, 16
    lhu         $v1, 0x7E($sp)
.L80019570:
    sra         $v0, $v0, 16
    slt         $v0, $s4, $v0
    beqz        $v0, .L80019584
    sll         $t3, $t0, 2
    lhu         $a0, 0x86($sp)
.L80019584:
    sll         $t0, $a3, 2
    addiu       $v0, $v1, -0x1
    addiu       $v1, $a0, -0x1
    sll         $a0, $v0, 2
    sll         $a3, $v1, 2
    sll         $t4, $t1, 5
    lw          $v1, 0x30($s3)
    lui         $v0, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L80019640
    sll         $t1, $t2, 5
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $a2, 0x1000
    ori         $a2, $a2, 0xFC00
    andi        $a0, $a0, 0xFFC
    sll         $a0, $a0, 12
    lui         $v1, 0xE400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a3, 0xFFC
    or          $v0, $v0, $v1
    or          $a0, $a0, $v0
    andi        $v0, $t0, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $t3, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sll         $v1, $t4, 16
    sw          $v0, 0x8($a1)
    sll         $v0, $fp, 16
    sra         $v0, $v0, 11
    addiu       $v0, $v0, -0x20
    andi        $v0, $v0, 0xFFFF
    or          $v1, $v1, $v0
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $a0, 0x0($a1)
    j .L800196C0
    sw          $v1, 0xC($a1)
.L80019640:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    lui         $a2, 0x1000
    ori         $a2, $a2, 0x400
    andi        $a0, $a0, 0xFFC
    sll         $a0, $a0, 12
    lui         $v1, 0xE400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a3, 0xFFC
    or          $v0, $v0, $v1
    or          $a0, $a0, $v0
    andi        $v0, $t0, 0xFFC
    sll         $v0, $v0, 12
    andi        $v1, $t3, 0xFFC
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($a1)
    sll         $v0, $t4, 16
    andi        $v1, $t1, 0xFFE0
    or          $v0, $v0, $v1
    sw          $v0, 0xC($a1)
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $a0, 0x0($a1)
.L800196C0:
    sw          $v0, 0x10($a1)
    sw          $a2, 0x14($a1)
.L800196C8:
    sll         $v0, $fp, 16
    sra         $v0, $v0, 16
    .word       0x02220018  # mult        $s1, $v0
    .word       0x00001012  # mflo        $v0
    nop
    nop
    .word       0x00560018  # mult        $v0, $s6
    .word       0x00001012  # mflo        $v0
    subu        $s0, $s0, $fp
    srl         $v0, $v0, 3
    addu        $s5, $s5, $v0
    andi        $v0, $s0, 0xFFFF
    bnez        $v0, .L800193F0
    addu        $s2, $s2, $fp
.L80019700:
    lw          $v0, 0x30($s3)
    andi        $v0, $v0, 0x100
    beqz        $v0, .L80019764
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lw          $t6, 0x34($sp)
    sll         $v1, $v0, 4
    lw          $a0, 0x2C($t6)
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $a0, $a0, $v1
    bgtz        $a0, .L80019764
    sw          $a0, 0x2C($t6)
.L80019738:
    lw          $t6, 0x34($sp)
    lw          $v0, 0x2C($t6)
    lw          $v1, 0x30($t6)
    lw          $a0, 0x34($sp)
    addu        $v0, $v0, $v1
    jal         func_8001A520
    sw          $v0, 0x2C($t6)
    lw          $t6, 0x34($sp)
    lw          $v0, 0x2C($t6)
    blez        $v0, .L80019738
    nop
.L80019764:
    lw          $ra, 0x194($sp)
    lw          $fp, 0x190($sp)
    lw          $s7, 0x18C($sp)
    lw          $s6, 0x188($sp)
    lw          $s5, 0x184($sp)
    lw          $s4, 0x180($sp)
    lw          $s3, 0x17C($sp)
    lw          $s2, 0x178($sp)
    lw          $s1, 0x174($sp)
    lw          $s0, 0x170($sp)
    addiu       $sp, $sp, 0x198
    jr          $ra
    nop
.end ui_scene_render
