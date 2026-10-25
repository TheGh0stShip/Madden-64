.text
.align 2
.set noreorder
.globl func_800BD998
.ent func_800BD998
func_800BD998:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $a2, $zero
    sw          $s0, 0x10($sp)
    sll         $s0, $a0, 16
    sra         $s0, $s0, 16
    sw          $ra, 0x1C($sp)
    jal         func_8002E848
    addu        $a0, $s0, $zero
    sra         $t6, $s1, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001812  # mflo        $v1
    nop
    nop
    addu        $a0, $s0, $zero
    jal         func_8002E828
    sw          $v1, 0x0($s2)
    sra         $t6, $s1, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001812  # mflo        $v1
    nop
    nop
    sw          $v1, 0x4($s2)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BD998
