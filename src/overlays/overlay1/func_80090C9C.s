.text
.align 2
.set noreorder
.globl func_80090C9C
.ent func_80090C9C
func_80090C9C:
    addiu       $a1, $a1, 0x1
    andi        $v0, $a1, 0xFFFF
    sltiu       $v0, $v0, 0x8
    bnez        $v0, . + 4 + (-0x7 << 2)
    andi        $v0, $a1, 0xFFFF
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x7920($at)
    lui         $v0, 0x1
    lui         $at, 0x8009
    sw          $zero, -0x5C24($at)
    lui         $at, 0x8008
    sw          $zero, 0x4F30($at)
    lui         $at, 0x8008
    sw          $zero, 0x4F34($at)
    lui         $at, 0x8009
    sh          $zero, -0x6D38($at)
    lui         $at, 0x8009
    sh          $zero, -0x6B04($at)
    lui         $at, 0x8009
    sh          $zero, -0x6D60($at)
    lui         $at, 0x8008
    sh          $zero, 0x57F0($at)
    lui         $at, 0x8009
    sh          $zero, -0x751C($at)
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800BEE28
    nop
    jal         func_8009BC40
    nop
    jal         func_800C5F50
    nop
    jal         func_80024EDC
    addu        $a0, $zero, $zero
    jal         func_800CC18C
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6B70
    lw          $v1, 0x0($a0)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80090D68
    addu        $a1, $zero, $zero
    addiu       $v1, $zero, -0x1
    addiu       $a1, $a1, 0x1
.L80090D50:
    andi        $v0, $a1, 0xFFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    lw          $v0, 0x0($v0)
    bnel        $v0, $v1, .L80090D50
    addiu       $a1, $a1, 0x1
.L80090D68:
    andi        $v1, $a1, 0xFFFF
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80090D88
    nop
    lui         $at, 0x8009
    sb          $zero, -0x503A($at)
    lui         $at, 0x8009
    sb          $zero, -0x6AE6($at)
.L80090D88:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    addiu       $v1, $zero, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x6DDC($at)
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x42C
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $v1, 0x6DDC($at)
    jal         func_800356C4
    addiu       $a1, $zero, 0x21C
    lui         $at, 0x8009
    sh          $v0, -0x7B8E($at)
    jal         func_800BE128
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a1, 0x8009
    lhu         $a1, -0x7904($a1)
    jal         func_800A6D18
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    jal         func_800DD1B0
    nop
    lui         $a1, 0x8009
    lh          $a1, -0x5A50($a1)
    addiu       $v0, $zero, 0x4
    bne         $a1, $v0, .L80090E94
    addiu       $v0, $zero, 0x10
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $v1, 0x8009
    lhu         $v1, -0x6A2E($v1)
    sh          $v0, 0x38($sp)
    lui         $v0, 0x8000
    addiu       $v0, $v0, 0x548
    sw          $v0, 0x4C($sp)
    addiu       $v0, $zero, 0x74
    sh          $zero, 0x34($sp)
    sw          $zero, 0x40($sp)
    sw          $a1, 0x3C($sp)
    sh          $v0, 0x36($sp)
    jal         func_8000C8A0
    sh          $v1, 0x50($sp)
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    jal         func_8000D740
    addiu       $a2, $sp, 0x30
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    sw          $a0, 0x7AC8($at)
    jal         func_80016FE4
    nop
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $zero, 0x79A0($at)
    lui         $at, 0x8008
    sh          $v0, 0x7948($at)
    lui         $at, 0x8006
    sh          $zero, 0x4A4A($at)
    j           func_8008C778
    nop
