.text
.align 2
.set noreorder
.globl func_800BF044
.ent func_800BF044
func_800BF044:
    addu        $a1, $v1, $a0
    sra         $v0, $v0, 4
    subu        $v0, $v1, $v0
    sra         $t6, $s1, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    jal         func_8002E7A0
    nop
    .word       0x02300018  # mult        $s1, $s0
    .word       0x00008012  # mflo        $s0
    addu        $s1, $v0, $zero
    sra         $t6, $s3, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    sra         $t6, $s1, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    addu        $a0, $v0, $a0
    addu        $a1, $s5, $zero
    sra         $s0, $s0, 4
    jal         func_8002E7A0
    addu        $s0, $s1, $s0
    lw          $a2, 0x2C($s2)
    sra         $t6, $s1, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001812  # mflo        $v1
    nop
    nop
    sra         $t6, $s3, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    subu        $a0, $v1, $a0
    addu        $a1, $s5, $zero
    addu        $v0, $v0, $a2
    jal         func_8002E7A0
    sw          $v0, 0x2C($s4)
    lw          $v1, 0x30($s2)
    sra         $t6, $s0, 8
    sra         $t7, $s6, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    addu        $a1, $s5, $zero
    addu        $v0, $v0, $v1
    jal         func_8002E7A0
    sw          $v0, 0x30($s4)
    lw          $v1, 0x2C($s2)
    sra         $t6, $s0, 8
    sra         $t7, $s7, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00002012  # mflo        $a0
    nop
    nop
    addu        $a1, $s5, $zero
    addu        $v1, $v1, $v0
    jal         func_8002E7A0
    sw          $v1, 0x2C($s2)
    lw          $v1, 0x30($s2)
    addu        $v1, $v1, $v0
    addiu       $v0, $zero, 0x1
    sw          $v1, 0x30($s2)
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800BF044
