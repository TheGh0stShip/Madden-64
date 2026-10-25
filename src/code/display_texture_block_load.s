.text
.align 2
.set noreorder
.globl display_texture_block_load
.ent display_texture_block_load
display_texture_block_load:
    addiu       $sp, $sp, -0x58
    sw          $s0, 0x30($sp)
    addu        $s0, $a1, $zero
    sw          $s1, 0x34($sp)
    addu        $s1, $a2, $zero
    sw          $s2, 0x38($sp)
    addu        $s2, $a3, $zero
    addiu       $a1, $zero, 0x2
    lui         $t0, 0x8008
    lw          $t0, 0x4F5C($t0)
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    lui         $v1, 0xFD10
    sw          $ra, 0x54($sp)
    sw          $fp, 0x50($sp)
    sw          $s7, 0x4C($sp)
    sw          $s6, 0x48($sp)
    sw          $s5, 0x44($sp)
    sw          $s4, 0x40($sp)
    sw          $s3, 0x3C($sp)
    sw          $a0, 0x4($t0)
    lw          $fp, 0x6C($sp)
    lw          $s5, 0x70($sp)
    lw          $s7, 0x74($sp)
    lw          $s4, 0x78($sp)
    lw          $s6, 0x7C($sp)
    lw          $s3, 0x80($sp)
    addu        $a0, $s0, $zero
    addiu       $v0, $t0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $s0, 0x7
    sll         $v0, $v0, 21
    or          $v0, $v0, $v1
    sw          $v0, 0x0($t0)
    addiu       $v0, $zero, 0x7
    sw          $v0, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $s5, 0x18($sp)
    sw          $s4, 0x1C($sp)
    sw          $s3, 0x20($sp)
    sw          $fp, 0x24($sp)
    sw          $s7, 0x28($sp)
    jal         func_8000AAD4
    sw          $s6, 0x2C($sp)
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    addiu       $a3, $zero, 0x800
    srl         $a0, $s1, 4
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE600
    sw          $v0, 0x0($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xF300
    sw          $zero, 0x4($a1)
    beqz        $a0, .L80009894
    sw          $v0, 0x8($a1)
    addiu       $a3, $a0, 0x7FF
.L80009894:
    .word       0x02320018  # mult        $s1, $s2
    .word       0x00001012  # mflo        $v0
    addiu       $v0, $v0, 0x3
    srl         $v0, $v0, 2
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0x800
    beql        $v0, $zero, .L800098B4
    addiu       $v1, $zero, 0x7FF
.L800098B4:
    andi        $v0, $v1, 0xFFF
    sll         $v0, $v0, 12
    lui         $v1, 0x700
    beqz        $a0, .L800098E4
    or          $a2, $v0, $v1
    .word       0x00E4001B  # divu        $zero, $a3, $a0
    bnez        $a0, .L800098D8
    nop
    break       7
.L800098D8:
    .word       0x00001012  # mflo        $v0
    j .L800098E8
    andi        $v0, $v0, 0xFFF
.L800098E4:
    andi        $v0, $a3, 0xFFF
.L800098E8:
    or          $v0, $a2, $v0
    sw          $v0, 0xC($a1)
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    srl         $a2, $s1, 1
    addiu       $a2, $a2, 0x7
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    sw          $zero, 0x4($v1)
    lw          $t1, 0x68($sp)
    srl         $a2, $a2, 3
    addu        $a3, $zero, $zero
    sw          $zero, 0x10($sp)
    sw          $s5, 0x18($sp)
    sw          $s4, 0x1C($sp)
    sw          $s3, 0x20($sp)
    sw          $fp, 0x24($sp)
    sw          $s7, 0x28($sp)
    sw          $s6, 0x2C($sp)
    jal         func_8000AAD4
    sw          $t1, 0x14($sp)
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    addiu       $a3, $s1, -0x1
    sll         $a3, $a3, 2
    addiu       $v0, $s2, -0x1
    sll         $v0, $v0, 2
    jal         func_8000A9C8
    sw          $v0, 0x10($sp)
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
.end display_texture_block_load
