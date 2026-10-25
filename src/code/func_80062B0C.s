.text
.align 2
.set noreorder
.globl func_80062B0C
.ent func_80062B0C
func_80062B0C:
    addiu       $sp, $sp, -0x38
    sw          $ra, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s0, 0x1C0($a0)
    lw          $v1, 0x50($sp)
    lw          $v0, 0x24($s0)
    lw          $t0, 0x48($sp)
    lw          $s3, 0x4C($sp)
    beqz        $v0, .L80062B78
    addu        $s2, $a2, $zero
    addiu       $a0, $s0, 0x20
    addu        $a1, $zero, $zero
    addu        $a3, $zero, $zero
    lw          $a2, 0x0($s3)
    addiu       $s1, $zero, 0x1
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x10($sp)
    lw          $v0, 0x28($s0)
    sll         $a2, $a2, 2
    addu        $a2, $t0, $a2
    jal         func_80063250
    sw          $v0, 0x14($sp)
    j .L80062BF4
    sw          $zero, 0x24($s0)
.L80062B78:
    lw          $a2, 0x2C($s0)
    sltiu       $v0, $a2, 0x2
    beqz        $v0, .L80062B8C
    addiu       $s1, $zero, 0x2
    addu        $s1, $a2, $zero
.L80062B8C:
    lw          $a2, 0x0($s3)
    subu        $v1, $v1, $a2
    sltu        $v0, $v1, $s1
    bnel        $v0, $zero, .L80062BA0
    addu        $s1, $v1, $zero
.L80062BA0:
    sll         $v0, $a2, 2
    addu        $v0, $v0, $t0
    lw          $v0, 0x0($v0)
    sw          $v0, 0x18($sp)
    sltiu       $v0, $s1, 0x2
    bnez        $v0, .L80062BD4
    nop
    lw          $v0, 0x0($s3)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $t0
    lw          $v0, 0x4($v0)
    j .L80062BE4
    sw          $v0, 0x1C($sp)
.L80062BD4:
    lw          $v0, 0x20($s0)
    sw          $v0, 0x1C($sp)
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x24($s0)
.L80062BE4:
    lw          $a2, 0x0($s2)
    lw          $v0, 0xC($s0)
    jalr        $v0
    addiu       $a3, $sp, 0x18
.L80062BF4:
    lw          $v0, 0x0($s3)
    addu        $v0, $v0, $s1
    sw          $v0, 0x0($s3)
    lw          $v0, 0x2C($s0)
    lw          $v1, 0x24($s0)
    subu        $v0, $v0, $s1
    bnez        $v1, .L80062C20
    sw          $v0, 0x2C($s0)
    lw          $v0, 0x0($s2)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x0($s2)
.L80062C20:
    lw          $ra, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_80062B0C
