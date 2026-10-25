.text
.align 2
.set noreorder
.globl object_state_machine_advance
.ent object_state_machine_advance
object_state_machine_advance:
    addiu       $sp, $sp, -0x1B0
    sw          $s7, 0x1A4($sp)
    addu        $s7, $a0, $zero
    sw          $ra, 0x1AC($sp)
    sw          $fp, 0x1A8($sp)
    sw          $s6, 0x1A0($sp)
    sw          $s5, 0x19C($sp)
    sw          $s4, 0x198($sp)
    sw          $s3, 0x194($sp)
    sw          $s2, 0x190($sp)
    sw          $s1, 0x18C($sp)
    sw          $s0, 0x188($sp)
    lw          $t0, 0x1B8($s7)
    addu        $s1, $a1, $zero
    sw          $t0, 0x13C($sp)
    lw          $a0, 0x198($s7)
    lw          $t1, 0x190($s7)
    addiu       $v0, $zero, 0x1
    sllv        $v0, $v0, $a0
    sw          $t1, 0x144($sp)
    sw          $v0, 0x14C($sp)
    lw          $v1, 0x114($s7)
    addiu       $v0, $zero, -0x1
    sllv        $v0, $v0, $a0
    beqz        $v1, .L8005A644
    sw          $v0, 0x154($sp)
    lw          $v0, 0x28($t0)
    bnel        $v0, $zero, .L8005A648
    sw          $s7, 0x2C($sp)
    jal         func_80059E14
    addu        $a0, $s7, $zero
    beqz        $v0, .L8005AA9C
    addu        $v0, $zero, $zero
.L8005A644:
    sw          $s7, 0x2C($sp)
.L8005A648:
    lw          $v0, 0x14($s7)
    lw          $v0, 0x0($v0)
    sw          $v0, 0x18($sp)
    lw          $v0, 0x14($s7)
    lw          $t0, 0x13C($sp)
    lw          $v0, 0x4($v0)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x19C($s7)
    sw          $v0, 0x20($sp)
    lw          $s4, 0x8($t0)
    lw          $s0, 0xC($t0)
    addiu       $v0, $t0, 0x10
    sw          $zero, 0x174($sp)
    sw          $v0, 0x30($sp)
    lw          $t1, 0x14($t0)
    sw          $t1, 0x15C($sp)
    lw          $s1, 0x0($s1)
    lw          $s6, 0x18C($s7)
    sw          $s1, 0x164($sp)
    lw          $t0, 0x3C($t0)
    bnez        $t1, .L8005A954
    sw          $t0, 0x16C($sp)
    lw          $t1, 0x144($sp)
    slt         $v0, $t1, $s6
    bnez        $v0, .L8005A948
    sll         $v0, $s6, 2
    lui         $t0, 0x8000
    addiu       $t0, $t0, 0x3528
    addu        $fp, $v0, $t0
.L8005A6BC:
    slti        $v0, $s0, 0x8
    beqz        $v0, .L8005A6F4
    addiu       $a0, $sp, 0x18
    addu        $a1, $s4, $zero
    addu        $a2, $s0, $zero
    jal         func_80059154
    addu        $a3, $zero, $zero
    beqz        $v0, .L8005AA5C
    nop
    lw          $s0, 0x28($sp)
    lw          $s4, 0x24($sp)
    slti        $v0, $s0, 0x8
    bnez        $v0, .L8005A72C
    addiu       $v0, $zero, 0x1
.L8005A6F4:
    addiu       $v0, $s0, -0x8
    srav        $v0, $s4, $v0
    lw          $t1, 0x16C($sp)
    andi        $v1, $v0, 0xFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $t1
    lw          $v0, 0xD4($v0)
    beql        $v0, $zero, .L8005A72C
    addiu       $v0, $zero, 0x9
    subu        $s0, $s0, $v0
    addu        $v0, $t1, $v1
    lbu         $s2, 0x4D4($v0)
    j .L8005A758
    sra         $s3, $s2, 4
.L8005A72C:
    addiu       $a0, $sp, 0x18
    lw          $a3, 0x16C($sp)
    addu        $a1, $s4, $zero
    addu        $a2, $s0, $zero
    jal         func_800592E8
    sw          $v0, 0x10($sp)
    addu        $s2, $v0, $zero
    bltz        $s2, .L8005AA5C
    sra         $s3, $s2, 4
    lw          $s4, 0x24($sp)
    lw          $s0, 0x28($sp)
