.text
.align 2
.set noreorder
.globl func_800C0018
.ent func_800C0018
func_800C0018:
    addu        $v1, $v1, $v0
    bltzl       $v1, .L800C0024
    negu        $v1, $v1
.L800C0024:
    bgez        $a0, .L800C0030
    addu        $a1, $a0, $zero
    negu        $a1, $a0
.L800C0030:
    slt         $v0, $v1, $a1
    beqz        $v0, .L800C004C
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    j           func_800BB938
    addu        $a0, $a1, $v0
.L800C004C:
    srl         $v0, $a1, 31
    addu        $v0, $a1, $v0
    sra         $v0, $v0, 1
    addu        $a0, $v1, $v0
    sltu        $v0, $a0, $t1
    beqz        $v0, .L800C0070
    addiu       $v0, $t0, 0x1
    addu        $t1, $a0, $zero
    addu        $s1, $t0, $zero
.L800C0070:
    addu        $t0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $t3
    bnez        $v0, . + 4 + (-0x3D << 2)
    sll         $v0, $t0, 16
    lui         $v1, 0x5F
    ori         $v1, $v1, 0xFFFF
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    nor         $v0, $zero, $v0
    sltu        $v0, $zero, $v0
    sltu        $v1, $v1, $t1
    xori        $v1, $v1, 0x1
    and         $v0, $v0, $v1
    bnez        $v0, .L800C00BC
    nop
    j           func_800BB9D8
    addu        $v0, $zero, $zero
.L800C00BC:
    jal         func_800E1C98
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0xB
    sb          $v0, 0x10($sp)
    addiu       $v0, $s1, -0x80
    sb          $v0, 0x11($sp)
    jal         func_800E1A84
    sb          $zero, 0x12($sp)
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x10
    addiu       $v0, $zero, 0x11
    jal         func_800E1B00
    sb          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x1
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C0018
