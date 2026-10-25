.text
.align 2
.set noreorder
.globl func_800BDB5C
.ent func_800BDB5C
func_800BDB5C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v1, 0x24($s0)
    beqz        $v1, .L800BDC4C
    addu        $s1, $a1, $zero
    lw          $v0, 0x40($s0)
    lw          $a2, 0x34($s0)
    lw          $a3, 0x34($s0)
    sra         $t6, $a2, 8
    sra         $t7, $a3, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002812  # mflo        $a1
    nop
    nop
    negu        $v1, $v1
    negu        $v0, $v0
    sra         $t6, $v0, 8
    sra         $t7, $v1, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    sll         $a0, $a0, 1
    jal         func_8002E99C
    addu        $a0, $a1, $a0
    lw          $a0, 0x34($s0)
    lw          $a1, 0x40($s0)
    negu        $v0, $v0
    subu        $a0, $v0, $a0
    jal         func_8002E7A0
    negu        $a1, $a1
    lw          $a2, 0x2C($s0)
    sra         $t6, $a2, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00003012  # mflo        $a2
    nop
    nop
    sw          $a2, 0x0($s1)
    lw          $a3, 0x30($s0)
    sra         $t6, $a3, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00003812  # mflo        $a3
    nop
    nop
    sw          $a3, 0x4($s1)
    lw          $v1, 0x1C($s0)
    lw          $a0, 0x0($s1)
    addu        $v1, $v1, $a0
    sw          $v1, 0x0($s1)
    lw          $v1, 0x20($s0)
    lw          $a0, 0x4($s1)
    sw          $v0, 0x8($s1)
    addu        $v1, $v1, $a0
    j           func_800B953C
    sw          $v1, 0x4($s1)
.L800BDC4C:
    lw          $v0, 0x1C($s0)
    sw          $v0, 0x0($s1)
    lw          $v0, 0x20($s0)
    sw          $zero, 0x8($s1)
    sw          $v0, 0x4($s1)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BDB5C
