.text
.align 2
.set noreorder
.globl matrix_stack_duplicate
.ent matrix_stack_duplicate
matrix_stack_duplicate:
    lui         $a0, 0x8009
    lw          $a0, -0x4CA4($a0)
    addiu       $a1, $a0, 0x1
    sll         $v1, $a1, 1
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 4
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E68($at)
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 4
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E68($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E6C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E6C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E70($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E70($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E74($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E74($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E78($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E78($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E7C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E7C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E80($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E80($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E84($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E84($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E88($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E88($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E8C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E8C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x5E90($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $a0, 0x5E90($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x5E94($at)
    lui         $at, 0x8009
    sw          $a1, -0x4CA4($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, 0x5E94($at)
    jr          $ra
    nop
.end matrix_stack_duplicate
