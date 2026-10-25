.text
.align 2
.set noreorder
.globl func_8005CE00
.ent func_8005CE00
func_8005CE00:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x20($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s0, 0x1AC($s2)
    lw          $s5, 0x48($sp)
    lw          $v0, 0x18($s0)
    lw          $s3, 0x4C($sp)
    lw          $s4, 0x50($sp)
    bnez        $v0, .L8005CE64
    nop
    lw          $v0, 0x4($s2)
    sw          $zero, 0x10($sp)
    lw          $a1, 0x8($s0)
    lw          $a2, 0x14($s0)
    lw          $a3, 0x10($s0)
    lw          $v0, 0x1C($v0)
    jalr        $v0
    nop
    sw          $v0, 0xC($s0)
.L8005CE64:
    lw          $v0, 0x10($s0)
    lw          $a1, 0x18($s0)
    lw          $a2, 0x0($s3)
    subu        $s1, $v0, $a1
    subu        $v1, $s4, $a2
    sltu        $v0, $v1, $s1
    bnel        $v0, $zero, .L8005CE84
    addu        $s1, $v1, $zero
.L8005CE84:
    lw          $v0, 0x74($s2)
    lw          $v1, 0x14($s0)
    subu        $v1, $v0, $v1
    sltu        $v0, $v1, $s1
    bnel        $v0, $zero, .L8005CE9C
    addu        $s1, $v1, $zero
.L8005CE9C:
    addu        $a0, $s2, $zero
    sll         $a2, $a2, 2
    addu        $a2, $s5, $a2
    lw          $v0, 0x1C8($a0)
    addu        $a3, $s1, $zero
    lw          $v1, 0xC($s0)
    lw          $v0, 0x4($v0)
    sll         $a1, $a1, 2
    jalr        $v0
    addu        $a1, $v1, $a1
    lw          $v0, 0x0($s3)
    addu        $v0, $v0, $s1
    sw          $v0, 0x0($s3)
    lw          $v0, 0x18($s0)
    lw          $v1, 0x10($s0)
    addu        $v0, $v0, $s1
    sw          $v0, 0x18($s0)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8005CEFC
    nop
    lw          $v0, 0x14($s0)
    sw          $zero, 0x18($s0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x14($s0)
.L8005CEFC:
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8005CE00
