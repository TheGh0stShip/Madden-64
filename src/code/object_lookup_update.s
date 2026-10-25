.text
.align 2
.set noreorder
.globl object_lookup_update
.ent object_lookup_update
object_lookup_update:
    addiu       $sp, $sp, -0x420
    addu        $t7, $a0, $zero
    sw          $s0, 0x410($sp)
    lui         $s0, 0x7FFF
    ori         $s0, $s0, 0xFFFF
    addu        $t3, $zero, $zero
    sw          $s3, 0x41C($sp)
    sw          $s2, 0x418($sp)
    sw          $s1, 0x414($sp)
    lw          $t9, 0x84($t7)
    addiu       $t6, $a1, 0x18
    addu        $v0, $a1, $t6
    sra         $s3, $v0, 1
    addiu       $t5, $a2, 0x1C
    addu        $v0, $a2, $t5
    sra         $s2, $v0, 1
    addiu       $t4, $a3, 0x18
    addu        $v0, $a3, $t4
    blez        $t9, .L80061D24
    sra         $s1, $v0, 1
    addu        $t8, $sp, $zero
.L80061B64:
    lw          $v0, 0x88($t7)
    lw          $v0, 0x0($v0)
    addu        $v0, $v0, $t3
    lbu         $t0, 0x0($v0)
    slt         $v0, $t0, $a1
    beqz        $v0, .L80061B94
    subu        $v0, $t0, $a1
    sll         $v0, $v0, 1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00005012  # mflo        $t2
    j .L80061BCC
    subu        $v0, $t0, $t6
.L80061B94:
    slt         $v0, $t6, $t0
    beqz        $v0, .L80061BB4
    subu        $v0, $t0, $t6
    sll         $v0, $v0, 1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00005012  # mflo        $t2
    j .L80061BCC
    subu        $v0, $t0, $a1
.L80061BB4:
    slt         $v0, $s3, $t0
    bnez        $v0, .L80061BC8
    addu        $t2, $zero, $zero
    j .L80061BCC
    subu        $v0, $t0, $t6
.L80061BC8:
    subu        $v0, $t0, $a1
.L80061BCC:
    sll         $v0, $v0, 1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00004812  # mflo        $t1
    lw          $v0, 0x88($t7)
    lw          $v0, 0x4($v0)
    addu        $v0, $v0, $t3
    lbu         $t0, 0x0($v0)
    slt         $v0, $t0, $a2
    beqz        $v0, .L80061C20
    subu        $v1, $t0, $a2
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00002012  # mflo        $a0
    subu        $v1, $t0, $t5
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001012  # mflo        $v0
    j .L80061C78
    addu        $t2, $t2, $a0
.L80061C20:
    slt         $v0, $t5, $t0
    beqz        $v0, .L80061C58
    subu        $v1, $t0, $t5
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00002012  # mflo        $a0
    subu        $v1, $t0, $a2
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001012  # mflo        $v0
    j .L80061C78
    addu        $t2, $t2, $a0
.L80061C58:
    slt         $v0, $s2, $t0
    bnez        $v0, .L80061C68
    subu        $v1, $t0, $a2
    subu        $v1, $t0, $t5
.L80061C68:
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001012  # mflo        $v0
.L80061C78:
    addu        $t1, $t1, $v0
    lw          $v0, 0x88($t7)
    lw          $v0, 0x8($v0)
    addu        $v0, $v0, $t3
    lbu         $t0, 0x0($v0)
    slt         $v0, $t0, $a3
    beqz        $v0, .L80061CB8
    subu        $v0, $t0, $a3
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001812  # mflo        $v1
    subu        $v0, $t0, $t4
    nop
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001012  # mflo        $v0
    j .L80061CFC
    addu        $t2, $t2, $v1
.L80061CB8:
    slt         $v0, $t4, $t0
    beqz        $v0, .L80061CE4
    subu        $v0, $t0, $t4
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001812  # mflo        $v1
    subu        $v0, $t0, $a3
    nop
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001012  # mflo        $v0
    j .L80061CFC
    addu        $t2, $t2, $v1
.L80061CE4:
    slt         $v0, $s1, $t0
    bnez        $v0, .L80061CF4
    subu        $v0, $t0, $a3
    subu        $v0, $t0, $t4
.L80061CF4:
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00001012  # mflo        $v0
.L80061CFC:
    addu        $t1, $t1, $v0
    slt         $v0, $t1, $s0
    beqz        $v0, .L80061D10
    sw          $t2, 0x0($t8)
    addu        $s0, $t1, $zero
.L80061D10:
    addiu       $t3, $t3, 0x1
    slt         $v0, $t3, $t9
    bnez        $v0, .L80061B64
    addiu       $t8, $t8, 0x4
    addu        $t3, $zero, $zero
.L80061D24:
    blez        $t9, .L80061D60
    addu        $a1, $zero, $zero
    addu        $a0, $sp, $zero
    lw          $v1, 0x430($sp)
.L80061D34:
    lw          $v0, 0x0($a0)
    slt         $v0, $s0, $v0
    bnel        $v0, $zero, .L80061D54
    addiu       $t3, $t3, 0x1
    sb          $t3, 0x0($v1)
    addiu       $v1, $v1, 0x1
    addiu       $a1, $a1, 0x1
    addiu       $t3, $t3, 0x1
.L80061D54:
    slt         $v0, $t3, $t9
    bnez        $v0, .L80061D34
    addiu       $a0, $a0, 0x4
.L80061D60:
    addu        $v0, $a1, $zero
    lw          $s3, 0x41C($sp)
    lw          $s2, 0x418($sp)
    lw          $s1, 0x414($sp)
    lw          $s0, 0x410($sp)
    addiu       $sp, $sp, 0x420
    jr          $ra
    nop
.end object_lookup_update
