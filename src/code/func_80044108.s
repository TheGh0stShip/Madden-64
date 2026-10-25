.text
.align 2
.set noreorder
.globl func_80044108
.ent func_80044108
func_80044108:
    addiu       $sp, $sp, -0x70
    lhu         $v0, 0x82($sp)
    sw          $s2, 0x50($sp)
    addu        $s2, $a0, $zero
    sw          $s6, 0x60($sp)
    addu        $s6, $a1, $zero
    sw          $s7, 0x64($sp)
    addu        $s7, $a2, $zero
    sw          $ra, 0x68($sp)
    sw          $s5, 0x5C($sp)
    sw          $s4, 0x58($sp)
    sw          $s3, 0x54($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0x300C
    lw          $v1, 0x0($a2)
    lw          $a0, 0x4($a2)
    lw          $a1, 0x8($a2)
    sw          $v1, 0x30($sp)
    sw          $a0, 0x34($sp)
    sw          $a1, 0x38($sp)
    lw          $v1, 0xC($a2)
    sw          $v1, 0x3C($sp)
    lw          $s3, 0x8($s2)
    lh          $s1, 0x12($s3)
    addu        $s4, $a3, $zero
    addiu       $s5, $sp, 0x30
    bnez        $v0, .L80044184
    negu        $s1, $s1
    addiu       $s1, $s1, 0x800
.L80044184:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addu        $a0, $s3, $zero
    sw          $v0, 0x10($sp)
    lw          $a3, 0x18($s2)
    addiu       $a1, $sp, 0x40
    jal         func_80043114
    addiu       $a2, $sp, 0x44
    jal         func_8002CAD0
    andi        $s0, $v0, 0xFF
    jal         func_8002DA14
    addiu       $a0, $s2, 0x1C
    jal         func_8002CD44
    addiu       $a0, $zero, 0x400
    jal         func_8002CF48
    addu        $a0, $s1, $zero
    jal         func_8002D14C
    addu        $a0, $zero, $zero
    lw          $s3, 0x3C($s3)
    addiu       $v1, $zero, 0x3555
    .word       0x02630018  # mult        $s3, $v1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    addu        $a1, $a0, $zero
    jal         func_8002D8D0
    addu        $a2, $a0, $zero
    sw          $s0, 0x10($sp)
    lw          $a1, 0x40($sp)
    lw          $a2, 0x44($sp)
    addiu       $a0, $sp, 0x18
    jal         func_80042F50
    andi        $a3, $s6, 0xFF
    jal         func_8002DA14
    addiu       $a0, $sp, 0x18
    addu        $a0, $s5, $zero
    jal         func_8002DBD0
    addu        $a1, $s7, $zero
    lw          $v0, 0x24($sp)
    sh          $v0, 0x0($s4)
    lw          $v0, 0x28($sp)
    sh          $v0, 0x2($s4)
    lw          $v0, 0x2C($sp)
    jal         func_8002CD28
    sh          $v0, 0x4($s4)
    lw          $ra, 0x68($sp)
    lw          $s7, 0x64($sp)
    lw          $s6, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end func_80044108
