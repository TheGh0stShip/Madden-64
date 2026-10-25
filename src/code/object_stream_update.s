.text
.align 2
.set noreorder
.globl object_stream_update
.ent object_stream_update
object_stream_update:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $ra, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $s4, 0x4($s3)
    lw          $s0, 0x40($s4)
    addu        $s1, $zero, $zero
    beqz        $s0, .L80063D18
    addu        $s2, $zero, $zero
.L80063CD8:
    lw          $v0, 0x0($s0)
    bnez        $v0, .L80063D0C
    nop
    lw          $v1, 0xC($s0)
    lw          $a0, 0x8($s0)
    .word       0x00640018  # mult        $v1, $a0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x4($s0)
    nop
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00001012  # mflo        $v0
    addu        $s1, $s1, $v1
    addu        $s2, $s2, $v0
.L80063D0C:
    lw          $s0, 0x2C($s0)
    bnez        $s0, .L80063CD8
    nop
.L80063D18:
    lw          $s0, 0x44($s4)
    beqz        $s0, .L80063D6C
    nop
.L80063D24:
    lw          $v0, 0x0($s0)
    bnez        $v0, .L80063D60
    nop
    lw          $v1, 0xC($s0)
    lw          $a0, 0x8($s0)
    .word       0x00640018  # mult        $v1, $a0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x4($s0)
    nop
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00001012  # mflo        $v0
    sll         $v1, $v1, 7
    addu        $s1, $s1, $v1
    sll         $v0, $v0, 7
    addu        $s2, $s2, $v0
.L80063D60:
    lw          $s0, 0x2C($s0)
    bnez        $s0, .L80063D24
    nop
.L80063D6C:
    blez        $s1, .L80063F3C
    addu        $a0, $s3, $zero
    lw          $a3, 0x48($s4)
    addu        $a1, $s1, $zero
    jal         func_800649B0
    addu        $a2, $s2, $zero
    addu        $v1, $v0, $zero
    slt         $v0, $v1, $s2
    bnez        $v0, .L80063DA0
    nop
    lui         $s1, 0x3B9A
    j .L80063DD4
    ori         $s1, $s1, 0xCA00
.L80063DA0:
    .word       0x0071001A  # div         $zero, $v1, $s1
    bnez        $s1, .L80063DB0
    nop
    break       7
.L80063DB0:
    addiu       $at, $zero, -0x1
    bne         $s1, $at, .L80063DC8
    lui         $at, 0x8000
    bne         $v1, $at, .L80063DC8
    nop
    break       6
.L80063DC8:
    .word       0x00008812  # mflo        $s1
    blezl       $s1, .L80063DD4
    addiu       $s1, $zero, 0x1
.L80063DD4:
    lw          $s0, 0x40($s4)
    beqz        $s0, .L80063E88
    nop
    addiu       $s2, $zero, 0x1
.L80063DE4:
    lw          $v0, 0x0($s0)
    bnez        $v0, .L80063E7C
    nop
    lw          $a1, 0x4($s0)
    lw          $a0, 0xC($s0)
    addiu       $v0, $a1, -0x1
    .word       0x0044001B  # divu        $zero, $v0, $a0
    bnez        $a0, .L80063E0C
    nop
    break       7
.L80063E0C:
    .word       0x00001012  # mflo        $v0
    addiu       $v0, $v0, 0x1
    slt         $v0, $s1, $v0
    bnel        $v0, $zero, .L80063E28
    addiu       $a1, $s0, 0x30
    j .L80063E50
    sw          $a1, 0x10($s0)
.L80063E28:
    .word       0x02240018  # mult        $s1, $a0
    .word       0x00001812  # mflo        $v1
    lw          $v0, 0x4($s0)
    lw          $a2, 0x8($s0)
    .word       0x00460018  # mult        $v0, $a2
    .word       0x00003012  # mflo        $a2
    addu        $a0, $s3, $zero
    jal         func_800649B8
    sw          $v1, 0x10($s0)
    sw          $s2, 0x28($s0)
.L80063E50:
    lw          $a2, 0x8($s0)
    lw          $a3, 0x10($s0)
    addu        $a0, $s3, $zero
    jal         func_8006389C
    addiu       $a1, $zero, 0x1
    sw          $v0, 0x0($s0)
    lw          $v0, 0x4C($s4)
    sw          $zero, 0x18($s0)
    sw          $zero, 0x1C($s0)
    sw          $zero, 0x24($s0)
    sw          $v0, 0x14($s0)
.L80063E7C:
    lw          $s0, 0x2C($s0)
    bnez        $s0, .L80063DE4
    nop
.L80063E88:
    lw          $s0, 0x44($s4)
    beqz        $s0, .L80063F3C
    addiu       $s2, $zero, 0x1
.L80063E94:
    lw          $v0, 0x0($s0)
    bnez        $v0, .L80063F30
    nop
    lw          $a1, 0x4($s0)
    lw          $a0, 0xC($s0)
    addiu       $v0, $a1, -0x1
    .word       0x0044001B  # divu        $zero, $v0, $a0
    bnez        $a0, .L80063EBC
    nop
    break       7
.L80063EBC:
    .word       0x00001012  # mflo        $v0
    addiu       $v0, $v0, 0x1
    slt         $v0, $s1, $v0
    bnel        $v0, $zero, .L80063ED8
    addiu       $a1, $s0, 0x30
    j .L80063F04
    sw          $a1, 0x10($s0)
.L80063ED8:
    .word       0x02240018  # mult        $s1, $a0
    .word       0x00001812  # mflo        $v1
    lw          $a2, 0x4($s0)
    lw          $v0, 0x8($s0)
    .word       0x00C20018  # mult        $a2, $v0
    .word       0x00003012  # mflo        $a2
    addu        $a0, $s3, $zero
    sw          $v1, 0x10($s0)
    jal         func_800649B8
    sll         $a2, $a2, 7
    sw          $s2, 0x28($s0)
.L80063F04:
    lw          $a2, 0x8($s0)
    lw          $a3, 0x10($s0)
    addu        $a0, $s3, $zero
    jal         func_800639CC
    addiu       $a1, $zero, 0x1
    sw          $v0, 0x0($s0)
    lw          $v0, 0x4C($s4)
    sw          $zero, 0x18($s0)
    sw          $zero, 0x1C($s0)
    sw          $zero, 0x24($s0)
    sw          $v0, 0x14($s0)
.L80063F30:
    lw          $s0, 0x2C($s0)
    bnez        $s0, .L80063E94
    nop
.L80063F3C:
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end object_stream_update
