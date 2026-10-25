.text
.align 2
.set noreorder
.globl func_800C3E14
.ent func_800C3E14
func_800C3E14:
    addiu       $sp, $sp, -0x38
    sw          $s7, 0x2C($sp)
    addu        $s7, $a1, $zero
    sw          $s5, 0x24($sp)
    addu        $s5, $a0, $zero
    addu        $a0, $zero, $zero
    andi        $a1, $s5, 0xFFFF
    sw          $ra, 0x34($sp)
    sw          $fp, 0x30($sp)
    sw          $s6, 0x28($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8009
    sh          $s5, -0x498E($at)
    jal         func_80033174
    addiu       $a2, $zero, 0xB0
    addu        $s1, $zero, $zero
    lui         $v1, 0x8009
    addiu       $v1, $v1, -0x7F10
    lui         $at, 0x8008
    sw          $v0, -0x5AB0($at)
    andi        $v0, $s1, 0xFFFF
.L800C3E78:
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sw          $zero, 0x0($v0)
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x8
    bnez        $v0, .L800C3E78
    andi        $v0, $s1, 0xFFFF
    addu        $s2, $zero, $zero
    andi        $v0, $s5, 0xFFFF
    srl         $v0, $v0, 1
    sltu        $fp, $zero, $v0
    lui         $s6, 0x8007
    addiu       $s6, $s6, -0x65B8
.L800C3EB0:
    beqz        $fp, .L800C4008
    addu        $s1, $zero, $zero
    andi        $v0, $s2, 0xFFFF
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $a3, 0x8008
    addiu       $a3, $a3, 0x5040
    addu        $s4, $v1, $a3
    andi        $v0, $s5, 0xFFFF
    srl         $s3, $v0, 1
.L800C3EE4:
    lui         $a0, 0x8008
    lw          $a0, -0x5AB0($a0)
    jal         func_80033298
    nop
    addu        $s0, $v0, $zero
    jal         func_800C2310
    addu        $a0, $s0, $zero
    addu        $a0, $s7, $zero
    andi        $v0, $s1, 0xFFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    sw          $s0, 0x0($v0)
    sb          $s2, 0x1E($s0)
    sb          $s1, 0x1F($s0)
    sb          $zero, 0x20($s0)
    sb          $zero, 0x21($s0)
    lui         $v0, 0x8009
    lw          $v0, -0x79D0($v0)
    addiu       $a1, $zero, 0x7
    addu        $a2, $s6, $zero
    sh          $zero, 0x28($s0)
    sh          $zero, 0x30($s0)
    jal         func_8000D740
    sw          $v0, 0x0($s6)
    sw          $v0, 0x24($s0)
    sw          $zero, 0x1C($v0)
    lw          $v0, 0x24($s0)
    sw          $zero, 0xA8($s0)
    sw          $zero, 0x20($v0)
    lw          $v0, 0x24($s0)
    sw          $zero, 0xAC($s0)
    sw          $zero, 0x24($v0)
    lw          $v0, 0x24($s0)
    sw          $zero, 0x2C($v0)
    lw          $v0, 0x24($s0)
    sw          $zero, 0x30($v0)
    lw          $v0, 0x24($s0)
    sw          $zero, 0x34($v0)
    lw          $v0, 0x24($s0)
    sh          $zero, 0x3E($v0)
    lw          $v1, 0x24($s0)
    addiu       $v0, $zero, 0x96
    sh          $v0, 0x3C($v1)
    lw          $v1, 0x24($s0)
    addiu       $v0, $zero, 0x2000
    sw          $v0, 0x40($v1)
    lw          $v1, 0x24($s0)
    addiu       $v0, $zero, 0x1800
    sw          $v0, 0x44($v1)
    lw          $v1, 0x24($s0)
    addiu       $v0, $zero, 0x235
    sw          $v0, 0x14($v1)
    lw          $v1, 0x24($s0)
    lui         $v0, 0x800C
    addiu       $v0, $v0, -0x694
    sw          $v0, 0xC($v1)
    lw          $v0, 0x24($s0)
    sw          $s0, 0x10($v0)
    lw          $a0, 0x24($s0)
    jal         func_800B95D8
    addiu       $s1, $s1, 0x1
    lw          $v0, 0x24($s0)
    lw          $v0, 0x48($v0)
    sh          $zero, 0x16($v0)
    lw          $a0, 0x24($s0)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x4824
    jal         func_800B96C0
    nop
    andi        $v0, $s1, 0xFFFF
    sltu        $v0, $v0, $s3
    bnez        $v0, .L800C3EE4
    nop
.L800C4008:
    addiu       $s2, $s2, 0x1
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C3EB0
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x55F8($a0)
    jal         func_800E18D0
    nop
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
.end func_800C3E14
