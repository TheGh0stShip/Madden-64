.text
.align 2
.set noreorder
.globl func_800A3BF8
.ent func_800A3BF8
func_800A3BF8:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x50
    sw          $s5, 0x44($sp)
    addu        $s5, $a0, $zero
    sw          $s0, 0x30($sp)
    addu        $s0, $zero, $zero
    sw          $s4, 0x40($sp)
    addu        $s4, $zero, $zero
    sw          $s2, 0x38($sp)
    addu        $s2, $zero, $zero
    sw          $s3, 0x3C($sp)
    sw          $ra, 0x48($sp)
    sw          $s1, 0x34($sp)
    lbu         $v1, 0x1F($s5)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800A3C5C
    addu        $s3, $zero, $zero
    beqz        $v1, .L800A3C58
    addiu       $v0, $zero, 0x1
    beql        $v1, $v0, .L800A3C60
    addu        $v1, $zero, $zero
    j           func_8009F53C
    nop
.L800A3C58:
    addiu       $v1, $zero, 0x1
.L800A3C5C:
    addiu       $v0, $zero, 0x1
.L800A3C60:
    beq         $v1, $v0, .L800A3CE0
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800A3C80
    addiu       $v0, $zero, 0x2
    beql        $v1, $zero, .L800A3C98
    lui         $v0, 0xFEC0
    j           func_8009F6E8
    addiu       $a0, $zero, 0x7
.L800A3C80:
    beq         $v1, $v0, .L800A3D84
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800A3DB4
    addiu       $a0, $zero, 0x7
    j           func_8009F6E8
    nop
.L800A3C98:
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v1, 0x20($a0)
    addu        $s2, $v1, $v0
    lui         $v0, 0xFF10
    addu        $s3, $v1, $v0
    lui         $v0, 0xFC00
    slt         $v0, $s2, $v0
    beqz        $v0, .L800A3CC8
    nop
    lui         $s2, 0xFC00
    lui         $s3, 0xFC20
.L800A3CC8:
    lw          $v0, 0x1C($a0)
    lui         $v1, 0xC0
    addu        $s0, $v0, $v1
    lui         $v1, 0x120
    j           func_8009F6E4
    addu        $s4, $v0, $v1
.L800A3CE0:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800A3D58
    lui         $v0, 0xFFC0
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v1, 0x1C($a0)
    lui         $v0, 0xFF80
    addu        $s0, $v1, $v0
    lui         $v0, 0xFFC0
    addu        $s4, $v1, $v0
    lui         $v0, 0xFE70
    slt         $v0, $s0, $v0
    beqz        $v0, .L800A3D28
    nop
    lui         $s0, 0xFE70
    lui         $s4, 0xFE90
.L800A3D28:
    lw          $v1, 0x20($a0)
    lui         $v0, 0xC0
    addu        $s2, $v1, $v0
    lui         $v0, 0x120
    addu        $s3, $v1, $v0
    lui         $v0, 0x400
    slt         $v0, $v0, $s3
    beqz        $v0, .L800A3E0C
    addiu       $a0, $zero, 0x7
    lui         $s2, 0x3E0
    j           func_8009F6E8
    lui         $s3, 0x400
.L800A3D58:
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a0, 0x1C($v1)
    lw          $v1, 0x20($v1)
    addu        $s0, $a0, $v0
    lui         $v0, 0x40
    addu        $s4, $a0, $v0
    lui         $v0, 0x100
    addu        $s2, $v1, $v0
    j           func_8009F6E0
    lui         $v0, 0x180
.L800A3D84:
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    bnez        $v0, .L800A3DE4
    lui         $s0, 0x160
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lw          $v1, 0x20($v0)
    lui         $s4, 0x1A0
    j           func_8009F6D8
    lui         $v0, 0xFFD0
.L800A3DB4:
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A3DE4
    lui         $s0, 0x160
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lw          $v1, 0x20($v0)
    lui         $s4, 0x1A0
    j           func_8009F6D8
    lui         $v0, 0xFFD0
.L800A3DE4:
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lui         $s0, 0xFE30
    lw          $v1, 0x20($v0)
    lui         $s4, 0xFE80
    lui         $v0, 0xFFC0
    addu        $s2, $v1, $v0
    lui         $v0, 0xA0
    addu        $s3, $v1, $v0
    addiu       $a0, $zero, 0x7
