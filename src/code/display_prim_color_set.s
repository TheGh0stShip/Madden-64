.text
.align 2
.set noreorder
.globl display_prim_color_set
.ent display_prim_color_set
display_prim_color_set:
    addu        $t0, $a0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x78DC($v0)
    lw          $t2, 0x10($sp)
    lw          $t3, 0x14($sp)
    bne         $v0, $t0, .L80009F4C
    addu        $t1, $a1, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x78D8($v0)
    bne         $v0, $t1, .L80009F4C
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x78D4($v0)
    bne         $v0, $a2, .L80009F4C
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x78D0($v0)
    bne         $v0, $a3, .L80009F4C
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x78CC($v0)
    bne         $v0, $t2, .L80009F4C
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x78C8($v0)
    beq         $v0, $t3, .L80009FD4
    nop
.L80009F4C:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $v1, $t0, 0xFF
    sll         $v1, $v1, 8
    lui         $a0, 0xFA00
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $t1, 0xFF
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a1)
    sll         $v1, $a2, 24
    andi        $v0, $a3, 0xFF
    sll         $v0, $v0, 16
    or          $v1, $v1, $v0
    andi        $v0, $t2, 0xFF
    sll         $v0, $v0, 8
    or          $v1, $v1, $v0
    andi        $v0, $t3, 0xFF
    or          $v1, $v1, $v0
    sw          $v1, 0x4($a1)
    lui         $at, 0x8009
    sw          $t0, -0x78DC($at)
    lui         $at, 0x8009
    sw          $t1, -0x78D8($at)
    lui         $at, 0x8009
    sw          $a2, -0x78D4($at)
    lui         $at, 0x8009
    sw          $a3, -0x78D0($at)
    lui         $at, 0x8009
    sw          $t2, -0x78CC($at)
    lui         $at, 0x8009
    sw          $t3, -0x78C8($at)
.L80009FD4:
    jr          $ra
    nop
.end display_prim_color_set
