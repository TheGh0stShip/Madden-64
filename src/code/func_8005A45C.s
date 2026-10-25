.text
.align 2
.set noreorder
.globl func_8005A45C
.ent func_8005A45C
func_8005A45C:
    addiu       $sp, $sp, -0x58
    sw          $s1, 0x3C($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x40($sp)
    addu        $s2, $a1, $zero
    sw          $ra, 0x50($sp)
    sw          $s5, 0x4C($sp)
    sw          $s4, 0x48($sp)
    sw          $s3, 0x44($sp)
    sw          $s0, 0x38($sp)
    lw          $s4, 0x1B8($s1)
    lw          $v0, 0x198($s1)
    lw          $a0, 0x114($s1)
    addiu       $v1, $zero, 0x1
    beqz        $a0, .L8005A4C0
    sllv        $s5, $v1, $v0
    lw          $v0, 0x28($s4)
    bnel        $v0, $zero, .L8005A4C4
    sw          $s1, 0x24($sp)
    jal         func_80059E14
    addu        $a0, $s1, $zero
    bnel        $v0, $zero, .L8005A4C4
    sw          $s1, 0x24($sp)
    j .L8005A598
    addu        $v0, $zero, $zero
.L8005A4C0:
    sw          $s1, 0x24($sp)
.L8005A4C4:
    lw          $v0, 0x14($s1)
    lw          $v0, 0x0($v0)
    sw          $v0, 0x10($sp)
    lw          $v0, 0x14($s1)
    lw          $v0, 0x4($v0)
    sw          $v0, 0x14($sp)
    lw          $v0, 0x19C($s1)
    sw          $v0, 0x18($sp)
    lw          $a1, 0x8($s4)
    lw          $a2, 0xC($s4)
    addiu       $v0, $s4, 0x10
    sw          $v0, 0x28($sp)
    lw          $v0, 0x160($s1)
    blez        $v0, .L8005A560
    addu        $s0, $zero, $zero
    addu        $s3, $s2, $zero
.L8005A504:
    lw          $s2, 0x0($s3)
    bgtzl       $a2, .L8005A530
    addiu       $a2, $a2, -0x1
    addiu       $a0, $sp, 0x10
    jal         func_80059154
    addiu       $a3, $zero, 0x1
    beqz        $v0, .L8005A598
    addu        $v0, $zero, $zero
    lw          $a1, 0x1C($sp)
    lw          $a2, 0x20($sp)
    addiu       $a2, $a2, -0x1
.L8005A530:
    srav        $v0, $a1, $a2
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8005A54C
    nop
    lhu         $v0, 0x0($s2)
    or          $v0, $v0, $s5
    sh          $v0, 0x0($s2)
.L8005A54C:
    lw          $v0, 0x160($s1)
    addiu       $s0, $s0, 0x1
    slt         $v0, $s0, $v0
    bnez        $v0, .L8005A504
    addiu       $s3, $s3, 0x4
.L8005A560:
    lw          $v1, 0x14($s1)
    lw          $v0, 0x10($sp)
    sw          $v0, 0x0($v1)
    lw          $v1, 0x14($s1)
    lw          $v0, 0x14($sp)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x19C($s1)
    lw          $v1, 0x28($s4)
    addiu       $v0, $zero, 0x1
    sw          $a1, 0x8($s4)
    sw          $a2, 0xC($s4)
    addiu       $v1, $v1, -0x1
    sw          $v1, 0x28($s4)
.L8005A598:
    lw          $ra, 0x50($sp)
    lw          $s5, 0x4C($sp)
    lw          $s4, 0x48($sp)
    lw          $s3, 0x44($sp)
    lw          $s2, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_8005A45C
