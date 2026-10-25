.text
.align 2
.set noreorder
.globl display_texture_parameters_set
.ent display_texture_parameters_set
display_texture_parameters_set:
    addu        $t0, $a0, $zero
    sll         $v0, $a3, 2
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a3
    sll         $v1, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77C4($at)
    lw          $t2, 0x10($sp)
    bne         $v0, $t0, .L8000B244
    addu        $t1, $a1, $zero
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77C0($at)
    bne         $v0, $t1, .L8000B244
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77BC($at)
    bne         $v0, $a2, .L8000B244
    nop
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x77B8($at)
    beq         $v0, $t2, .L8000B2D4
    nop
.L8000B244:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $v1, $a2, 0x7
    sll         $v1, $v1, 11
    lui         $a0, 0xBB00
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $a3, 0x7
    sll         $v0, $v0, 8
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    andi        $v0, $t2, 0xFF
    or          $v1, $v1, $v0
    sll         $v0, $t0, 16
    sw          $v1, 0x0($a1)
    andi        $v1, $t1, 0xFFFF
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    sll         $v0, $a3, 2
    addu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a3
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t0, -0x77C4($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t1, -0x77C0($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $a2, -0x77BC($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sw          $t2, -0x77B8($at)
.L8000B2D4:
    jr          $ra
    nop
.end display_texture_parameters_set
