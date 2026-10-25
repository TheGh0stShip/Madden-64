.text
.align 2
.set noreorder
.globl func_8005CCCC
.ent func_8005CCCC
func_8005CCCC:
    addiu       $sp, $sp, -0x40
    sw          $s2, 0x28($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s1, 0x1AC($s2)
    addu        $s0, $a1, $zero
    addu        $s4, $a2, $zero
    lw          $v0, 0x18($s1)
    lw          $s6, 0x54($sp)
    bnez        $v0, .L8005CD38
    addu        $s5, $a3, $zero
    lw          $v0, 0x4($s2)
    addiu       $v1, $zero, 0x1
    sw          $v1, 0x10($sp)
    lw          $a1, 0x8($s1)
    lw          $a2, 0x14($s1)
    lw          $a3, 0x10($s1)
    lw          $v0, 0x1C($v0)
    jalr        $v0
    nop
    sw          $v0, 0xC($s1)
.L8005CD38:
    lw          $s3, 0x18($s1)
    lw          $a2, 0x1C0($s2)
    lw          $v1, 0xC($s1)
    addiu       $v0, $s1, 0x18
    sw          $v0, 0x14($sp)
    sw          $v1, 0x10($sp)
    lw          $v0, 0x10($s1)
    addu        $a0, $s2, $zero
    addu        $a1, $s0, $zero
    sw          $v0, 0x18($sp)
    lw          $v0, 0x4($a2)
    addu        $a3, $s5, $zero
    jalr        $v0
    addu        $a2, $s4, $zero
    lw          $s0, 0x18($s1)
    sltu        $v0, $s3, $s0
    beqz        $v0, .L8005CDB0
    addu        $a0, $s2, $zero
    addu        $a2, $zero, $zero
    subu        $s0, $s0, $s3
    lw          $v0, 0x1C8($a0)
    addu        $a3, $s0, $zero
    lw          $v1, 0xC($s1)
    lw          $v0, 0x4($v0)
    sll         $a1, $s3, 2
    jalr        $v0
    addu        $a1, $v1, $a1
    lw          $v0, 0x0($s6)
    addu        $v0, $v0, $s0
    sw          $v0, 0x0($s6)
.L8005CDB0:
    lw          $v0, 0x18($s1)
    lw          $v1, 0x10($s1)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8005CDD4
    nop
    lw          $v0, 0x14($s1)
    sw          $zero, 0x18($s1)
    addu        $v0, $v0, $v1
    sw          $v0, 0x14($s1)
.L8005CDD4:
    lw          $ra, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_8005CCCC
