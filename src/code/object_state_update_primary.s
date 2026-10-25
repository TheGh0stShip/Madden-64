.text
.align 2
.set noreorder
.globl object_state_update_primary
.ent object_state_update_primary
object_state_update_primary:
    addiu       $sp, $sp, -0x80
    sw          $s1, 0x5C($sp)
    addu        $s1, $a0, $zero
    sw          $s0, 0x58($sp)
    sw          $ra, 0x7C($sp)
    sw          $fp, 0x78($sp)
    sw          $s7, 0x74($sp)
    sw          $s6, 0x70($sp)
    sw          $s5, 0x6C($sp)
    sw          $s4, 0x68($sp)
    sw          $s3, 0x64($sp)
    sw          $s2, 0x60($sp)
    lw          $v0, 0x114($s1)
    lw          $s2, 0x1B8($s1)
    lw          $fp, 0x198($s1)
    beqz        $v0, .L80059F24
    addu        $s0, $a1, $zero
    lw          $v0, 0x28($s2)
    bnel        $v0, $zero, .L80059F28
    sw          $s1, 0x2C($sp)
    jal         func_80059E14
    nop
    bnel        $v0, $zero, .L80059F28
    sw          $s1, 0x2C($sp)
    j .L8005A158
    addu        $v0, $zero, $zero
.L80059F24:
    sw          $s1, 0x2C($sp)
.L80059F28:
    lw          $v0, 0x14($s1)
    lw          $v0, 0x0($v0)
    sw          $v0, 0x18($sp)
    lw          $v0, 0x14($s1)
    lw          $v0, 0x4($v0)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x19C($s1)
    sw          $v0, 0x20($sp)
    lw          $t0, 0x8($s2)
    lw          $a2, 0xC($s2)
    addiu       $v0, $s2, 0x10
    sw          $v0, 0x30($sp)
    lw          $v0, 0x14($s2)
    lw          $v1, 0x18($s2)
    lw          $a0, 0x1C($s2)
    lw          $a1, 0x20($s2)
    sw          $v0, 0x38($sp)
    sw          $v1, 0x3C($sp)
    sw          $a0, 0x40($sp)
    sw          $a1, 0x44($sp)
    lw          $v0, 0x24($s2)
    sw          $v0, 0x48($sp)
    lw          $v0, 0x160($s1)
    blez        $v0, .L8005A0F8
    addu        $s3, $zero, $zero
    addu        $s6, $s1, $zero
    addu        $s5, $s0, $zero
.L80059F94:
    lw          $s4, 0x164($s6)
    sll         $v0, $s4, 2
    addu        $v0, $v0, $s1
    lw          $v0, 0x148($v0)
    lw          $v0, 0x14($v0)
    lw          $s7, 0x0($s5)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s2
    lw          $s0, 0x2C($v0)
    slti        $v0, $a2, 0x8
    beqz        $v0, .L80059FEC
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $zero, $zero
    beqz        $v0, .L8005A158
    addu        $v0, $zero, $zero
    lw          $a2, 0x28($sp)
    lw          $t0, 0x24($sp)
    slti        $v0, $a2, 0x8
    bnez        $v0, .L8005A020
    addiu       $v0, $zero, 0x1
.L80059FEC:
    addiu       $v0, $a2, -0x8
    srav        $v0, $t0, $v0
    andi        $v1, $v0, 0xFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s0
    lw          $v0, 0xD4($v0)
    beql        $v0, $zero, .L8005A020
    addiu       $v0, $zero, 0x9
    subu        $a2, $a2, $v0
    addu        $v0, $s0, $v1
    lbu         $s0, 0x4D4($v0)
    j .L8005A048
    nop
.L8005A020:
    sw          $v0, 0x10($sp)
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_800592E8
    addu        $a3, $s0, $zero
    addu        $s0, $v0, $zero
    bltz        $s0, .L8005A158
    addu        $v0, $zero, $zero
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L8005A048:
    beqz        $s0, .L8005A0C0
    slt         $v0, $a2, $s0
    beqz        $v0, .L8005A074
    addiu       $a0, $sp, 0x18
    addu        $a1, $t0, $zero
    jal         func_80059154
    addu        $a3, $s0, $zero
    beqz        $v0, .L8005A158
    addu        $v0, $zero, $zero
    lw          $t0, 0x24($sp)
    lw          $a2, 0x28($sp)
.L8005A074:
    subu        $a2, $a2, $s0
    srav        $a0, $t0, $a2
    addiu       $v1, $zero, 0x1
    sllv        $v1, $v1, $s0
    sll         $a1, $s0, 2
    lui         $t1, 0x8000
    addiu       $t1, $t1, 0x32B0
    addu        $v0, $a1, $t1
    lw          $v0, 0x0($v0)
    addiu       $v1, $v1, -0x1
    and         $a3, $a0, $v1
    slt         $v0, $a3, $v0
    beqz        $v0, .L8005A0C0
    addu        $s0, $a3, $zero
    lui         $at, 0x8000
    addu        $at, $at, $a1
    lw          $v0, 0x32F0($at)
    addu        $a3, $a3, $v0
    addu        $s0, $a3, $zero
.L8005A0C0:
    sll         $v1, $s4, 2
    addiu       $v0, $sp, 0x18
    addu        $v1, $v1, $v0
    lw          $v0, 0x24($v1)
    addiu       $s6, $s6, 0x4
    addu        $s0, $s0, $v0
    sllv        $v0, $s0, $fp
    sw          $s0, 0x24($v1)
    sh          $v0, 0x0($s7)
    lw          $v0, 0x160($s1)
    addiu       $s3, $s3, 0x1
    slt         $v0, $s3, $v0
    bnez        $v0, .L80059F94
    addiu       $s5, $s5, 0x4
.L8005A0F8:
    lw          $v1, 0x14($s1)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x0($v1)
    lw          $v1, 0x14($s1)
    lw          $v0, 0x1C($sp)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x20($sp)
    sw          $v0, 0x19C($s1)
    sw          $t0, 0x8($s2)
    sw          $a2, 0xC($s2)
    lw          $v0, 0x38($sp)
    lw          $v1, 0x3C($sp)
    lw          $a0, 0x40($sp)
    lw          $a1, 0x44($sp)
    sw          $v0, 0x14($s2)
    sw          $v1, 0x18($s2)
    sw          $a0, 0x1C($s2)
    sw          $a1, 0x20($s2)
    lw          $v0, 0x48($sp)
    sw          $v0, 0x24($s2)
    lw          $v1, 0x28($s2)
    addiu       $v0, $zero, 0x1
    addiu       $v1, $v1, -0x1
    sw          $v1, 0x28($s2)
.L8005A158:
    lw          $ra, 0x7C($sp)
    lw          $fp, 0x78($sp)
    lw          $s7, 0x74($sp)
    lw          $s6, 0x70($sp)
    lw          $s5, 0x6C($sp)
    lw          $s4, 0x68($sp)
    lw          $s3, 0x64($sp)
    lw          $s2, 0x60($sp)
    lw          $s1, 0x5C($sp)
    lw          $s0, 0x58($sp)
    addiu       $sp, $sp, 0x80
    jr          $ra
    nop
.end object_state_update_primary
