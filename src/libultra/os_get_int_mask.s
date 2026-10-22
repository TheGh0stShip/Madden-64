.set noreorder
.set noat
.text

.globl osGetIntMask
.ent osGetIntMask
osGetIntMask:
    mfc0    $v0, $12
    andi    $v0, $v0, 0xFF01
    lui     $t0, %hi(D_80074DC0)
    addiu   $t0, $t0, %lo(D_80074DC0)
    lw      $t1, 0($t0)
    addiu   $at, $zero, -1
    xor     $t0, $t1, $at
    andi    $t0, $t0, 0xFF00
    or      $v0, $v0, $t0
    lui     $t1, 0xA430
    lw      $t1, 0xC($t1)
    beqz    $t1, 1f
     lui    $t0, %hi(D_80074DC0)
    addiu   $t0, $t0, %lo(D_80074DC0)
    lw      $t0, 0($t0)
    srl     $t0, $t0, 16
    addiu   $at, $zero, -1
    xor     $t0, $t0, $at
    andi    $t0, $t0, 0x3F
    or      $t1, $t1, $t0
1:
    sll     $t2, $t1, 16
    or      $v0, $v0, $t2
    jr      $ra
     nop
.end osGetIntMask
