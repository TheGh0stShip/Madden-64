.text
.align 2
.set noreorder
.globl display_key_parameters_set
.ent display_key_parameters_set
display_key_parameters_set:
    addu        $t0, $a0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x7854($v0)
    lw          $t2, 0x10($sp)
    lw          $t3, 0x14($sp)
    bne         $v0, $t0, .L8000A544
    addu        $t1, $a1, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x7850($v0)
    bne         $v0, $t1, .L8000A544
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x784C($v0)
    bne         $v0, $a2, .L8000A544
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7848($v0)
    bne         $v0, $a3, .L8000A544
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7844($v0)
    bne         $v0, $t2, .L8000A544
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7840($v0)
    beq         $v0, $t3, .L8000A5CC
    nop
.L8000A544:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $v1, $a2, 0xFFF
    sll         $v1, $v1, 12
    lui         $a0, 0xEA00
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $t3, 0xFFF
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a1)
    sll         $v1, $t0, 24
    andi        $v0, $t1, 0xFF
    sll         $v0, $v0, 16
    or          $v1, $v1, $v0
    andi        $v0, $a3, 0xFF
    sll         $v0, $v0, 8
    or          $v1, $v1, $v0
    andi        $v0, $t2, 0xFF
    or          $v1, $v1, $v0
    sw          $v1, 0x4($a1)
    lui         $at, 0x8009
    sw          $t0, -0x7854($at)
    lui         $at, 0x8009
    sw          $t1, -0x7850($at)
    lui         $at, 0x8009
    sw          $a2, -0x784C($at)
    lui         $at, 0x8009
    sw          $a3, -0x7848($at)
    lui         $at, 0x8009
    sw          $t2, -0x7844($at)
    lui         $at, 0x8009
    sw          $t3, -0x7840($at)
.L8000A5CC:
    jr          $ra
    nop
.end display_key_parameters_set
