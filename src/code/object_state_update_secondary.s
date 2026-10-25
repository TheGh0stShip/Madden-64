.text
.align 2
.set noreorder
.globl object_state_update_secondary
.ent object_state_update_secondary
object_state_update_secondary:
    addiu       $sp, $sp, -0x70
    sw          $s4, 0x58($sp)
    addu        $s4, $a0, $zero
    sw          $ra, 0x6C($sp)
    sw          $fp, 0x68($sp)
    sw          $s7, 0x64($sp)
    sw          $s6, 0x60($sp)
    sw          $s5, 0x5C($sp)
    sw          $s3, 0x54($sp)
    sw          $s2, 0x50($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    lw          $s5, 0x1B8($s4)
    lw          $v0, 0x114($s4)
    lw          $s7, 0x190($s4)
    lw          $t0, 0x198($s4)
    addu        $s0, $a1, $zero
    beqz        $v0, .L8005A1FC
    sw          $t0, 0x3C($sp)
    lw          $v0, 0x28($s5)
    bnez        $v0, .L8005A1FC
    nop
    jal         func_80059E14
    nop
    bnez        $v0, .L8005A1FC
    nop
.L8005A1F4:
    j .L8005A428
    addu        $v0, $zero, $zero
.L8005A1FC:
    lw          $s3, 0x14($s5)
    beql        $s3, $zero, .L8005A210
    sw          $s4, 0x2C($sp)
    j .L8005A414
    addiu       $s3, $s3, -0x1
.L8005A210:
    lw          $v0, 0x14($s4)
    lw          $v0, 0x0($v0)
    sw          $v0, 0x18($sp)
    lw          $v0, 0x14($s4)
    lw          $v0, 0x4($v0)
    sw          $v0, 0x1C($sp)
    lw          $v0, 0x19C($s4)
    sw          $v0, 0x20($sp)
    lw          $a1, 0x8($s5)
    lw          $a2, 0xC($s5)
    addiu       $v0, $s5, 0x10
    sw          $v0, 0x30($sp)
    lw          $s0, 0x0($s0)
    lw          $s2, 0x18C($s4)
    sw          $s0, 0x44($sp)
    lw          $s6, 0x3C($s5)
    slt         $v0, $s7, $s2
    bnez        $v0, .L8005A3EC
    slti        $v0, $a2, 0x8
    addiu       $fp, $zero, 0x1
.L8005A260:
    beqz        $v0, .L8005A28C
    addiu       $a0, $sp, 0x18
    jal         func_80059154
    addu        $a3, $zero, $zero
    beqz        $v0, .L8005A428
    addu        $v0, $zero, $zero
    lw          $a2, 0x28($sp)
    lw          $a1, 0x24($sp)
    slti        $v0, $a2, 0x8
    bnez        $v0, .L8005A2C0
    addiu       $v0, $zero, 0x1
.L8005A28C:
    addiu       $v0, $a2, -0x8
    srav        $v0, $a1, $v0
    andi        $v1, $v0, 0xFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s6
    lw          $v0, 0xD4($v0)
    beql        $v0, $zero, .L8005A2C0
    addiu       $v0, $zero, 0x9
    subu        $a2, $a2, $v0
    addu        $v0, $s6, $v1
    lbu         $s0, 0x4D4($v0)
    j .L8005A2E4
    sra         $s1, $s0, 4
.L8005A2C0:
    sw          $v0, 0x10($sp)
    addiu       $a0, $sp, 0x18
    jal         func_800592E8
    addu        $a3, $s6, $zero
    addu        $s0, $v0, $zero
    bltz        $s0, .L8005A1F4
    sra         $s1, $s0, 4
    lw          $a1, 0x24($sp)
    lw          $a2, 0x28($sp)
.L8005A2E4:
    andi        $s0, $s0, 0xF
    beqz        $s0, .L8005A388
    slt         $v0, $a2, $s0
    beqz        $v0, .L8005A314
    addu        $s2, $s2, $s1
    addiu       $a0, $sp, 0x18
    jal         func_80059154
    addu        $a3, $s0, $zero
    beqz        $v0, .L8005A428
    addu        $v0, $zero, $zero
    lw          $a1, 0x24($sp)
    lw          $a2, 0x28($sp)
.L8005A314:
    subu        $a2, $a2, $s0
    srav        $a0, $a1, $a2
    sllv        $v1, $fp, $s0
    addiu       $v1, $v1, -0x1
    sll         $a3, $s0, 2
    lui         $t0, 0x8000
    addiu       $t0, $t0, 0x32B0
    addu        $v0, $a3, $t0
    lw          $v0, 0x0($v0)
    and         $s1, $a0, $v1
    slt         $v0, $s1, $v0
    beqz        $v0, .L8005A358
    addu        $v1, $s1, $zero
    lui         $at, 0x8000
    addu        $at, $at, $a3
    lw          $v0, 0x32F0($at)
    addu        $v1, $s1, $v0
.L8005A358:
    sll         $v0, $s2, 2
    lui         $t0, 0x8000
    addiu       $t0, $t0, 0x3528
    addu        $v0, $v0, $t0
    lw          $v0, 0x0($v0)
    lw          $t0, 0x44($sp)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t0
    lw          $t0, 0x3C($sp)
    sllv        $v1, $v1, $t0
    j .L8005A3DC
    sh          $v1, 0x0($v0)
.L8005A388:
    addiu       $v0, $zero, 0xF
    beq         $s1, $v0, .L8005A3DC
    addiu       $s2, $s2, 0xF
    beqz        $s1, .L8005A3D4
    sllv        $s3, $fp, $s1
    slt         $v0, $a2, $s1
    beqz        $v0, .L8005A3C0
    addiu       $a0, $sp, 0x18
    jal         func_80059154
    addu        $a3, $s1, $zero
    beqz        $v0, .L8005A428
    addu        $v0, $zero, $zero
    lw          $a1, 0x24($sp)
    lw          $a2, 0x28($sp)
.L8005A3C0:
    subu        $a2, $a2, $s1
    srav        $v1, $a1, $a2
    addiu       $v0, $s3, -0x1
    and         $s1, $v1, $v0
    addu        $s3, $s3, $s1
.L8005A3D4:
    j .L8005A3EC
    addiu       $s3, $s3, -0x1
.L8005A3DC:
    addiu       $s2, $s2, 0x1
    slt         $v0, $s7, $s2
    beqz        $v0, .L8005A260
    slti        $v0, $a2, 0x8
.L8005A3EC:
    lw          $v1, 0x14($s4)
    lw          $v0, 0x18($sp)
    sw          $v0, 0x0($v1)
    lw          $v1, 0x14($s4)
    lw          $v0, 0x1C($sp)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x20($sp)
    sw          $v0, 0x19C($s4)
    sw          $a1, 0x8($s5)
    sw          $a2, 0xC($s5)
.L8005A414:
    lw          $v1, 0x28($s5)
    addiu       $v0, $zero, 0x1
    sw          $s3, 0x14($s5)
    addiu       $v1, $v1, -0x1
    sw          $v1, 0x28($s5)
.L8005A428:
    lw          $ra, 0x6C($sp)
    lw          $fp, 0x68($sp)
    lw          $s7, 0x64($sp)
    lw          $s6, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end object_state_update_secondary
