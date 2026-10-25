.text
.align 2
.set noreorder
.globl display_texture_update
.ent display_texture_update
display_texture_update:
    addiu       $sp, $sp, -0x58
    sw          $s4, 0x40($sp)
    lw          $s4, 0x6C($sp)
    sw          $s3, 0x3C($sp)
    lw          $s3, 0x70($sp)
    sw          $s6, 0x48($sp)
    lw          $s6, 0x74($sp)
    sw          $fp, 0x50($sp)
    lw          $fp, 0x8C($sp)
    addu        $t3, $a0, $zero
    sw          $s2, 0x38($sp)
    addu        $s2, $a1, $zero
    sw          $s1, 0x34($sp)
    addu        $s1, $a2, $zero
    sw          $s7, 0x4C($sp)
    lw          $s7, 0x94($sp)
    addu        $t2, $a3, $zero
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x54($sp)
    sw          $s5, 0x44($sp)
    beq         $s1, $v0, .L80009A2C
    sw          $s0, 0x30($sp)
    beqz        $s1, .L80009A20
    addiu       $v0, $zero, 0x2
    beq         $s1, $v0, .L80009A38
    addiu       $v0, $zero, 0x3
    beq         $s1, $v0, .L80009A3C
    addiu       $t1, $zero, 0x2
    j .L80009A44
    addu        $s5, $zero, $zero
.L80009A20:
    addu        $t1, $zero, $zero
    j .L80009A48
    addu        $s5, $zero, $zero
.L80009A2C:
    addiu       $t1, $zero, 0x1
    j .L80009A48
    addiu       $s5, $zero, 0x1
.L80009A38:
    addiu       $t1, $zero, 0x2
.L80009A3C:
    j .L80009A48
    addiu       $s5, $zero, 0x2
.L80009A44:
    addu        $t1, $zero, $zero
.L80009A48:
    lui         $t0, 0x8008
    lw          $t0, 0x4F5C($t0)
    andi        $v1, $s2, 0x7
    sll         $v1, $v1, 21
    lui         $a2, 0xFD00
    addiu       $v0, $t0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $s1, 0x3
    sll         $v0, $v0, 19
    or          $v0, $v0, $a2
    or          $v1, $v1, $v0
    addiu       $v0, $t2, -0x1
    andi        $v0, $v0, 0xFFF
    or          $v1, $v1, $v0
    sw          $v1, 0x0($t0)
    sw          $t3, 0x4($t0)
    lw          $t4, 0x84($sp)
    addu        $a0, $s2, $zero
    sw          $t4, 0x18($sp)
    lw          $t4, 0x80($sp)
    addu        $a1, $s1, $zero
    subu        $s0, $s6, $s4
    sw          $t4, 0x24($sp)
    lw          $t4, 0x88($sp)
    addiu       $s0, $s0, 0x1
    .word       0x02090018  # mult        $s0, $t1
    .word       0x00003012  # mflo        $a2
    sw          $t4, 0x28($sp)
    lw          $t4, 0x90($sp)
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x7
    sw          $v0, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $fp, 0x1C($sp)
    sw          $s7, 0x20($sp)
    sw          $t4, 0x2C($sp)
    addiu       $a2, $a2, 0x7
    jal         func_8000AAD4
    srl         $a2, $a2, 3
    addu        $a0, $s2, $zero
    lui         $t0, 0x8008
    lw          $t0, 0x4F5C($t0)
    addu        $a1, $s1, $zero
    sll         $s4, $s4, 2
    andi        $a2, $s4, 0xFFF
    sll         $a2, $a2, 12
    sll         $s3, $s3, 2
    lui         $v1, 0xF400
    sll         $s2, $s6, 2
    addiu       $v0, $t0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE600
    sw          $v0, 0x0($t0)
    addiu       $v0, $t0, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $s3, 0xFFF
    or          $v0, $v0, $v1
    or          $a2, $a2, $v0
    sw          $a2, 0x8($t0)
    andi        $a2, $s2, 0xFFF
    sw          $zero, 0x4($t0)
    lw          $t4, 0x78($sp)
    sll         $a2, $a2, 12
    lui         $v1, 0x700
    sll         $s1, $t4, 2
    andi        $v0, $s1, 0xFFF
    or          $v0, $v0, $v1
    or          $a2, $a2, $v0
    addiu       $v0, $t0, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $a2, 0xC($t0)
    sw          $v0, 0x10($t0)
    sw          $zero, 0x14($t0)
    lw          $t4, 0x7C($sp)
    sw          $t4, 0x14($sp)
    lw          $t4, 0x84($sp)
    sw          $t4, 0x18($sp)
    lw          $t4, 0x80($sp)
    .word       0x02150018  # mult        $s0, $s5
    .word       0x00008012  # mflo        $s0
    sw          $t4, 0x24($sp)
    lw          $t4, 0x88($sp)
    addu        $a3, $zero, $zero
    sw          $zero, 0x10($sp)
    sw          $fp, 0x1C($sp)
    sw          $s7, 0x20($sp)
    sw          $t4, 0x28($sp)
    lw          $t4, 0x90($sp)
    addiu       $s0, $s0, 0x7
    srl         $a2, $s0, 3
    jal         func_8000AAD4
    sw          $t4, 0x2C($sp)
    addu        $a0, $zero, $zero
    addu        $a1, $s4, $zero
    addu        $a2, $s3, $zero
    addu        $a3, $s2, $zero
    jal         func_8000A9C8
    sw          $s1, 0x10($sp)
    lw          $ra, 0x54($sp)
    lw          $fp, 0x50($sp)
    lw          $s7, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end display_texture_update
