.text
.align 2
.set noreorder
.globl object_lookup_process
.ent object_lookup_process
object_lookup_process:
    addiu       $sp, $sp, -0x40
    sw          $fp, 0x38($sp)
    addu        $fp, $a0, $zero
    addu        $t5, $zero, $zero
    addu        $t9, $zero, $zero
    sw          $s7, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    sw          $a2, 0x4($sp)
    lw          $v0, 0x1C8($fp)
    lw          $t7, 0x0($a1)
    lw          $s7, 0x4($a1)
    lw          $s6, 0x8($a1)
    lw          $v1, 0x18($v0)
    addu        $a2, $zero, $zero
    sw          $s6, 0xC($sp)
    lw          $s4, 0xC($a1)
    lw          $s5, 0x10($a1)
    lw          $t8, 0x14($a1)
    slt         $v0, $s7, $t7
    bnez        $v0, .L80061910
    addu        $s0, $zero, $zero
    sll         $s6, $s5, 1
    sw          $s6, 0x14($sp)
    sll         $v0, $t7, 3
    addiu       $s3, $v0, 0x4
    sll         $v0, $t7, 2
    addu        $s2, $v0, $v1
.L8006184C:
    lw          $t2, 0xC($sp)
    slt         $v0, $s4, $t2
    bnel        $v0, $zero, .L80061900
    addiu       $s3, $s3, 0x8
    addu        $s1, $s3, $zero
    lw          $v0, 0x0($s2)
    sll         $v1, $t2, 2
    addiu       $t4, $v1, 0x2
    sll         $v1, $t2, 6
    addu        $t3, $v1, $v0
.L80061874:
    lw          $s6, 0x14($sp)
    addu        $a3, $s5, $zero
    slt         $v0, $t8, $a3
    bnez        $v0, .L800618E8
    addu        $t1, $t3, $s6
    addu        $t6, $t4, $zero
    sll         $v0, $a3, 3
    addiu       $t0, $v0, 0x4
.L80061894:
    lhu         $a1, 0x0($t1)
    beqz        $a1, .L800618D8
    addiu       $t1, $t1, 0x2
    .word       0x02250018  # mult        $s1, $a1
    .word       0x00001012  # mflo        $v0
    nop
    nop
    .word       0x01C50018  # mult        $t6, $a1
    .word       0x00001812  # mflo        $v1
    nop
    nop
    .word       0x01050018  # mult        $t0, $a1
    .word       0x00002012  # mflo        $a0
    addu        $t5, $t5, $a1
    addu        $t9, $t9, $v0
    addu        $a2, $a2, $v1
    addu        $s0, $s0, $a0
.L800618D8:
    addiu       $a3, $a3, 0x1
    slt         $v0, $t8, $a3
    beqz        $v0, .L80061894
    addiu       $t0, $t0, 0x8
.L800618E8:
    addiu       $t4, $t4, 0x4
    addiu       $t2, $t2, 0x1
    slt         $v0, $s4, $t2
    beqz        $v0, .L80061874
    addiu       $t3, $t3, 0x40
    addiu       $s3, $s3, 0x8
.L80061900:
    addiu       $t7, $t7, 0x1
    slt         $v0, $s7, $t7
    beqz        $v0, .L8006184C
    addiu       $s2, $s2, 0x4
.L80061910:
    sra         $v1, $t5, 1
    addu        $a0, $t9, $v1
    .word       0x008D001A  # div         $zero, $a0, $t5
    bnez        $t5, .L80061928
    nop
    break       7
.L80061928:
    addiu       $at, $zero, -0x1
    bne         $t5, $at, .L80061940
    lui         $at, 0x8000
    bne         $a0, $at, .L80061940
    nop
    break       6
.L80061940:
    .word       0x00002012  # mflo        $a0
    addu        $a1, $a2, $v1
    nop
    .word       0x00AD001A  # div         $zero, $a1, $t5
    bnez        $t5, .L8006195C
    nop
    break       7
.L8006195C:
    addiu       $at, $zero, -0x1
    bne         $t5, $at, .L80061974
    lui         $at, 0x8000
    bne         $a1, $at, .L80061974
    nop
    break       6
.L80061974:
    .word       0x00002812  # mflo        $a1
    addu        $v1, $s0, $v1
    nop
    .word       0x006D001A  # div         $zero, $v1, $t5
    bnez        $t5, .L80061990
    nop
    break       7
.L80061990:
    addiu       $at, $zero, -0x1
    bne         $t5, $at, .L800619A8
    lui         $at, 0x8000
    bne         $v1, $at, .L800619A8
    nop
    break       6
.L800619A8:
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x88($fp)
    lw          $s6, 0x4($sp)
    lw          $v0, 0x0($v0)
    addu        $v0, $v0, $s6
    sb          $a0, 0x0($v0)
    lw          $v0, 0x88($fp)
    lw          $v0, 0x4($v0)
    addu        $v0, $v0, $s6
    sb          $a1, 0x0($v0)
    lw          $v0, 0x88($fp)
    lw          $v0, 0x8($v0)
    addu        $v0, $v0, $s6
    sb          $v1, 0x0($v0)
    lw          $fp, 0x38($sp)
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
.end object_lookup_process
