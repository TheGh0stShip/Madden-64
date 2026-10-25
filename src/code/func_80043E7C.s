.text
.align 2
.set noreorder
.globl func_80043E7C
.ent func_80043E7C
func_80043E7C:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    sw          $s3, 0x2C($sp)
    addu        $s3, $a1, $zero
    sw          $ra, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s2, 0x28($sp)
    sw          $s0, 0x20($sp)
    lui         $a1, 0x8000
    addiu       $a1, $a1, 0x300C
    lw          $v0, 0x0($a1)
    lw          $v1, 0x4($a1)
    lw          $a0, 0x8($a1)
    sw          $v0, 0x10($sp)
    sw          $v1, 0x14($sp)
    sw          $a0, 0x18($sp)
    lw          $v0, 0xC($a1)
    sw          $v0, 0x1C($sp)
    lw          $s2, 0x8($s1)
    lh          $s0, 0x12($s2)
    addiu       $s4, $sp, 0x10
    andi        $a2, $a2, 0xFFFF
    bnez        $a2, .L80043EE4
    negu        $s0, $s0
    addiu       $s0, $s0, 0x800
.L80043EE4:
    jal         func_8002CAD0
    nop
    jal         func_8002DA14
    addiu       $a0, $s1, 0x1C
    jal         func_8002CD44
    addiu       $a0, $zero, 0x400
    jal         func_8002CF48
    addu        $a0, $s0, $zero
    jal         func_8002D14C
    addu        $a0, $zero, $zero
    lw          $s2, 0x3C($s2)
    lui         $v0, 0x35
    ori         $v0, $v0, 0x5555
    .word       0x02420018  # mult        $s2, $v0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    addu        $a1, $a0, $zero
    jal         func_8002D8D0
    addu        $a2, $a0, $zero
    jal         func_8002DA14
    addu        $a0, $s3, $zero
    addu        $a0, $s4, $zero
    jal         func_8002DBD0
    addu        $a1, $s3, $zero
    jal         func_8002CD28
    nop
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_80043E7C
