.set noreorder
.set noat
.text

.globl boot_cache_invalidate
.ent boot_cache_invalidate
boot_cache_invalidate:
    lui     $t0, 0x8000
    addiu   $t2, $zero, 0x2000
    addu    $t1, $t0, $t2
    addiu   $t1, $t1, -0x10
1:
    cache   0x01, 0($t0)
    sltu    $at, $t0, $t1
    bnez    $at, 1b
     addiu  $t0, $t0, 0x10
    jr      $ra
     nop
.end boot_cache_invalidate
