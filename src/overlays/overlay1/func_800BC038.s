.text
.align 2
.set noreorder
.globl func_800BC038
.ent func_800BC038
func_800BC038:
    nop
    jal         func_8000BF08
    nop
    jal         func_8004583C
    nop
    jal         func_80030110
    nop
    jal         func_80030050
    nop
    beqz        $s0, . + 4 + (-0x2D << 2)
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x5088($v0)
    blez        $v0, .L800BC0B8
    addu        $a0, $zero, $zero
    addiu       $a3, $zero, -0x2
    addu        $a2, $v0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x5C18
.L800BC094:
    lw          $v1, 0x0($a1)
    beqz        $v1, .L800BC0AC
    addiu       $a0, $a0, 0x1
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $a3
    sw          $v0, 0x14($v1)
.L800BC0AC:
    slt         $v0, $a0, $a2
    bnez        $v0, .L800BC094
    addiu       $a1, $a1, 0x4
.L800BC0B8:
    jal         func_800B6D1C
    nop
    jal         func_800BF1C8
    nop
    andi        $v0, $s6, 0x1000
    sltu        $v0, $zero, $v0
    lui         $at, 0x8009
    sh          $zero, -0x5080($at)
    lui         $at, 0x8007
    sh          $zero, 0x18E2($at)
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800BC038
