.text
.align 2
.set noreorder
.globl display_texture_prepare
.ent display_texture_prepare
display_texture_prepare:
    addiu       $sp, $sp, -0x58
    sw          $fp, 0x50($sp)
    lw          $fp, 0x7C($sp)
    sw          $s7, 0x4C($sp)
    lw          $s7, 0x84($sp)
    addu        $t2, $a0, $zero
    sw          $s6, 0x48($sp)
    addu        $s6, $a1, $zero
    sw          $s4, 0x40($sp)
    addu        $s4, $a2, $zero
    sw          $s5, 0x44($sp)
    addu        $s5, $a3, $zero
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x54($sp)
    sw          $s3, 0x3C($sp)
    sw          $s2, 0x38($sp)
    sw          $s1, 0x34($sp)
    beq         $s4, $v0, .L80009554
    sw          $s0, 0x30($sp)
    beqz        $s4, .L8000953C
    addiu       $v0, $zero, 0x2
    beq         $s4, $v0, .L8000956C
    addiu       $v0, $zero, 0x3
    beq         $s4, $v0, .L80009584
    addiu       $a1, $zero, 0x3
    j .L80009598
    addu        $s3, $zero, $zero
.L8000953C:
    addiu       $a1, $zero, 0x2
    addiu       $s2, $zero, 0x3
    addiu       $s1, $zero, 0x2
    addu        $s0, $zero, $zero
    j .L800095A8
    addu        $s3, $zero, $zero
.L80009554:
    addiu       $a1, $zero, 0x2
    addiu       $s2, $zero, 0x1
    addiu       $s1, $zero, 0x1
    addiu       $s0, $zero, 0x1
    j .L800095A8
    addiu       $s3, $zero, 0x1
.L8000956C:
    addiu       $a1, $zero, 0x2
    addu        $s2, $zero, $zero
    addu        $s1, $zero, $zero
    addiu       $s0, $zero, 0x2
    j .L800095A8
    addiu       $s3, $zero, 0x2
.L80009584:
    addu        $s2, $zero, $zero
    addu        $s1, $zero, $zero
    addiu       $s0, $zero, 0x4
    j .L800095A8
    addiu       $s3, $zero, 0x2
.L80009598:
    addu        $s0, $zero, $zero
    addu        $s1, $zero, $zero
    addu        $s2, $zero, $zero
    addu        $a1, $zero, $zero
.L800095A8:
    lui         $t1, 0x8008
    lw          $t1, 0x4F5C($t1)
    andi        $v1, $s6, 0x7
    sll         $v1, $v1, 21
    lui         $t0, 0xFD00
    addiu       $v0, $t1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v0, $a1, 19
    or          $v0, $v0, $t0
    or          $v1, $v1, $v0
    sw          $v1, 0x0($t1)
    sw          $t2, 0x4($t1)
    lw          $t3, 0x74($sp)
    sw          $t3, 0x18($sp)
    lw          $t3, 0x70($sp)
    sw          $t3, 0x24($sp)
    lw          $t3, 0x78($sp)
    addu        $a0, $s6, $zero
    addu        $a2, $zero, $zero
    sw          $t3, 0x28($sp)
    lw          $t3, 0x80($sp)
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x7
    sw          $v0, 0x10($sp)
    sw          $zero, 0x14($sp)
    sw          $fp, 0x1C($sp)
    sw          $s7, 0x20($sp)
    jal         func_8000AAD4
    sw          $t3, 0x2C($sp)
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    addiu       $a3, $zero, 0x800
    .word       0x02B00018  # mult        $s5, $s0
    .word       0x00001812  # mflo        $v1
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
    srl         $a0, $v1, 3
    beqz        $a0, .L8000966C
    sw          $v0, 0x8($a1)
    addiu       $a3, $a0, 0x7FF
.L8000966C:
    lw          $t3, 0x68($sp)
    .word       0x02AB0018  # mult        $s5, $t3
    .word       0x00001012  # mflo        $v0
    addu        $v0, $v0, $s2
    srlv        $v0, $v0, $s1
    addiu       $v1, $v0, -0x1
    sltiu       $v0, $v1, 0x800
    beql        $v0, $zero, .L80009690
    addiu       $v1, $zero, 0x7FF
.L80009690:
    andi        $v0, $v1, 0xFFF
    sll         $v0, $v0, 12
    lui         $v1, 0x700
    beqz        $a0, .L800096C0
    or          $a2, $v0, $v1
    .word       0x00E4001B  # divu        $zero, $a3, $a0
    bnez        $a0, .L800096B4
    nop
    break       7
.L800096B4:
    .word       0x00001012  # mflo        $v0
    j .L800096C4
    andi        $v0, $v0, 0xFFF
.L800096C0:
    andi        $v0, $a3, 0xFFF
.L800096C4:
    or          $v0, $a2, $v0
    sw          $v0, 0xC($a1)
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    sw          $zero, 0x4($v1)
    lw          $t3, 0x6C($sp)
    sw          $t3, 0x14($sp)
    lw          $t3, 0x74($sp)
    sw          $t3, 0x18($sp)
    lw          $t3, 0x70($sp)
    addu        $a0, $s6, $zero
    .word       0x02B30018  # mult        $s5, $s3
    .word       0x00003012  # mflo        $a2
    sw          $t3, 0x24($sp)
    lw          $t3, 0x78($sp)
    addu        $a1, $s4, $zero
    addu        $a3, $zero, $zero
    sw          $zero, 0x10($sp)
    sw          $fp, 0x1C($sp)
    sw          $s7, 0x20($sp)
    sw          $t3, 0x28($sp)
    lw          $t3, 0x80($sp)
    addiu       $a2, $a2, 0x7
    srl         $a2, $a2, 3
    jal         func_8000AAD4
    sw          $t3, 0x2C($sp)
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    lw          $t3, 0x68($sp)
    addiu       $a3, $s5, -0x1
    sll         $a3, $a3, 2
    addiu       $v0, $t3, -0x1
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
.end display_texture_prepare
