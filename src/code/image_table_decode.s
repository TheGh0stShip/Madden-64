.text
.align 2
.set noreorder
.globl image_table_decode
.ent image_table_decode
image_table_decode:
    addiu       $sp, $sp, -0x58
    sw          $s7, 0x4C($sp)
    addu        $s7, $a0, $zero
    sw          $ra, 0x54($sp)
    sw          $fp, 0x50($sp)
    sw          $s6, 0x48($sp)
    sw          $s5, 0x44($sp)
    sw          $s4, 0x40($sp)
    sw          $s3, 0x3C($sp)
    sw          $s2, 0x38($sp)
    sw          $s1, 0x34($sp)
    sw          $s0, 0x30($sp)
    lw          $v1, 0x58($s7)
    lw          $t1, 0x1C8($s7)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800603C8
    sw          $t1, 0x14($sp)
    addiu       $t1, $zero, 0x1FE
    sw          $t1, 0x1C($sp)
    lw          $t1, 0x14($sp)
    j .L800603D4
    sw          $v1, 0x1C($t1)
.L800603C8:
    lw          $t1, 0x14($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x1C($t1)
.L800603D4:
    lw          $v0, 0x4($s7)
    addu        $a0, $s7, $zero
    lw          $a3, 0x78($s7)
    lw          $t1, 0x1C($sp)
    lw          $v0, 0x8($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $t1, 0x100
    lw          $t1, 0x14($sp)
    sw          $v0, 0x18($t1)
    lw          $v0, 0x78($s7)
    lw          $fp, 0x14($t1)
    blez        $v0, .L80060538
    addu        $s5, $zero, $zero
    lw          $t1, 0x14($sp)
    sw          $t1, 0x2C($sp)
.L80060414:
    lw          $t1, 0x2C($sp)
    lw          $s6, 0x20($t1)
    lw          $t1, 0x1C($sp)
    .word       0x03D6001A  # div         $zero, $fp, $s6
    bnez        $s6, .L80060430
    nop
    break       7
.L80060430:
    addiu       $at, $zero, -0x1
    bne         $s6, $at, .L80060448
    lui         $at, 0x8000
    bne         $fp, $at, .L80060448
    nop
    break       6
.L80060448:
    .word       0x0000F012  # mflo        $fp
    beqz        $t1, .L8006046C
    sll         $t0, $s5, 2
    lw          $t1, 0x14($sp)
    lw          $v1, 0x18($t1)
    addu        $v1, $t0, $v1
    lw          $v0, 0x0($v1)
    addiu       $v0, $v0, 0xFF
    sw          $v0, 0x0($v1)
.L8006046C:
    addu        $s3, $zero, $zero
    addu        $a0, $s7, $zero
    addu        $a1, $s5, $zero
    lw          $t1, 0x14($sp)
    addu        $a2, $zero, $zero
    addiu       $a3, $s6, -0x1
    lw          $v0, 0x18($t1)
    addu        $s0, $zero, $zero
    addu        $v0, $t0, $v0
    lw          $s4, 0x0($v0)
    jal         func_8006012C
    addu        $s2, $zero, $zero
    addu        $v1, $v0, $zero
    j .L800604C4
    addu        $s1, $s4, $zero
.L800604A8:
    addiu       $s3, $s3, 0x1
    addu        $a0, $s7, $zero
    addu        $a1, $s5, $zero
    addu        $a2, $s3, $zero
    jal         func_8006012C
    addiu       $a3, $s6, -0x1
    addu        $v1, $v0, $zero
.L800604C4:
    slt         $v0, $v1, $s0
    bnel        $v0, $zero, .L800604A8
    addu        $s2, $s2, $fp
    sb          $s2, 0x0($s1)
    addiu       $s0, $s0, 0x1
    slti        $v0, $s0, 0x100
    bnez        $v0, .L800604C4
    addiu       $s1, $s1, 0x1
    lw          $t1, 0x1C($sp)
    beqz        $t1, .L8006051C
    nop
    addiu       $s0, $zero, 0x1
    addiu       $a0, $s4, -0x1
.L800604F8:
    lbu         $v0, 0x0($s4)
    addu        $v1, $s0, $s4
    sb          $v0, 0x0($a0)
    lbu         $v0, 0xFF($s4)
    addiu       $s0, $s0, 0x1
    sb          $v0, 0xFF($v1)
    slti        $v0, $s0, 0x100
    bnez        $v0, .L800604F8
    addiu       $a0, $a0, -0x1
.L8006051C:
    lw          $t1, 0x2C($sp)
    lw          $v0, 0x78($s7)
    addiu       $s5, $s5, 0x1
    addiu       $t1, $t1, 0x4
    slt         $v0, $s5, $v0
    bnez        $v0, .L80060414
    sw          $t1, 0x2C($sp)
.L80060538:
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
.end image_table_decode