.L800A3E0C:
    addiu       $v0, $sp, 0x2C
.L800A3E10:
    sw          $zero, 0x0($v0)
    addiu       $a0, $a0, -0x1
    bgez        $a0, .L800A3E10
    addiu       $v0, $v0, -0x4
    lw          $v1, 0x24($s5)
    subu        $v0, $s4, $s0
    sra         $v0, $v0, 1
    addu        $v0, $s0, $v0
    lw          $a3, 0x24($sp)
    lw          $t0, 0x2C($sp)
    lw          $t1, 0x14($sp)
    lw          $a0, 0x18($sp)
    lw          $a2, 0x1C($sp)
    lui         $a1, 0x8008
    lw          $a1, 0xC10($a1)
    lw          $v1, 0x1C($v1)
    addiu       $s1, $zero, -0x14
    andi        $a1, $a1, 0x4000
    subu        $v0, $v0, $v1
    sra         $t2, $v0, 21
    lw          $v1, 0x28($sp)
    sra         $v0, $v0, 22
    subu        $a3, $a3, $v0
    subu        $t0, $t0, $v0
    addu        $t1, $t1, $v0
    addu        $a0, $a0, $t2
    addu        $a2, $a2, $v0
    sw          $a3, 0x24($sp)
    sw          $t0, 0x2C($sp)
    sw          $t1, 0x14($sp)
    sw          $a0, 0x18($sp)
    sw          $a2, 0x1C($sp)
    subu        $v1, $v1, $t2
    sw          $v1, 0x28($sp)
    lw          $v1, 0x24($s5)
    subu        $v0, $s3, $s2
    sra         $v0, $v0, 1
    lw          $v1, 0x20($v1)
    addu        $v0, $s2, $v0
    lw          $a0, 0x10($sp)
    subu        $v0, $v0, $v1
    sra         $t2, $v0, 21
    lw          $v1, 0x20($sp)
    sra         $v0, $v0, 22
    subu        $a2, $a2, $v0
    subu        $a3, $a3, $v0
    addu        $t0, $t0, $v0
    addu        $a0, $a0, $t2
    addu        $t1, $t1, $v0
    sw          $a2, 0x1C($sp)
    sw          $a3, 0x24($sp)
    sw          $t0, 0x2C($sp)
    sw          $a0, 0x10($sp)
    sw          $t1, 0x14($sp)
    subu        $v1, $v1, $t2
    beqz        $a1, .L800A3EF8
    sw          $v1, 0x20($sp)
    addiu       $s1, $zero, -0x5
.L800A3EF8:
    jal         func_8009EFAC
    addu        $a0, $s5, $zero
    lw          $a0, 0x24($s5)
    lw          $v1, 0x1C($a0)
    slt         $v0, $v1, $s0
    bnez        $v0, .L800A4008
    slt         $v0, $s4, $v1
    bnez        $v0, .L800A4008
    nop
    lw          $v1, 0x20($a0)
    slt         $v0, $v1, $s2
    bnez        $v0, .L800A4008
    slt         $v0, $s3, $v1
    bnez        $v0, .L800A4008
    addiu       $v0, $zero, 0x1
    sw          $v0, 0x98($s5)
    addiu       $a2, $zero, 0x3E8
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5112
.L800A3F48:
    lh          $v1, 0x0($a1)
    slt         $v0, $v1, $a2
    bnel        $v0, $zero, .L800A3F58
    addu        $a2, $v1, $zero
.L800A3F58:
    addiu       $a0, $a0, 0x1
    slti        $v0, $a0, 0x8
    bnez        $v0, .L800A3F48
    addiu       $a1, $a1, 0x2
    lbu         $v0, 0x1F($s5)
    addiu       $v1, $zero, -0x64
    lui         $at, 0x8007
    addu        $at, $at, $v0
    sb          $v1, -0x618C($at)
    slt         $v0, $a2, $s1
    beqz        $v0, .L800A3FF4
    lui         $t3, 0xFFF0
    ori         $t3, $t3, 0xBDC0
    addiu       $s0, $zero, -0x1
    lui         $t0, 0x8008
    addiu       $t0, $t0, 0x5112
    addiu       $a3, $sp, 0x10
.L800A3F9C:
    addu        $a0, $zero, $zero
    addu        $a2, $a3, $zero
    addu        $a1, $t0, $zero
