.text
.align 2
.set noreorder
.globl display_tile_size_set
.ent display_tile_size_set
display_tile_size_set:
    addu        $t0, $a0, $zero
    sll         $v0, $t0, 2
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t0
    sll         $v1, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77D4($at)
    addu        $t1, $a1, $zero
    lw          $t2, 0x10($sp)
    bne         $v0, $t1, .L8000AA38
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77D0($at)
    bne         $v0, $a2, .L8000AA38
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77CC($at)
    bne         $v0, $a3, .L8000AA38
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77C8($at)
    beq         $v0, $t2, .L8000AACC
    nop
.L8000AA38:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $v1, $t1, 0xFFF
    sll         $v1, $v1, 12
    lui         $a0, 0xF200
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a2, 0xFFF
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a1)
    andi        $v1, $t0, 0x7
    sll         $v1, $v1, 24
    andi        $v0, $a3, 0xFFF
    sll         $v0, $v0, 12
    or          $v1, $v1, $v0
    andi        $v0, $t2, 0xFFF
    or          $v1, $v1, $v0
    sll         $v0, $t0, 2
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    sw          $v1, 0x4($a1)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t1, -0x77D4($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $a2, -0x77D0($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $a3, -0x77CC($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t2, -0x77C8($at)
.L8000AACC:
    jr          $ra
    nop
.end display_tile_size_set
