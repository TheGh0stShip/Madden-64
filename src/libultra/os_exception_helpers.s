.set noreorder
.set noat
.text

.globl send_mesg
.ent send_mesg
send_mesg:
    lui     $t2, %hi(D_8007D288)
    addiu   $t2, $t2, %lo(D_8007D288)
    addu    $t2, $t2, $a0
    lw      $t1, 0($t2)
    or      $s2, $ra, $zero
    beqz    $t1, 3f
     nop
    lw      $t3, 8($t1)
    lw      $t4, 0x10($t1)
    slt     $at, $t3, $t4
    beqz    $at, 3f
     nop
    lw      $t5, 0xC($t1)
    addu    $t5, $t5, $t3
    div     $zero, $t5, $t4
    bnez    $t4, 1f
     nop
    break   7
1:
    addiu   $at, $zero, -1
    bne     $t4, $at, 2f
     lui    $at, 0x8000
    bne     $t5, $at, 2f
     nop
    break   6
2:
    lw      $t4, 0x14($t1)
    mfhi    $t5
    sll     $t5, $t5, 2
    addu    $t4, $t4, $t5
    lw      $t5, 4($t2)
    addiu   $t2, $t3, 1
    sw      $t5, 0($t4)
    sw      $t2, 8($t1)
    lw      $t2, 0($t1)
    lw      $t3, 0($t2)
    beqz    $t3, 3f
     nop
    jal     __osPopThread
     or     $a0, $t1, $zero
    or      $t2, $v0, $zero
    lui     $a0, %hi(D_80074E28)
    or      $a1, $t2, $zero
    jal     __osEnqueueThread
     addiu  $a0, $a0, %lo(D_80074E28)
3:
    jr      $s2
     nop
.end send_mesg

.globl handle_CpU
.ent handle_CpU
handle_CpU:
    lui     $at, 0x3000
    and     $t1, $t0, $at
    srl     $t1, $t1, 28
    addiu   $t2, $zero, 1
    .word   0x152AFFC2
     nop
    lw      $k1, 0x118($k0)
    lui     $at, 0x2000
    addiu   $t1, $zero, 1
    or      $k1, $k1, $at
    sw      $t1, 0x18($k0)
    .word   0x1000FFB5
     sw     $k1, 0x118($k0)
.end handle_CpU