.L80090E94:
    lui         $at, 0x8008
    sw          $zero, 0x7AC8($at)
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    addu        $a1, $zero, $zero
    addiu       $a2, $sp, 0x30
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x34($sp)
    addiu       $v0, $zero, 0x101
    sh          $v0, 0x36($sp)
    addiu       $v0, $zero, 0xB9
    sh          $v0, 0x38($sp)
    addiu       $v0, $zero, 0x25
    sw          $zero, 0x3C($sp)
    jal         func_8000D740
    sw          $v0, 0x30($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    sw          $a0, 0x6A28($at)
    jal         func_80016FF4
    nop
    jal         func_800334B8
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x5A40($v0)
    bnez        $v0, .L80091030
    addu        $a1, $zero, $zero
    lui         $a1, 0x800A
    addiu       $a1, $a1, 0x3164
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x6CFC
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    addiu       $s0, $v0, -0x14
    lui         $at, 0x8008
    sh          $zero, 0x6CEA($at)
    lui         $at, 0x8008
    sh          $zero, 0x6CEC($at)
    sh          $zero, -0x14($v0)
    lui         $at, 0x8008
    sh          $zero, 0x6CF0($at)
    sw          $a0, 0x0($v0)
    lui         $at, 0x8008
    sw          $v1, 0x6CF4($at)
    lui         $at, 0x8008
    sw          $v1, 0x6CF8($at)
    jal         func_8000CB78
    addu        $a2, $s0, $zero
    jal         func_800A2CD0
    addu        $a0, $s0, $zero
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L80090FF8
    nop
    jal         func_80031A1C
    addiu       $a0, $zero, 0x8
    jal         func_80031964
    addu        $s0, $v0, $zero
    andi        $v0, $v0, 0xFFFF
    srav        $v0, $v0, $s0
    andi        $a0, $v0, 0x3
    andi        $v1, $a0, 0xFFFF
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80090FD4
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L80090FBC
    addiu       $v0, $zero, 0x2
    beql        $v1, $zero, .L80090FE0
    addiu       $a0, $zero, 0x5
    j           func_8008C8BC
    nop
.L80090FBC:
    beq         $v1, $v0, .L80090FDC
    addiu       $v0, $zero, 0x3
    beql        $v1, $v0, .L80090FE0
    addiu       $a0, $zero, 0x7
    j           func_8008C8BC
    nop
.L80090FD4:
    j           func_8008C8BC
    addiu       $a0, $zero, 0x2
.L80090FDC:
    addiu       $a0, $zero, 0x3
.L80090FE0:
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7964
    lbu         $v1, 0x0($v0)
    sb          $a0, 0x0($v0)
    lui         $at, 0x8009
    sb          $v1, -0x6C5E($at)
.L80090FF8:
    lui         $a1, 0x8008
    lbu         $a1, 0x7964($a1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A6590
    nop
    lui         $at, 0x8008
    sh          $zero, 0x6BE2($at)
    lui         $at, 0x8009
    sh          $zero, -0x5C28($at)
    jal         func_8008FC1C
    nop
    j           func_8008C91C
    nop
.L80091030:
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000CB78
    addu        $a2, $zero, $zero
    jal         func_800417C0
    nop
    jal         func_8003190C
    addiu       $a0, $zero, 0x1000
    jal         func_800C5F50
    nop
    jal         func_800E0B58
    nop
    jal         func_800334B8
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x5A40($v1)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800910A8
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x5
    jal         func_800AF1D0
    nop
    jal         func_800AF250
    nop
    jal         func_800AF304
    nop
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x4
.L800910A8:
    lui         $v0, 0x8008
    lh          $v0, 0x5A40($v0)
    lui         $at, 0x8008
    sh          $zero, 0x7944($at)
    lui         $at, 0x8009
    sw          $zero, -0x7F74($at)
    bnez        $v0, .L800910D8
    nop
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x3574
    j           func_8008C9BC
    nop
.L800910D8:
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x2E84
    lui         $at, 0x8008
    sw          $v0, 0x6DD8($at)
    jal         func_8001FA20
    nop
    jal         func_800334B8
    nop
    jal         func_80036D30
    nop
    lui         $v1, 0x8006
    lhu         $v1, 0x4A4E($v1)
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8009
    sw          $zero, -0x593C($at)
    lui         $at, 0x8008
    sw          $zero, 0x5128($at)
    lui         $at, 0x8009
    sw          $v0, -0x5070($at)
    lui         $at, 0x8008
    sh          $zero, 0x712E($at)
    lui         $at, 0x8006
    sh          $v1, 0x4A50($at)
    jal         func_80033484
    nop
    jal         func_8000BE80
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BE80
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x5A40($v1)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L80091190
    addiu       $a1, $zero, 0xA
    lui         $a0, 0x8009
    addiu       $a0, $a0, 0x33BC
    jal         func_8002FEA4
    addiu       $a2, $zero, 0x1
    sw          $zero, 0x10($sp)
    addiu       $a0, $zero, 0x2
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_800B7DD8
    addu        $a3, $zero, $zero
.L80091190:
    lw          $ra, 0x78($sp)
    lw          $s3, 0x74($sp)
    lw          $s2, 0x70($sp)
    lw          $s1, 0x6C($sp)
    lw          $s0, 0x68($sp)
    addiu       $sp, $sp, 0x80
    jr          $ra
    nop
.end func_80090C9C
