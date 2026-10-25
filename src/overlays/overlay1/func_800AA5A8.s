.text
.align 2
.set noreorder
.globl func_800AA5A8
.ent func_800AA5A8
func_800AA5A8:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x14($sp)
    lhu         $s1, 0x42($sp)
    sw          $s2, 0x18($sp)
    lbu         $s2, 0x47($sp)
    sw          $s5, 0x24($sp)
    addu        $s5, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $a2, $zero
    sw          $s0, 0x10($sp)
    andi        $s0, $a3, 0xFFFF
    addu        $a0, $s0, $zero
    sw          $ra, 0x2C($sp)
    jal         func_8002E848
    sw          $s6, 0x28($sp)
    addu        $a0, $s0, $zero
    jal         func_8002E828
    addu        $s0, $v0, $zero
    addu        $s6, $v0, $zero
    andi        $s1, $s1, 0xFFFF
    jal         func_8002E848
    addu        $a0, $s1, $zero
    addu        $a0, $s1, $zero
    jal         func_8002E828
    addu        $s1, $v0, $zero
    beqz        $s2, .L800AA63C
    addu        $a1, $v0, $zero
    .word       0x02140018  # mult        $s0, $s4
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    j           func_800A5F34
    nop
.L800AA63C:
    negu        $v0, $s0
    .word       0x00540018  # mult        $v0, $s4
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    lw          $v1, 0x0($s3)
    .word       0x00910018  # mult        $a0, $s1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x0($s5)
    lw          $v1, 0x4($s3)
    .word       0x00850018  # mult        $a0, $a1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x4($s5)
    lw          $v1, 0x8($s3)
    negu        $v0, $s4
    .word       0x00560018  # mult        $v0, $s6
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    addu        $v0, $v0, $v1
    sw          $v0, 0x8($s5)
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800AA5A8
