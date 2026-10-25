.text
.align 2
.set noreorder
.globl image_table_finalize
.ent image_table_finalize
image_table_finalize:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x28($sp)
    addu        $s2, $a0, $zero
    sw          $s4, 0x30($sp)
    addu        $s4, $a1, $zero
    sw          $ra, 0x34($sp)
    sw          $s3, 0x2C($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s1, 0x78($s2)
    lw          $s3, 0x60($s2)
    addiu       $s0, $zero, 0x1
    addiu       $a1, $s0, 0x1
.L8005FF7C:
    addiu       $a0, $zero, 0x1
    slt         $v0, $a0, $s1
    beqz        $v0, .L8005FFA4
    addu        $s0, $a1, $zero
    addiu       $a0, $a0, 0x1
.L8005FF90:
    slt         $v0, $a0, $s1
    .word       0x00B00018  # mult        $a1, $s0
    .word       0x00002812  # mflo        $a1
    bnel        $v0, $zero, .L8005FF90
    addiu       $a0, $a0, 0x1
.L8005FFA4:
    slt         $v0, $s3, $a1
    beql        $v0, $zero, .L8005FF7C
    addiu       $a1, $s0, 0x1
    addiu       $s0, $s0, -0x1
    slti        $v0, $s0, 0x2
    beqz        $v0, .L8005FFE0
    addiu       $v0, $zero, 0x37
    lw          $v1, 0x0($s2)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s2)
    sw          $a1, 0x18($v0)
    lw          $v0, 0x0($s2)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s2, $zero
.L8005FFE0:
    addiu       $t1, $zero, 0x1
    blez        $s1, .L8006000C
    addu        $a0, $zero, $zero
    addu        $v1, $s4, $zero
.L8005FFF0:
    sw          $s0, 0x0($v1)
    addiu       $a0, $a0, 0x1
    slt         $v0, $a0, $s1
    .word       0x01300018  # mult        $t1, $s0
    .word       0x00004812  # mflo        $t1
    bnez        $v0, .L8005FFF0
    addiu       $v1, $v1, 0x4
.L8006000C:
    addiu       $t2, $zero, 0x2
    lui         $t3, 0x8000
    addiu       $t3, $t3, 0x3518
    addu        $a0, $zero, $zero
.L8006001C:
    blez        $s1, .L800600B0
    addu        $t0, $zero, $zero
    addu        $a3, $t3, $zero
.L80060028:
    lw          $v0, 0x28($s2)
    bne         $v0, $t2, .L80060040
    addu        $v0, $a0, $zero
    lw          $v0, 0x0($a3)
    j .L80060044
    sll         $v0, $v0, 2
.L80060040:
    sll         $v0, $v0, 2
.L80060044:
    addu        $a2, $v0, $s4
    lw          $v0, 0x0($a2)
    .word       0x0122001A  # div         $zero, $t1, $v0
    bnez        $v0, .L8006005C
    nop
    break       7
.L8006005C:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L80060074
    lui         $at, 0x8000
    bne         $t1, $at, .L80060074
    nop
    break       6
.L80060074:
    .word       0x00002812  # mflo        $a1
    addiu       $v1, $v0, 0x1
    nop
    .word       0x00A30018  # mult        $a1, $v1
    .word       0x00002812  # mflo        $a1
    slt         $v0, $s3, $a1
    bnez        $v0, .L800600B0
    nop
    sw          $v1, 0x0($a2)
    addu        $t1, $a1, $zero
    addiu       $t0, $zero, 0x1
    addiu       $a0, $a0, 0x1
    slt         $v0, $a0, $s1
    bnez        $v0, .L80060028
    addiu       $a3, $a3, 0x4
.L800600B0:
    bnel        $t0, $zero, .L8006001C
    addu        $a0, $zero, $zero
    addu        $v0, $t1, $zero
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end image_table_finalize
