.text
.align 2
.set noreorder
.globl func_8005AB90
.ent func_8005AB90
func_8005AB90:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $a2, 0x20($s2)
    lw          $v0, 0x4($s2)
    addiu       $a1, $zero, 0x1
    lw          $s5, 0x1A4($s2)
    lw          $v0, 0x0($v0)
    lw          $s0, 0x138($s2)
    jalr        $v0
    sll         $a2, $a2, 3
    sw          $v0, 0x38($s5)
    lw          $v1, 0x20($s2)
    sll         $v1, $v1, 2
    addu        $v0, $v0, $v1
    sw          $v0, 0x3C($s5)
    lw          $v0, 0x20($s2)
    lw          $v1, 0xD8($s2)
    blez        $v0, .L8005ACB0
    addu        $s4, $zero, $zero
    addiu       $s6, $s0, 0x4
    addiu       $s3, $v1, 0x24
.L8005AC04:
    lw          $s0, -0x18($s3)
    lw          $v0, 0x0($s3)
    .word       0x02020018  # mult        $s0, $v0
    .word       0x00008012  # mflo        $s0
    lw          $v0, 0x138($s2)
    nop
    .word       0x0202001A  # div         $zero, $s0, $v0
    bnez        $v0, .L8005AC2C
    nop
    break       7
.L8005AC2C:
    addiu       $at, $zero, -0x1
    bne         $v0, $at, .L8005AC44
    lui         $at, 0x8000
    bne         $s0, $at, .L8005AC44
    nop
    break       6
.L8005AC44:
    .word       0x00008012  # mflo        $s0
    nop
    nop
    .word       0x02160018  # mult        $s0, $s6
    .word       0x00008812  # mflo        $s1
    lw          $v0, 0x4($s2)
    addu        $a0, $s2, $zero
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    sll         $a2, $s1, 3
    sll         $s0, $s0, 2
    lw          $v1, 0x38($s5)
    addu        $a0, $v0, $s0
    sll         $v0, $s4, 2
    addu        $v1, $v0, $v1
    sw          $a0, 0x0($v1)
    lw          $v1, 0x3C($s5)
    sll         $s1, $s1, 2
    addu        $a0, $a0, $s1
    addu        $v0, $v0, $v1
    sw          $a0, 0x0($v0)
    lw          $v0, 0x20($s2)
    addiu       $s4, $s4, 0x1
    slt         $v0, $s4, $v0
    bnez        $v0, .L8005AC04
    addiu       $s3, $s3, 0x54
.L8005ACB0:
    lw          $ra, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8005AB90
