.text
.align 2
.set noreorder
.globl object_lookup_prepare
.ent object_lookup_prepare
object_lookup_prepare:
    addiu       $sp, $sp, -0x218
    sw          $s1, 0x204($sp)
    addu        $s1, $a0, $zero
    lw          $a0, 0x228($sp)
    sw          $s2, 0x208($sp)
    addu        $s2, $a1, $zero
    sw          $s3, 0x20C($sp)
    addu        $s3, $a2, $zero
    sw          $s4, 0x210($sp)
    addu        $s4, $a3, $zero
    sw          $s5, 0x214($sp)
    lw          $s5, 0x230($sp)
    addu        $t1, $sp, $zero
    addiu       $v0, $zero, 0x7F
    lui         $v1, 0x7FFF
    ori         $v1, $v1, 0xFFFF
    sw          $s0, 0x200($sp)
.L80061DC4:
    sw          $v1, 0x0($t1)
    addiu       $v0, $v0, -0x1
    bgez        $v0, .L80061DC4
    addiu       $t1, $t1, 0x4
    blez        $a0, .L80061EEC
    nop
    lw          $a3, 0x22C($sp)
    addu        $s0, $a0, $a3
.L80061DE4:
    lw          $a1, 0x88($s1)
    lbu         $t9, 0x0($a3)
    lw          $v0, 0x0($a1)
    addu        $v0, $v0, $t9
    lbu         $a0, 0x0($v0)
    subu        $a0, $s2, $a0
    sll         $v0, $a0, 1
    .word       0x00420018  # mult        $v0, $v0
    .word       0x00006812  # mflo        $t5
    lw          $v0, 0x4($a1)
    addu        $v0, $v0, $t9
    lbu         $v0, 0x0($v0)
    subu        $v0, $s3, $v0
    sll         $v1, $v0, 1
    addu        $t7, $v1, $v0
    .word       0x01EF0018  # mult        $t7, $t7
    .word       0x00003012  # mflo        $a2
    lw          $v0, 0x8($a1)
    addu        $t1, $sp, $zero
    addu        $v0, $v0, $t9
    lbu         $v0, 0x0($v0)
    addu        $t4, $s5, $zero
    addiu       $t8, $zero, 0x3
    subu        $t6, $s4, $v0
    .word       0x01CE0018  # mult        $t6, $t6
    .word       0x00001812  # mflo        $v1
    sll         $a0, $a0, 6
    addiu       $a0, $a0, 0x100
    sll         $v0, $t7, 1
    addu        $v0, $v0, $t7
    sll         $v0, $v0, 3
    addiu       $t7, $v0, 0x90
    sll         $v0, $t6, 4
    addiu       $t6, $v0, 0x40
    addu        $t5, $t5, $a2
    addu        $t5, $t5, $v1
.L80061E74:
    addu        $t3, $t5, $zero
    addu        $t2, $t7, $zero
    addiu       $t0, $zero, 0x7
.L80061E80:
    addu        $v1, $t3, $zero
    addu        $a2, $t6, $zero
    addiu       $a1, $zero, 0x3
.L80061E8C:
    lw          $v0, 0x0($t1)
    slt         $v0, $v1, $v0
    beql        $v0, $zero, .L80061EA8
    addu        $v1, $v1, $a2
    sw          $v1, 0x0($t1)
    sb          $t9, 0x0($t4)
    addu        $v1, $v1, $a2
.L80061EA8:
    addiu       $a2, $a2, 0x80
    addiu       $t1, $t1, 0x4
    addiu       $a1, $a1, -0x1
    bgez        $a1, .L80061E8C
    addiu       $t4, $t4, 0x1
    addu        $t3, $t3, $t2
    addiu       $t0, $t0, -0x1
    bgez        $t0, .L80061E80
    addiu       $t2, $t2, 0x120
    addu        $t5, $t5, $a0
    addiu       $t8, $t8, -0x1
    bgez        $t8, .L80061E74
    addiu       $a0, $a0, 0x200
    addiu       $a3, $a3, 0x1
    slt         $v0, $a3, $s0
    bnez        $v0, .L80061DE4
    nop
.L80061EEC:
    lw          $s5, 0x214($sp)
    lw          $s4, 0x210($sp)
    lw          $s3, 0x20C($sp)
    lw          $s2, 0x208($sp)
    lw          $s1, 0x204($sp)
    lw          $s0, 0x200($sp)
    addiu       $sp, $sp, 0x218
    jr          $ra
    nop
.end object_lookup_prepare