.L800A3FA8:
    lh          $v0, 0x0($a1)
    slt         $v0, $s1, $v0
    beql        $v0, $zero, .L800A3FD0
    addiu       $a2, $a2, 0x4
    lw          $v1, 0x0($a2)
    slt         $v0, $t3, $v1
    beqz        $v0, .L800A3FD0
    addiu       $a2, $a2, 0x4
    addu        $s0, $a0, $zero
    addu        $t3, $v1, $zero
.L800A3FD0:
    addiu       $a0, $a0, 0x1
    slti        $v0, $a0, 0x8
    bnez        $v0, .L800A3FA8
    addiu       $a1, $a1, 0x2
    addiu       $v0, $zero, -0x1
    beq         $s0, $v0, .L800A3F9C
    addiu       $s1, $s1, -0x5
    j           func_8009FBB8
    addu        $a0, $s5, $zero
.L800A3FF4:
    addu        $a0, $s5, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x41
    j           func_8009FBD8
    nop
.L800A4008:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    bnez        $v0, .L800A424C
    sw          $zero, 0x98($s5)
    lw          $v0, 0x24($s5)
    lui         $t1, 0x8008
    addiu       $t1, $t1, 0x511C
    lhu         $a3, 0x0($t1)
    lui         $t0, 0x8008
    lhu         $t0, 0x511E($t0)
    lui         $a0, 0x8008
    lhu         $a0, 0x5120($a0)
    lui         $a1, 0x8008
    lhu         $a1, 0x5114($a1)
    lw          $v0, 0x1C($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x5116($v1)
    lui         $a2, 0x8008
    lhu         $a2, 0x5118($a2)
    subu        $v0, $s0, $v0
    sra         $t2, $v0, 21
    srl         $v0, $v0, 31
    addu        $v0, $t2, $v0
    sra         $v0, $v0, 1
    subu        $a3, $a3, $v0
    subu        $t0, $t0, $t2
    subu        $a0, $a0, $v0
    addu        $a1, $a1, $v0
    addu        $v1, $v1, $t2
    addu        $a2, $a2, $v0
    sh          $a3, 0x0($t1)
    lui         $at, 0x8008
    sh          $t0, 0x511E($at)
    lui         $at, 0x8008
    sh          $a0, 0x5120($at)
    lui         $at, 0x8008
    sh          $a1, 0x5114($at)
    lui         $at, 0x8008
    sh          $v1, 0x5116($at)
    lui         $at, 0x8008
    sh          $a2, 0x5118($at)
    lw          $v0, 0x24($s5)
    lw          $v0, 0x1C($v0)
    subu        $v0, $s4, $v0
    sra         $t2, $v0, 21
    srl         $v0, $v0, 31
    addu        $v0, $t2, $v0
    sra         $v0, $v0, 1
    addu        $a1, $a1, $v0
    addu        $v1, $v1, $t2
    addu        $a2, $a2, $v0
    subu        $a3, $a3, $v0
    subu        $t0, $t0, $t2
    subu        $a0, $a0, $v0
    lui         $at, 0x8008
    sh          $a1, 0x5114($at)
    lui         $at, 0x8008
    sh          $v1, 0x5116($at)
    lui         $at, 0x8008
    sh          $a2, 0x5118($at)
    sh          $a3, 0x0($t1)
    lui         $at, 0x8008
    sh          $t0, 0x511E($at)
    lui         $at, 0x8008
    sh          $a0, 0x5120($at)
    lw          $v0, 0x24($s5)
    lui         $t3, 0xFFF0
    lw          $v0, 0x20($v0)
    lui         $t0, 0x8008
    lhu         $t0, 0x511A($t0)
    lui         $v1, 0x8008
    lhu         $v1, 0x5112($v1)
    subu        $v0, $s2, $v0
    sra         $t2, $v0, 21
    srl         $v0, $v0, 31
    addu        $v0, $t2, $v0
    sra         $v0, $v0, 1
    subu        $a2, $a2, $v0
    subu        $t0, $t0, $t2
    subu        $a3, $a3, $v0
    addu        $a0, $a0, $v0
    addu        $v1, $v1, $t2
    addu        $a1, $a1, $v0
    lui         $at, 0x8008
    sh          $a2, 0x5118($at)
    lui         $at, 0x8008
    sh          $t0, 0x511A($at)
    sh          $a3, 0x0($t1)
    lui         $at, 0x8008
    sh          $a0, 0x5120($at)
    lui         $at, 0x8008
    sh          $v1, 0x5112($at)
    lui         $at, 0x8008
    sh          $a1, 0x5114($at)
    lw          $v0, 0x24($s5)
    ori         $t3, $t3, 0xBDC0
    addiu       $t5, $t1, -0xA
    lw          $v0, 0x20($v0)
    addiu       $t4, $sp, 0x10
    addiu       $s0, $zero, -0x1
    subu        $v0, $s3, $v0
    sra         $t2, $v0, 21
    srl         $v0, $v0, 31
    addu        $v0, $t2, $v0
    sra         $v0, $v0, 1
    addu        $a0, $a0, $v0
    addu        $v1, $v1, $t2
    addu        $a1, $a1, $v0
    subu        $a2, $a2, $v0
    subu        $t0, $t0, $t2
    subu        $a3, $a3, $v0
    lui         $at, 0x8008
    sh          $a0, 0x5120($at)
    lui         $at, 0x8008
    sh          $v1, 0x5112($at)
    lui         $at, 0x8008
    sh          $a1, 0x5114($at)
    lui         $at, 0x8008
    sh          $a2, 0x5118($at)
    lui         $at, 0x8008
    sh          $t0, 0x511A($at)
    sh          $a3, 0x0($t1)
.L800A41F4:
    addu        $a0, $zero, $zero
    addu        $a2, $t4, $zero
    addu        $a1, $t5, $zero
.L800A4200:
    lh          $v0, 0x0($a1)
    slt         $v0, $s1, $v0
    beql        $v0, $zero, .L800A4228
    addiu       $a2, $a2, 0x4
    lw          $v1, 0x0($a2)
    slt         $v0, $t3, $v1
    beqz        $v0, .L800A4228
    addiu       $a2, $a2, 0x4
    addu        $s0, $a0, $zero
    addu        $t3, $v1, $zero
.L800A4228:
    addiu       $a0, $a0, 0x1
    slti        $v0, $a0, 0x8
    bnez        $v0, .L800A4200
    addiu       $a1, $a1, 0x2
    addiu       $v0, $zero, -0x1
    beq         $s0, $v0, .L800A41F4
    addiu       $s1, $s1, -0x5
    j           func_8009FBB8
    addu        $a0, $s5, $zero
.L800A424C:
    addiu       $a2, $zero, 0x3E8
    addiu       $s0, $zero, -0x1
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5112
.L800A4260:
    lh          $v1, 0x0($a1)
    slt         $v0, $v1, $a2
    beql        $v0, $zero, .L800A427C
    addiu       $a0, $a0, 0x1
    addu        $s0, $a0, $zero
    addu        $a2, $v1, $zero
    addiu       $a0, $a0, 0x1
.L800A427C:
    slti        $v0, $a0, 0x8
    bnez        $v0, .L800A4260
    addiu       $a1, $a1, 0x2
    slti        $v0, $s0, 0x4
    bnel        $v0, $zero, .L800A4298
    addiu       $s0, $s0, 0x4
    addiu       $s0, $s0, -0x4
.L800A4298:
    slt         $v0, $s1, $a2
    beqz        $v0, .L800A42D8
    lui         $t3, 0xFFF0
    ori         $t3, $t3, 0xBDC0
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
.L800A42B0:
    lw          $v1, 0x0($a1)
    slt         $v0, $t3, $v1
    beql        $v0, $zero, .L800A42CC
    addiu       $a0, $a0, 0x1
    addu        $s0, $a0, $zero
    addu        $t3, $v1, $zero
    addiu       $a0, $a0, 0x1
.L800A42CC:
    slti        $v0, $a0, 0x8
    bnez        $v0, .L800A42B0
    addiu       $a1, $a1, 0x4
.L800A42D8:
    addu        $a0, $s5, $zero
    sll         $a1, $s0, 25
    sra         $a1, $a1, 16
    jal         func_800C0018
    addu        $a2, $zero, $zero
    lbu         $v0, 0x1F($s5)
    lui         $at, 0x8007
    addu        $at, $at, $v0
    sb          $s0, -0x618C($at)
    lw          $ra, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_800A3BF8
