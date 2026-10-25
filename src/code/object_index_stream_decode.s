.text
.align 2
.set noreorder
.globl object_index_stream_decode
.ent object_index_stream_decode
object_index_stream_decode:
    lw          $t6, 0x0($a1)
    lw          $t4, 0x4($a1)
    lw          $t7, 0x8($a1)
    lw          $t2, 0xC($a1)
    lw          $v0, 0x1C8($a0)
    lw          $t5, 0x10($a1)
    lw          $t1, 0x14($a1)
    lw          $t9, 0x18($v0)
    slt         $v0, $t6, $t4
    beqz        $v0, .L800612C4
    slt         $v0, $t4, $t6
    addu        $a3, $t6, $zero
    bnez        $v0, .L8006122C
    slt         $v0, $t6, $t4
    sll         $t8, $t5, 1
    sll         $v0, $a3, 2
    addu        $t3, $v0, $t9
.L800611AC:
    addu        $a2, $t7, $zero
    slt         $v0, $t2, $a2
    bnel        $v0, $zero, .L8006121C
    addiu       $a3, $a3, 0x1
    addu        $t0, $t3, $zero
.L800611C0:
    lw          $v0, 0x0($t0)
    addu        $a0, $t5, $zero
    sll         $v1, $a2, 6
    addu        $v0, $v0, $v1
    addu        $v1, $v0, $t8
    slt         $v0, $t1, $a0
    bnel        $v0, $zero, .L8006120C
    addiu       $a2, $a2, 0x1
.L800611E0:
    lhu         $v0, 0x0($v1)
    beqz        $v0, .L800611F8
    addiu       $v1, $v1, 0x2
    addu        $t6, $a3, $zero
    j .L80061228
    sw          $t6, 0x0($a1)
.L800611F8:
    addiu       $a0, $a0, 0x1
    slt         $v0, $t1, $a0
    beqz        $v0, .L800611E0
    nop
    addiu       $a2, $a2, 0x1
.L8006120C:
    slt         $v0, $t2, $a2
    beqz        $v0, .L800611C0
    nop
    addiu       $a3, $a3, 0x1
.L8006121C:
    slt         $v0, $t4, $a3
    beqz        $v0, .L800611AC
    addiu       $t3, $t3, 0x4
.L80061228:
    slt         $v0, $t6, $t4
.L8006122C:
    beqz        $v0, .L800612C4
    slt         $v0, $t4, $t6
    bnez        $v0, .L800612C4
    addu        $a3, $t4, $zero
    sll         $t8, $t5, 1
    sll         $v0, $t4, 2
    addu        $t3, $v0, $t9
.L80061248:
    addu        $a2, $t7, $zero
    slt         $v0, $t2, $a2
    bnel        $v0, $zero, .L800612B8
    addiu       $a3, $a3, -0x1
    addu        $t0, $t3, $zero
.L8006125C:
    lw          $v0, 0x0($t0)
    addu        $a0, $t5, $zero
    sll         $v1, $a2, 6
    addu        $v0, $v0, $v1
    addu        $v1, $v0, $t8
    slt         $v0, $t1, $a0
    bnel        $v0, $zero, .L800612A8
    addiu       $a2, $a2, 0x1
.L8006127C:
    lhu         $v0, 0x0($v1)
    beqz        $v0, .L80061294
    addiu       $v1, $v1, 0x2
    addu        $t4, $a3, $zero
    j .L800612C4
    sw          $t4, 0x4($a1)
.L80061294:
    addiu       $a0, $a0, 0x1
    slt         $v0, $t1, $a0
    beqz        $v0, .L8006127C
    nop
    addiu       $a2, $a2, 0x1
.L800612A8:
    slt         $v0, $t2, $a2
    beqz        $v0, .L8006125C
    nop
    addiu       $a3, $a3, -0x1
.L800612B8:
    slt         $v0, $a3, $t6
    beqz        $v0, .L80061248
    addiu       $t3, $t3, -0x4
.L800612C4:
    slt         $v0, $t7, $t2
    beqz        $v0, .L800613F8
    slt         $v0, $t2, $t7
    addu        $a2, $t7, $zero
    bnez        $v0, .L80061364
    slt         $v0, $t7, $t2
    sll         $t8, $t5, 1
    addu        $a3, $t6, $zero
