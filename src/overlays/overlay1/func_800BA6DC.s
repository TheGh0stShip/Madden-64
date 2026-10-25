.text
.align 2
.set noreorder
.globl func_800BA6DC
.ent func_800BA6DC
func_800BA6DC:
    .word       0x00004812  # mflo        $t1
    nop
    nop
    sw          $t1, 0x20($sp)
    lw          $t1, 0x14($sp)
    sra         $t6, $t1, 8
    sra         $t7, $v0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00004812  # mflo        $t1
    nop
    nop
    sll         $a0, $s0, 16
    lui         $a2, 0x8009
    lhu         $a2, -0x5A4C($a2)
    sra         $a0, $a0, 16
    addiu       $a1, $sp, 0x10
    sw          $t1, 0x24($sp)
    jal         func_800B9274
    sll         $a2, $a2, 17
    sll         $a0, $s2, 24
    sra         $a0, $a0, 11
    lw          $v0, 0x20($sp)
    lw          $a1, 0x24($sp)
    lw          $t1, 0x10($sp)
    sra         $t6, $t1, 8
    sra         $t7, $a0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001812  # mflo        $v1
    nop
    nop
    lw          $t1, 0x14($sp)
    addu        $v0, $v0, $v1
    sw          $v0, 0x10($sp)
    sra         $t6, $t1, 8
    sra         $t7, $a0, 8
    .word       0x01CF0018  # mult        $t6, $t7
    .word       0x00001012  # mflo        $v0
    nop
    nop
    addu        $a1, $a1, $v0
    j           func_800B607C
    sw          $a1, 0x14($sp)
.end func_800BA6DC
