.text
.align 2
.set noreorder
.globl image_plane_process
.ent image_plane_process
image_plane_process:
    addiu       $sp, $sp, -0x10
    addu        $t9, $a0, $zero
    sw          $s0, 0x8($sp)
    addu        $s0, $a1, $zero
    lw          $v0, 0x134($t9)
    lw          $a3, 0x0($a3)
    blez        $v0, .L8005F50C
    addu        $t8, $zero, $zero
    addu        $t6, $a2, $zero
.L8005F3BC:
    addu        $t5, $zero, $zero
    sll         $v0, $t8, 2
    addu        $t7, $v0, $a3
.L8005F3C8:
    lw          $t3, 0x0($t6)
    bnez        $t5, .L8005F3E0
    nop
    lw          $t1, -0x4($t6)
    j .L8005F3E4
    nop
.L8005F3E0:
    lw          $t1, 0x4($t6)
.L8005F3E4:
    lw          $t0, 0x0($t7)
    addiu       $t7, $t7, 0x4
    addiu       $t8, $t8, 0x1
    lbu         $a2, 0x0($t1)
    addiu       $t1, $t1, 0x1
    lbu         $a0, 0x0($t3)
    addiu       $t3, $t3, 0x1
    lbu         $a1, 0x0($t1)
    addiu       $t1, $t1, 0x1
    lbu         $v1, 0x0($t3)
    addiu       $t3, $t3, 0x1
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $a2, $v0, $a2
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    addu        $a0, $v0, $a1
    sll         $v0, $a2, 2
    addiu       $v0, $v0, 0x8
    srl         $v0, $v0, 4
    sb          $v0, 0x0($t0)
    addiu       $t0, $t0, 0x1
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    addu        $v0, $v0, $a0
    addiu       $v0, $v0, 0x7
    srl         $v0, $v0, 4
    sb          $v0, 0x0($t0)
    addiu       $t0, $t0, 0x1
    lw          $v0, 0x28($s0)
    addu        $t4, $a2, $zero
    addiu       $t2, $v0, -0x2
    beqz        $t2, .L8005F4C8
    addu        $a2, $a0, $zero
.L8005F46C:
    lbu         $a1, 0x0($t1)
    addiu       $t1, $t1, 0x1
    lbu         $a0, 0x0($t3)
    addiu       $t3, $t3, 0x1
    sll         $v1, $a2, 1
    addu        $v1, $v1, $a2
    addu        $v0, $v1, $t4
    addiu       $v0, $v0, 0x8
    srl         $v0, $v0, 4
    sb          $v0, 0x0($t0)
    addiu       $t0, $t0, 0x1
    addu        $t4, $a2, $zero
    addiu       $t2, $t2, -0x1
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $a0, $v0, $a1
    addu        $v1, $v1, $a0
    addiu       $v1, $v1, 0x7
    srl         $v1, $v1, 4
    sb          $v1, 0x0($t0)
    addiu       $t0, $t0, 0x1
    bnez        $t2, .L8005F46C
    addu        $a2, $a0, $zero
.L8005F4C8:
    sll         $v0, $a2, 1
    addu        $v0, $v0, $a2
    addu        $v0, $v0, $t4
    addiu       $v0, $v0, 0x8
    srl         $v0, $v0, 4
    sll         $v1, $a2, 2
    addiu       $v1, $v1, 0x7
    srl         $v1, $v1, 4
    addiu       $t5, $t5, 0x1
    sb          $v0, 0x0($t0)
    slti        $v0, $t5, 0x2
    bnez        $v0, .L8005F3C8
    sb          $v1, 0x1($t0)
    lw          $v0, 0x134($t9)
    slt         $v0, $t8, $v0
    bnez        $v0, .L8005F3BC
    addiu       $t6, $t6, 0x4
.L8005F50C:
    lw          $s0, 0x8($sp)
    addiu       $sp, $sp, 0x10
    jr          $ra
    nop
.end image_plane_process