.L800612E4:
    slt         $v0, $t4, $a3
    bnel        $v0, $zero, .L80061354
    addiu       $a2, $a2, 0x1
    sll         $t3, $a2, 6
    sll         $v0, $a3, 2
    addu        $t0, $v0, $t9
.L800612FC:
    lw          $v0, 0x0($t0)
    addu        $a0, $t5, $zero
    addu        $v0, $v0, $t3
    addu        $v1, $v0, $t8
    slt         $v0, $t1, $a0
    bnel        $v0, $zero, .L80061344
    addiu       $a3, $a3, 0x1
.L80061318:
    lhu         $v0, 0x0($v1)
    beqz        $v0, .L80061330
    addiu       $v1, $v1, 0x2
    addu        $t7, $a2, $zero
    j .L80061360
    sw          $t7, 0x8($a1)
.L80061330:
    addiu       $a0, $a0, 0x1
    slt         $v0, $t1, $a0
    beqz        $v0, .L80061318
    nop
    addiu       $a3, $a3, 0x1
.L80061344:
    slt         $v0, $t4, $a3
    beqz        $v0, .L800612FC
    addiu       $t0, $t0, 0x4
    addiu       $a2, $a2, 0x1
.L80061354:
    slt         $v0, $t2, $a2
    beql        $v0, $zero, .L800612E4
    addu        $a3, $t6, $zero
.L80061360:
    slt         $v0, $t7, $t2
.L80061364:
    beqz        $v0, .L800613F8
    slt         $v0, $t2, $t7
    bnez        $v0, .L800613F8
    addu        $a2, $t2, $zero
    sll         $t8, $t5, 1
    addu        $a3, $t6, $zero
.L8006137C:
    slt         $v0, $t4, $a3
    bnel        $v0, $zero, .L800613EC
    addiu       $a2, $a2, -0x1
    sll         $t3, $a2, 6
    sll         $v0, $a3, 2
    addu        $t0, $v0, $t9
.L80061394:
    lw          $v0, 0x0($t0)
    addu        $a0, $t5, $zero
    addu        $v0, $v0, $t3
    addu        $v1, $v0, $t8
    slt         $v0, $t1, $a0
    bnel        $v0, $zero, .L800613DC
    addiu       $a3, $a3, 0x1
.L800613B0:
    lhu         $v0, 0x0($v1)
    beqz        $v0, .L800613C8
    addiu       $v1, $v1, 0x2
    addu        $t2, $a2, $zero
    j .L800613F8
    sw          $t2, 0xC($a1)
.L800613C8:
    addiu       $a0, $a0, 0x1
    slt         $v0, $t1, $a0
    beqz        $v0, .L800613B0
    nop
    addiu       $a3, $a3, 0x1
.L800613DC:
    slt         $v0, $t4, $a3
    beqz        $v0, .L80061394
    addiu       $t0, $t0, 0x4
    addiu       $a2, $a2, -0x1
.L800613EC:
    slt         $v0, $a2, $t7
    beql        $v0, $zero, .L8006137C
    addu        $a3, $t6, $zero
.L800613F8:
    slt         $v0, $t5, $t1
    beqz        $v0, .L80061524
    addu        $a0, $t5, $zero
    slt         $v0, $t1, $a0
    bnez        $v0, .L80061494
    slt         $v0, $t5, $t1
    sll         $t8, $t7, 6
    addu        $a3, $t6, $zero
.L80061418:
    slt         $v0, $t4, $a3
    bnel        $v0, $zero, .L80061484
    addiu       $a0, $a0, 0x1
    sll         $t3, $a0, 1
    sll         $v0, $a3, 2
    addu        $t0, $v0, $t9
.L80061430:
    lw          $v0, 0x0($t0)
    addu        $a2, $t7, $zero
    addu        $v0, $v0, $t8
    addu        $v1, $v0, $t3
    slt         $v0, $t2, $a2
    bnel        $v0, $zero, .L80061474
    addiu       $a3, $a3, 0x1
.L8006144C:
    lhu         $v0, 0x0($v1)
    beql        $v0, $zero, .L80061464
    addiu       $a2, $a2, 0x1
    addu        $t5, $a0, $zero
    j .L80061490
    sw          $t5, 0x10($a1)