.L8005A758:
    andi        $s2, $s2, 0xF
    beqz        $s2, .L8005A7D8
    addiu       $t0, $zero, 0x1
    beq         $s2, $t0, .L8005A788
    addiu       $v0, $zero, 0x72
    lw          $v1, 0x0($s7)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s7)
    lw          $v0, 0x4($v0)
    addu        $a0, $s7, $zero
    jalr        $v0
    addiu       $a1, $zero, -0x1
.L8005A788:
    bgtzl       $s0, .L8005A7B8
    addiu       $s0, $s0, -0x1
    addiu       $a0, $sp, 0x18
    addu        $a1, $s4, $zero
    addu        $a2, $s0, $zero
    jal         func_80059154
    addiu       $a3, $zero, 0x1
    beqz        $v0, .L8005AA5C
    nop
    lw          $s4, 0x24($sp)
    lw          $s0, 0x28($sp)
    addiu       $s0, $s0, -0x1
.L8005A7B8:
    lw          $s2, 0x154($sp)
    srav        $v0, $s4, $s0
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8005A840
    sll         $v0, $s6, 2
    lw          $s2, 0x14C($sp)
    j .L8005A83C
    nop
.L8005A7D8:
    addiu       $v0, $zero, 0xF
    beq         $s3, $v0, .L8005A83C
    addiu       $t1, $zero, 0x1
    sllv        $t1, $t1, $s3
    beqz        $s3, .L8005A948
    sw          $t1, 0x15C($sp)
    slt         $v0, $s0, $s3
    beqz        $v0, .L8005A81C
    addiu       $a0, $sp, 0x18
    addu        $a1, $s4, $zero
    addu        $a2, $s0, $zero
    jal         func_80059154
    addu        $a3, $s3, $zero
    beqz        $v0, .L8005AA5C
    nop
    lw          $s4, 0x24($sp)
    lw          $s0, 0x28($sp)
.L8005A81C:
    lw          $t0, 0x15C($sp)
    subu        $s0, $s0, $s3
    srav        $v1, $s4, $s0
    addiu       $v0, $t0, -0x1
    and         $s3, $v1, $v0
    addu        $t0, $t0, $s3
    j .L8005A948
    sw          $t0, 0x15C($sp)
.L8005A83C:
    sll         $v0, $s6, 2
.L8005A840:
    lui         $t1, 0x8000
    addiu       $t1, $t1, 0x3528
    addu        $s5, $v0, $t1
.L8005A84C:
    lw          $v0, 0x0($s5)
    lw          $t0, 0x164($sp)
    sll         $v0, $v0, 1
    addu        $s1, $t0, $v0
    lh          $v0, 0x0($s1)
    beql        $v0, $zero, .L8005A8DC
    addiu       $s3, $s3, -0x1
    bgtzl       $s0, .L8005A898
    addiu       $s0, $s0, -0x1
    addiu       $a0, $sp, 0x18
    addu        $a1, $s4, $zero
    addu        $a2, $s0, $zero
    jal         func_80059154
    addiu       $a3, $zero, 0x1
    beqz        $v0, .L8005AA5C
    nop
    lw          $s4, 0x24($sp)
    lw          $s0, 0x28($sp)
    addiu       $s0, $s0, -0x1
.L8005A898:
    srav        $v0, $s4, $s0
    andi        $v0, $v0, 0x1
    beql        $v0, $zero, .L8005A8E8
    addiu       $s5, $s5, 0x4
    lh          $a0, 0x0($s1)
    lw          $t1, 0x14C($sp)
    and         $v0, $a0, $t1
    bnez        $v0, .L8005A8E4
    addu        $v1, $a0, $zero
    bltz        $a0, .L8005A8CC
    addu        $v0, $v1, $t1
    j .L8005A8E4
    sh          $v0, 0x0($s1)
.L8005A8CC:
    lw          $t0, 0x154($sp)
    addu        $v0, $v1, $t0
    j .L8005A8E4
    sh          $v0, 0x0($s1)
.L8005A8DC:
    bltz        $s3, .L8005A8FC
    nop
.L8005A8E4:
    addiu       $s5, $s5, 0x4
.L8005A8E8:
    lw          $t1, 0x144($sp)
    addiu       $s6, $s6, 0x1
    slt         $v0, $t1, $s6
    beqz        $v0, .L8005A84C
    addiu       $fp, $fp, 0x4
.L8005A8FC:
    beqz        $s2, .L8005A934
    nop
    lw          $t0, 0x174($sp)
    lw          $a0, 0x0($fp)
    lw          $t1, 0x164($sp)
    sll         $v1, $t0, 2
    addiu       $t0, $t0, 0x1
    sll         $v0, $a0, 1
    addu        $v0, $v0, $t1
    sw          $t0, 0x174($sp)
    sh          $s2, 0x0($v0)
    addiu       $v0, $sp, 0x18
    addu        $v1, $v1, $v0
    sw          $a0, 0x20($v1)
