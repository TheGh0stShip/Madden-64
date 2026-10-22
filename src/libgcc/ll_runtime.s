.set noreorder
.set noat
.text

.globl __ull_rshift
.ent __ull_rshift
__ull_rshift:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    dsrlv   $v0, $t6, $t7
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ull_rshift

.globl __ull_rem
.ent __ull_rem
__ull_rem:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    ddivu   $zero, $t6, $t7
    bnez    $t7, 1f
     nop
    break   7
1:
    mfhi    $v0
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ull_rem

.globl __ull_div
.ent __ull_div
__ull_div:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    ddivu   $zero, $t6, $t7
    bnez    $t7, 2f
     nop
    break   7
2:
    mflo    $v0
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ull_div

.globl __ll_lshift
.ent __ll_lshift
__ll_lshift:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    dsllv   $v0, $t6, $t7
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ll_lshift

.globl __ll_rem
.ent __ll_rem
__ll_rem:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    ddivu   $zero, $t6, $t7
    bnez    $t7, 3f
     nop
    break   7
3:
    mfhi    $v0
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ll_rem

.globl __ll_div
.ent __ll_div
__ll_div:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    ddiv    $zero, $t6, $t7
    nop
    bnez    $t7, 4f
     nop
    break   7
4:
    daddiu  $at, $zero, -1
    bne     $t7, $at, 5f
     daddiu $at, $zero, 1
    dsll32  $at, $at, 31
    bne     $t6, $at, 5f
     nop
    break   6
5:
    mflo    $v0
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ll_div

.globl __ll_mul
.ent __ll_mul
__ll_mul:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    dmultu  $t6, $t7
    mflo    $v0
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ll_mul

.globl __ull_divremi
.ent __ull_divremi
__ull_divremi:
    lh      $t7, 0x12($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t6, 8($sp)
    or      $t8, $t7, $zero
    or      $t9, $t8, $zero
    ddivu   $zero, $t6, $t9
    bnez    $t9, 6f
     nop
    break   7
6:
    mflo    $t0
    sd      $t0, 0($a0)
    lh      $t2, 0x12($sp)
    ld      $t1, 8($sp)
    or      $t3, $t2, $zero
    or      $t4, $t3, $zero
    ddivu   $zero, $t1, $t4
    bnez    $t4, 7f
     nop
    break   7
7:
    mfhi    $t5
    sd      $t5, 0($a1)
    jr      $ra
     nop
.end __ull_divremi

.globl __ll_mod
.ent __ll_mod
__ll_mod:
    addiu   $sp, $sp, -8
    sw      $a0, 8($sp)
    sw      $a1, 0xC($sp)
    sw      $a2, 0x10($sp)
    sw      $a3, 0x14($sp)
    ld      $t7, 0x10($sp)
    ld      $t6, 8($sp)
    ddiv    $zero, $t6, $t7
    nop
    bnez    $t7, 8f
     nop
    break   7
8:
    daddiu  $at, $zero, -1
    bne     $t7, $at, 9f
     daddiu $at, $zero, 1
    dsll32  $at, $at, 31
    bne     $t6, $at, 9f
     nop
    break   6
9:
    mfhi    $t8
    sd      $t8, 0($sp)
    bgez    $t8, 10f
     nop
    bgtz    $t7, 12f
     nop
10:
    ld      $t9, 0($sp)
    blez    $t9, 11f
     nop
    ld      $t0, 0x10($sp)
    bgez    $t0, 11f
     nop
12:
    ld      $t1, 0($sp)
    ld      $t2, 0x10($sp)
    daddu   $t3, $t1, $t2
    sd      $t3, 0($sp)
11:
    lw      $v0, 0($sp)
    lw      $v1, 4($sp)
    jr      $ra
     addiu  $sp, $sp, 8
.end __ll_mod

.globl __ll_rshift
.ent __ll_rshift
__ll_rshift:
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $a2, 8($sp)
    sw      $a3, 0xC($sp)
    ld      $t7, 8($sp)
    ld      $t6, 0($sp)
    dsrav   $v0, $t6, $t7
    dsll32  $v1, $v0, 0
    dsra32  $v1, $v1, 0
    jr      $ra
     dsra32 $v0, $v0, 0
.end __ll_rshift
