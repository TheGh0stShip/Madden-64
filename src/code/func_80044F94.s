.text
.align 2
.set noreorder
.globl func_80044F94
.ent func_80044F94
func_80044F94:
    addiu       $sp, $sp, -0x58
    sw          $s6, 0x48($sp)
    addu        $s6, $a1, $zero
    sw          $s0, 0x30($sp)
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x54($sp)
    sw          $fp, 0x50($sp)
    sw          $s7, 0x4C($sp)
    sw          $s5, 0x44($sp)
    sw          $s4, 0x40($sp)
    sw          $s3, 0x3C($sp)
    sw          $s2, 0x38($sp)
    sw          $s1, 0x34($sp)
    lui         $at, 0x8009
    sw          $v0, -0x5C20($at)
    jal         func_800448C4
    addu        $s0, $a0, $zero
    addu        $s4, $zero, $zero
    lui         $fp, 0x8007
    addiu       $fp, $fp, 0x48FC
    lui         $s7, 0x8007
    addiu       $s7, $s7, 0x4904
    andi        $s5, $s0, 0xFFFF
    sh          $s0, 0x18($sp)
    sw          $zero, 0x28($sp)
    lui         $at, 0x8008
    sh          $s0, -0x565C($at)
.L80045000:
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    andi        $s1, $s4, 0xFFFF
    sll         $s2, $s1, 1
    addu        $v0, $s2, $fp
    lhu         $a1, 0x0($v0)
    addu        $a2, $s1, $zero
    jal         func_800447C4
    addiu       $a3, $zero, 0x3
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    addu        $v0, $s2, $s7
    lhu         $a1, 0x0($v0)
    andi        $s3, $s4, 0xFF
    addiu       $s4, $s4, 0x1
    jal         func_80044694
    addu        $a2, $s1, $zero
    jal         func_8004445C
    addu        $a0, $s1, $zero
    addu        $s0, $s2, $s1
    sll         $s0, $s0, 2
    subu        $s0, $s0, $s1
    sll         $s0, $s0, 2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $a0, -0x56F8($at)
    addu        $s2, $s2, $s6
    lhu         $a2, 0x0($s2)
    addu        $a1, $s5, $zero
    addu        $a3, $s3, $zero
    sw          $s3, 0x10($sp)
    jal         func_80044530
    sw          $zero, 0x14($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $a0, -0x56F4($at)
    lhu         $a2, 0x0($s2)
    addu        $a1, $s5, $zero
    addu        $a3, $s3, $zero
    addiu       $v0, $zero, 0x1
    sw          $a3, 0x10($sp)
    jal         func_80044530
    sw          $v0, 0x14($sp)
    andi        $v0, $s4, 0xFFFF
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80045000
    nop
    lui         $a0, 0x8008
    lhu         $a0, -0x565C($a0)
    jal         func_800420B0
    addu        $a1, $zero, $zero
    lw          $ra, 0x54($sp)
    lw          $fp, 0x50($sp)
    lw          $s7, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_80044F94
