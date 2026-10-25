.text
.align 2
.set noreorder
.globl display_texture_configure
.ent display_texture_configure
display_texture_configure:
    addu        $t1, $a0, $zero
    lw          $t0, 0x10($sp)
    lw          $t5, 0x14($sp)
    lw          $t6, 0x18($sp)
    lw          $t7, 0x1C($sp)
    lw          $t8, 0x20($sp)
    lw          $t9, 0x24($sp)
    sll         $v0, $t0, 2
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t0
    sll         $v1, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x7800($at)
    lw          $t3, 0x28($sp)
    lw          $t4, 0x2C($sp)
    bne         $v0, $t1, .L8000ABE8
    addu        $t2, $a1, $zero
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77FC($at)
    bne         $v0, $t2, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77F8($at)
    bne         $v0, $a2, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77F4($at)
    bne         $v0, $a3, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77F0($at)
    bne         $v0, $t5, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77EC($at)
    bne         $v0, $t6, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77E8($at)
    bne         $v0, $t7, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77E4($at)
    bne         $v0, $t8, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77E0($at)
    bne         $v0, $t9, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77DC($at)
    bne         $v0, $t3, .L8000ABE8
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77D8($at)
    beq         $v0, $t4, .L8000AD24
    nop
.L8000ABE8:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $v1, $t1, 0x7
    sll         $v1, $v1, 21
    lui         $a0, 0xF500
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $t2, 0x3
    sll         $v0, $v0, 19
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    andi        $v0, $a2, 0x1FF
    sll         $v0, $v0, 9
    or          $v1, $v1, $v0
    andi        $v0, $a3, 0x1FF
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a1)
    andi        $v1, $t0, 0x7
    sll         $v1, $v1, 24
    andi        $v0, $t5, 0xF
    sll         $v0, $v0, 20
    or          $v1, $v1, $v0
    andi        $v0, $t6, 0x3
    sll         $v0, $v0, 18
    or          $v1, $v1, $v0
    andi        $v0, $t7, 0xF
    sll         $v0, $v0, 14
    or          $v1, $v1, $v0
    andi        $v0, $t8, 0xF
    sll         $v0, $v0, 10
    or          $v1, $v1, $v0
    andi        $v0, $t9, 0x3
    sll         $v0, $v0, 8
    or          $v1, $v1, $v0
    andi        $v0, $t3, 0xF
    sll         $v0, $v0, 4
    or          $v1, $v1, $v0
    andi        $v0, $t4, 0xF
    or          $v1, $v1, $v0
    sll         $v0, $t0, 2
    addu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $t0
    sll         $v0, $v0, 2
    sw          $v1, 0x4($a1)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t1, -0x7800($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t2, -0x77FC($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $a2, -0x77F8($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $a3, -0x77F4($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t5, -0x77F0($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t6, -0x77EC($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t7, -0x77E8($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t8, -0x77E4($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t9, -0x77E0($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t3, -0x77DC($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t4, -0x77D8($at)
.L8000AD24:
    jr          $ra
    nop
.end display_texture_configure
