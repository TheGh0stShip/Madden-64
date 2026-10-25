.text
.align 2
.set noreorder
.globl func_8001AD78
.ent func_8001AD78
func_8001AD78:
    addiu       $sp, $sp, -0x38
    sw          $s3, 0x1C($sp)
    lui         $s3, 0x8007
    lw          $s3, -0x6D54($s3)
    sw          $s6, 0x28($sp)
    addu        $s6, $a0, $zero
    sw          $ra, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8007
    sw          $s6, -0x6D68($at)
    addu        $v0, $s3, $zero
    beqz        $v0, .L8001AE78
    addiu       $s3, $s3, -0x1
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x6B84
    sll         $v0, $s3, 2
    addu        $s4, $v0, $v1
.L8001ADD0:
    lw          $s5, 0x0($s4)
    lw          $s2, 0x8($s5)
    lw          $a1, 0x24($s2)
    beqz        $a1, .L8001AE00
    addu        $s7, $s3, $zero
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lw          $a1, 0x28($s2)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    sw          $zero, 0x24($s2)
    sw          $zero, 0x28($s2)
.L8001AE00:
    beqz        $s6, .L8001AE64
    addu        $a0, $zero, $zero
    lw          $s0, 0x0($s6)
    addu        $s1, $s0, $zero
    addiu       $s0, $s0, 0x1
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0x24($s2)
    addu        $a0, $zero, $zero
    sll         $s0, $s0, 2
    jal         func_80032E00
    addu        $a1, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addu        $a2, $s0, $zero
    addu        $a3, $zero, $zero
    jal         func_80033308
    sw          $a1, 0x2C($s2)
    lw          $v0, 0x2C($s2)
    sw          $s1, 0x0($v0)
.L8001AE64:
    jal         func_8001B314
    addu        $a0, $s5, $zero
    addiu       $s4, $s4, -0x4
    bnez        $s7, .L8001ADD0
    addiu       $s3, $s3, -0x1
.L8001AE78:
    lw          $ra, 0x30($sp)
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
.end func_8001AD78
