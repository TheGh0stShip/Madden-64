.text
.align 2
.set noreorder
.globl display_convert_coefficients_set
.ent display_convert_coefficients_set
display_convert_coefficients_set:
    addu        $t0, $a0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x7880($v0)
    lw          $t2, 0x10($sp)
    lw          $t3, 0x14($sp)
    bne         $v0, $t0, .L8000A320
    addu        $t1, $a1, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x787C($v0)
    bne         $v0, $t1, .L8000A320
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7878($v0)
    bne         $v0, $a2, .L8000A320
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7874($v0)
    bne         $v0, $a3, .L8000A320
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7870($v0)
    bne         $v0, $t2, .L8000A320
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x786C($v0)
    beq         $v0, $t3, .L8000A3B8
    nop
.L8000A320:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $v1, $t0, 0x1FF
    sll         $v1, $v1, 13
    lui         $a0, 0xEC00
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $t1, 0x1FF
    sll         $v0, $v0, 4
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    srl         $v0, $a2, 5
    andi        $v0, $v0, 0xF
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a1)
    sll         $v1, $a2, 27
    andi        $v0, $a3, 0x1FF
    sll         $v0, $v0, 18
    or          $v1, $v1, $v0
    andi        $v0, $t2, 0x1FF
    sll         $v0, $v0, 9
    or          $v1, $v1, $v0
    andi        $v0, $t3, 0x1FF
    or          $v1, $v1, $v0
    sw          $v1, 0x4($a1)
    lui         $at, 0x8009
    sw          $t0, -0x7880($at)
    lui         $at, 0x8009
    sw          $t1, -0x787C($at)
    lui         $at, 0x8009
    sw          $a2, -0x7878($at)
    lui         $at, 0x8009
    sw          $a3, -0x7874($at)
    lui         $at, 0x8009
    sw          $t2, -0x7870($at)
    lui         $at, 0x8009
    sw          $t3, -0x786C($at)
.L8000A3B8:
    jr          $ra
    nop
.end display_convert_coefficients_set
