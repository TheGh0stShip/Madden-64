.text
.align 2
.set noreorder
.globl func_8005AE90
.ent func_8005AE90
func_8005AE90:
    addiu       $sp, $sp, -0x18
    addu        $t6, $a0, $zero
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $t9, 0x1A4($t6)
    lw          $v0, 0x20($t6)
    lw          $v1, 0x138($t6)
    lw          $a0, 0xD8($t6)
    blez        $v0, .L8005AFBC
    addu        $t5, $zero, $zero
    addiu       $s1, $v1, 0x1
    addiu       $s0, $v1, 0x2
    addiu       $t4, $a0, 0x24
.L8005AEC4:
    lw          $v1, -0x18($t4)
    lw          $v0, 0x0($t4)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x138($t6)
    nop
    .word       0x0062001A  # div         $zero, $v1, $v0
    bnez        $v0, .L8005AEEC
    nop
    break       7
.L8005AEEC:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005AF04
    lui         $at, 0x8000
    bne         $v1, $at, .L8005AF04
    nop
    break       6
.L8005AF04:
    .word       0x00005812  # mflo        $t3
    lw          $v0, 0x38($t9)
    lw          $a0, 0x3C($t9)
    sll         $v1, $t5, 2
    addu        $v0, $v1, $v0
    lw          $t1, 0x0($v0)
    addu        $v1, $v1, $a0
    lw          $a3, 0x0($v1)
    blez        $t3, .L8005AFA8
    addu        $a2, $zero, $zero
    .word       0x01710018  # mult        $t3, $s1
    .word       0x0000C012  # mflo        $t8
    addu        $t2, $a3, $zero
    addu        $t0, $t1, $zero
    .word       0x01700018  # mult        $t3, $s0
    .word       0x00007812  # mflo        $t7
.L8005AF44:
    subu        $a0, $a2, $t3
    addu        $v1, $t8, $a2
    sll         $v1, $v1, 2
    addu        $v0, $v1, $t1
    lw          $a1, 0x0($v0)
    sll         $a0, $a0, 2
    addu        $v0, $a0, $t1
    addu        $v1, $v1, $a3
    addu        $a0, $a0, $a3
    sw          $a1, 0x0($v0)
    lw          $v0, 0x0($v1)
    addu        $v1, $t7, $a2
    addiu       $a2, $a2, 0x1
    sll         $v1, $v1, 2
    sw          $v0, 0x0($a0)
    lw          $a0, 0x0($t0)
    addiu       $t0, $t0, 0x4
    addu        $v0, $v1, $t1
    sw          $a0, 0x0($v0)
    lw          $v0, 0x0($t2)
    addu        $v1, $v1, $a3
    sw          $v0, 0x0($v1)
    slt         $v0, $a2, $t3
    bnez        $v0, .L8005AF44
    addiu       $t2, $t2, 0x4
.L8005AFA8:
    lw          $v0, 0x20($t6)
    addiu       $t5, $t5, 0x1
    slt         $v0, $t5, $v0
    bnez        $v0, .L8005AEC4
    addiu       $t4, $t4, 0x54
.L8005AFBC:
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8005AE90