.L80061464:
    slt         $v0, $t2, $a2
    beqz        $v0, .L8006144C
    addiu       $v1, $v1, 0x40
    addiu       $a3, $a3, 0x1
.L80061474:
    slt         $v0, $t4, $a3
    beqz        $v0, .L80061430
    addiu       $t0, $t0, 0x4
    addiu       $a0, $a0, 0x1
.L80061484:
    slt         $v0, $t1, $a0
    beql        $v0, $zero, .L80061418
    addu        $a3, $t6, $zero
.L80061490:
    slt         $v0, $t5, $t1
.L80061494:
    beqz        $v0, .L80061524
    slt         $v0, $t1, $t5
    bnez        $v0, .L80061524
    addu        $a0, $t1, $zero
    sll         $t8, $t7, 6
    addu        $a3, $t6, $zero
.L800614AC:
    slt         $v0, $t4, $a3
    bnel        $v0, $zero, .L80061518
    addiu       $a0, $a0, -0x1
    sll         $t3, $a0, 1
    sll         $v0, $a3, 2
    addu        $t0, $v0, $t9
.L800614C4:
    lw          $v0, 0x0($t0)
    addu        $a2, $t7, $zero
    addu        $v0, $v0, $t8
    addu        $v1, $v0, $t3
    slt         $v0, $t2, $a2
    bnel        $v0, $zero, .L80061508
    addiu       $a3, $a3, 0x1
.L800614E0:
    lhu         $v0, 0x0($v1)
    beql        $v0, $zero, .L800614F8
    addiu       $a2, $a2, 0x1
    addu        $t1, $a0, $zero
    j .L80061524
    sw          $t1, 0x14($a1)
.L800614F8:
    slt         $v0, $t2, $a2
    beqz        $v0, .L800614E0
    addiu       $v1, $v1, 0x40
    addiu       $a3, $a3, 0x1
.L80061508:
    slt         $v0, $t4, $a3
    beqz        $v0, .L800614C4
    addiu       $t0, $t0, 0x4
    addiu       $a0, $a0, -0x1
.L80061518:
    slt         $v0, $a0, $t5
    beqz        $v0, .L800614AC
    addu        $a3, $t6, $zero
.L80061524:
    subu        $a0, $t4, $t6
    sll         $a0, $a0, 4
    .word       0x00840018  # mult        $a0, $a0
    .word       0x00002012  # mflo        $a0
    subu        $v0, $t2, $t7
    sll         $v1, $v0, 2
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001012  # mflo        $v0
    subu        $v1, $t1, $t5
    sll         $v1, $v1, 3
    .word       0x00630018  # mult        $v1, $v1
    .word       0x00001812  # mflo        $v1
    addu        $t3, $zero, $zero
    addu        $a3, $t6, $zero
    addu        $a0, $a0, $v0
    addu        $a0, $a0, $v1
    slt         $v0, $t4, $a3
    bnez        $v0, .L800615EC
    sw          $a0, 0x18($a1)
    sll         $t8, $t5, 1
    sll         $v0, $a3, 2
    addu        $t6, $v0, $t9
.L80061584:
    addu        $a2, $t7, $zero
    slt         $v0, $t2, $a2
    bnel        $v0, $zero, .L800615E0
    addiu       $a3, $a3, 0x1
    lw          $v1, 0x0($t6)
    sll         $v0, $a2, 6
    addu        $t0, $v0, $v1
.L800615A0:
    addu        $a0, $t5, $zero
    slt         $v0, $t1, $a0
    bnez        $v0, .L800615CC
    addu        $v1, $t0, $t8
.L800615B0:
    lhu         $v0, 0x0($v1)
    addiu       $a0, $a0, 0x1
    sltu        $v0, $zero, $v0
    addu        $t3, $t3, $v0
    slt         $v0, $t1, $a0
    beqz        $v0, .L800615B0
    addiu       $v1, $v1, 0x2
.L800615CC:
    addiu       $a2, $a2, 0x1
    slt         $v0, $t2, $a2
    beqz        $v0, .L800615A0
    addiu       $t0, $t0, 0x40
    addiu       $a3, $a3, 0x1
.L800615E0:
    slt         $v0, $t4, $a3
    beqz        $v0, .L80061584
    addiu       $t6, $t6, 0x4
.L800615EC:
    jr          $ra
    sw          $t3, 0x1C($a1)
.end object_index_stream_decode
