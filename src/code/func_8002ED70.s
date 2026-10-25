.text
.align 2
.set noreorder
.globl func_8002ED70
.ent func_8002ED70
func_8002ED70:
    addiu       $sp, $sp, -0x40
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x3
    sw          $ra, 0x38($sp)
    sw          $s3, 0x34($sp)
    sw          $s2, 0x30($sp)
    sw          $s1, 0x2C($sp)
    jal         func_8003C7E4
    sw          $s0, 0x28($sp)
    lui         $v1, 0x8009
    lw          $v1, -0x4DA0($v1)
    beqz        $v1, .L8002EDB4
    addu        $s0, $zero, $zero
    addiu       $s0, $s0, 0x1
.L8002EDA8:
    sltu        $v0, $s0, $v1
    bnel        $v0, $zero, .L8002EDA8
    addiu       $s0, $s0, 0x1
.L8002EDB4:
    lui         $a0, 0x8009
    lw          $a0, -0x4DA0($a0)
    addiu       $v0, $zero, -0x1
    sll         $v1, $a0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sw          $v0, 0x5138($at)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5138
    beqz        $a0, .L8002EE2C
    addu        $s0, $zero, $zero
    addiu       $s3, $zero, 0x6
    addiu       $s2, $zero, 0x5
    addu        $s1, $v0, $zero
.L8002EDEC:
    lw          $v0, 0x0($s1)
    bne         $v0, $s3, .L8002EE04
    addiu       $a0, $zero, 0x3
    jal         func_800218D4
    addu        $a1, $zero, $zero
    lw          $v0, 0x0($s1)
.L8002EE04:
    bne         $v0, $s2, .L8002EE14
    addiu       $a0, $zero, 0x2
    jal         func_800218D4
    addu        $a1, $zero, $zero
.L8002EE14:
    lui         $v0, 0x8009
    lw          $v0, -0x4DA0($v0)
    addiu       $s0, $s0, 0x1
    sltu        $v0, $s0, $v0
    bnez        $v0, .L8002EDEC
    addiu       $s1, $s1, 0x4
.L8002EE2C:
    lui         $at, 0x8009
    sw          $zero, -0x4DA0($at)
    jal         func_800334B8
    nop
    lui         $a1, 0x8009
    lw          $a1, -0x6D54($a1)
    jal         func_8003C7E4
    addu        $a0, $zero, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x72D4($v0)
    lui         $at, 0x8008
    sw          $v0, 0x6DD8($at)
    lw          $ra, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_8002ED70
