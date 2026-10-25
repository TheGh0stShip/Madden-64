.text
.align 2
.set noreorder
.globl display_texture_tile_load
.ent display_texture_tile_load
display_texture_tile_load:
    addiu       $sp, $sp, -0x58
    sw          $s1, 0x34($sp)
    addu        $s1, $a1, $zero
    lui         $t1, 0x8008
    lw          $t1, 0x4F5C($t1)
    addiu       $a1, $zero, 0x1
    addu        $a3, $zero, $zero
    srl         $t0, $a2, 1
    andi        $v1, $s1, 0x7
    sll         $v1, $v1, 21
    addiu       $t0, $t0, -0x1
    sw          $ra, 0x54($sp)
    sw          $fp, 0x50($sp)
    sw          $s7, 0x4C($sp)
    sw          $s6, 0x48($sp)
    sw          $s5, 0x44($sp)
    sw          $s4, 0x40($sp)
    sw          $s3, 0x3C($sp)
    sw          $s2, 0x38($sp)
    sw          $s0, 0x30($sp)
    sw          $a0, 0x4($t1)
    lw          $s4, 0x68($sp)
    lw          $s2, 0x6C($sp)
    lw          $s5, 0x70($sp)
    lw          $s3, 0x74($sp)
    lw          $fp, 0x80($sp)
    lw          $s7, 0x88($sp)
    lw          $s6, 0x90($sp)
    andi        $t0, $t0, 0xFFF
    addiu       $v0, $t1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xFD08
    or          $t0, $t0, $v0
    or          $v1, $v1, $t0
    sw          $v1, 0x0($t1)
    lw          $t2, 0x7C($sp)
    addu        $a0, $s1, $zero
    addiu       $v0, $zero, 0x7
    sw          $v0, 0x10($sp)
    sw          $zero, 0x14($sp)
    subu        $s0, $s5, $s4
    addiu       $s0, $s0, 0x1
    sw          $t2, 0x24($sp)
    lw          $t2, 0x84($sp)
    srl         $s0, $s0, 1
    addiu       $s0, $s0, 0x7
    sw          $t2, 0x28($sp)
    lw          $t2, 0x8C($sp)
    srl         $s0, $s0, 3
    addu        $a2, $s0, $zero
    sw          $fp, 0x18($sp)
    sw          $s7, 0x1C($sp)
    sw          $s6, 0x20($sp)
    jal         func_8000AAD4
    sw          $t2, 0x2C($sp)
    lui         $t1, 0x8008
    lw          $t1, 0x4F5C($t1)
    sll         $s2, $s2, 2
    andi        $v1, $s2, 0xFFF
    lui         $t0, 0xF400
    or          $v1, $v1, $t0
    sll         $s3, $s3, 2
    lui         $t0, 0x700
    addiu       $v0, $t1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE600
    sw          $v0, 0x0($t1)
    addiu       $v0, $t1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v0, $s4, 1
    andi        $v0, $v0, 0xFFF
    sll         $v0, $v0, 12
    or          $v0, $v0, $v1
    sw          $v0, 0x8($t1)
    sll         $v0, $s5, 1
    andi        $v0, $v0, 0xFFF
    sll         $v0, $v0, 12
    andi        $v1, $s3, 0xFFF
    or          $v1, $v1, $t0
    or          $v0, $v0, $v1
    sw          $v0, 0xC($t1)
    addiu       $v0, $t1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $zero, 0x4($t1)
    sw          $v0, 0x10($t1)
    sw          $zero, 0x14($t1)
    lw          $t2, 0x78($sp)
    sw          $t2, 0x14($sp)
    lw          $t2, 0x7C($sp)
    sw          $t2, 0x24($sp)
    lw          $t2, 0x84($sp)
    addu        $a0, $s1, $zero
    addu        $a1, $zero, $zero
    sw          $t2, 0x28($sp)
    lw          $t2, 0x8C($sp)
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    sw          $zero, 0x10($sp)
    sw          $fp, 0x18($sp)
    sw          $s7, 0x1C($sp)
    sw          $s6, 0x20($sp)
    jal         func_8000AAD4
    sw          $t2, 0x2C($sp)
    addu        $a0, $zero, $zero
    sll         $a1, $s4, 2
    addu        $a2, $s2, $zero
    sll         $a3, $s5, 2
    jal         func_8000A9C8
    sw          $s3, 0x10($sp)
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
.end display_texture_tile_load