.L8005A934:
    lw          $t0, 0x144($sp)
    addiu       $s6, $s6, 0x1
    slt         $v0, $t0, $s6
    beqz        $v0, .L8005A6BC
    addiu       $fp, $fp, 0x4
.L8005A948:
    lw          $t1, 0x15C($sp)
    beqz        $t1, .L8005AA14
    nop
.L8005A954:
    lw          $t0, 0x144($sp)
    slt         $v0, $t0, $s6
    bnez        $v0, .L8005AA08
    sll         $v0, $s6, 2
    lui         $v1, 0x8000
    addiu       $v1, $v1, 0x3528
    addu        $s2, $v0, $v1
.L8005A970:
    lw          $v0, 0x0($s2)
    lw          $t1, 0x164($sp)
    sll         $v0, $v0, 1
    addu        $s1, $t1, $v0
    lh          $v0, 0x0($s1)
    beqz        $v0, .L8005A9F4
    nop
    bgtzl       $s0, .L8005A9BC
    addiu       $s0, $s0, -0x1
    addiu       $a0, $sp, 0x18
    addu        $a1, $s4, $zero
    addu        $a2, $s0, $zero
    jal         func_80059154
    addiu       $a3, $zero, 0x1
    beqz        $v0, .L8005AA5C
    nop
    lw          $s4, 0x24($sp)
    lw          $s0, 0x28($sp)
    addiu       $s0, $s0, -0x1
.L8005A9BC:
    srav        $v0, $s4, $s0
    andi        $v0, $v0, 0x1
    beqz        $v0, .L8005A9F4
    nop
    lh          $a0, 0x0($s1)
    lw          $t0, 0x14C($sp)
    and         $v0, $a0, $t0
    bnez        $v0, .L8005A9F4
    addu        $v1, $a0, $zero
    bgez        $a0, .L8005A9F0
    addu        $v0, $v1, $t0
    lw          $t1, 0x154($sp)
    addu        $v0, $v1, $t1
.L8005A9F0:
    sh          $v0, 0x0($s1)
.L8005A9F4:
    lw          $t0, 0x144($sp)
    addiu       $s6, $s6, 0x1
    slt         $v0, $t0, $s6
    beqz        $v0, .L8005A970
    addiu       $s2, $s2, 0x4
.L8005AA08:
    lw          $t1, 0x15C($sp)
    addiu       $t1, $t1, -0x1
    sw          $t1, 0x15C($sp)
.L8005AA14:
    lw          $v1, 0x14($s7)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x0($v1)
    lw          $v1, 0x14($s7)
    lw          $v0, 0x1C($sp)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x20($sp)
    sw          $v0, 0x19C($s7)
    lw          $t0, 0x13C($sp)
    lw          $v1, 0x28($t0)
    sw          $s4, 0x8($t0)
    sw          $s0, 0xC($t0)
    lw          $t1, 0x15C($sp)
    addiu       $v0, $zero, 0x1
    addiu       $v1, $v1, -0x1
    sw          $t1, 0x14($t0)
    j .L8005AA9C
    sw          $v1, 0x28($t0)
.L8005AA5C:
    lw          $t0, 0x174($sp)
    blez        $t0, .L8005AA98
    sll         $v0, $t0, 2
    addiu       $v1, $sp, 0x18
    addu        $v1, $v0, $v1
.L8005AA70:
    addiu       $v1, $v1, -0x4
    lw          $t1, 0x174($sp)
    lw          $v0, 0x20($v1)
    lw          $t0, 0x164($sp)
    addiu       $t1, $t1, -0x1
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t0
    sw          $t1, 0x174($sp)
    bgtz        $t1, .L8005AA70
    sh          $zero, 0x0($v0)
.L8005AA98:
    addu        $v0, $zero, $zero
.L8005AA9C:
    lw          $ra, 0x1AC($sp)
    lw          $fp, 0x1A8($sp)
    lw          $s7, 0x1A4($sp)
    lw          $s6, 0x1A0($sp)
    lw          $s5, 0x19C($sp)
    lw          $s4, 0x198($sp)
    lw          $s3, 0x194($sp)
    lw          $s2, 0x190($sp)
    lw          $s1, 0x18C($sp)
    lw          $s0, 0x188($sp)
    addiu       $sp, $sp, 0x1B0
    jr          $ra
    nop
.end object_state_machine_advance
