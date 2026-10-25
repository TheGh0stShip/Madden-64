.text
.align 2
.set noreorder
.globl ui_resource_render
.ent ui_resource_render
ui_resource_render:
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    addiu       $sp, $sp, -0x48
    sw          $s7, 0x3C($sp)
    addu        $s7, $a0, $zero
    sw          $fp, 0x40($sp)
    addu        $fp, $a1, $zero
    sw          $ra, 0x44($sp)
    sw          $s6, 0x38($sp)
    sw          $s5, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s5, 0x8($s7)
    lui         $v1, 0x8009
    lw          $v1, -0x49AC($v1)
    lw          $a1, 0x1C($s7)
    lw          $a2, 0x20($s7)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    lw          $s2, 0x30($v0)
    lhu         $v0, 0x1FC($v1)
    lhu         $a0, 0x1F8($v1)
    sb          $zero, 0x17($sp)
    lui         $at, 0x8008
    sh          $a1, -0x6ADC($at)
    lui         $at, 0x8008
    sh          $a2, -0x6AD8($at)
    srl         $v0, $v0, 1
    addu        $a0, $a0, $v0
    lhu         $v0, 0x1FE($v1)
    lhu         $v1, 0x1FA($v1)
    negu        $s4, $a0
    srl         $v0, $v0, 1
    addu        $v1, $v1, $v0
    lw          $v0, 0x10($s5)
    lhu         $a0, 0xA($s5)
    addiu       $v0, $v0, 0x4
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    beqz        $a0, .L8001BD2C
    negu        $s6, $v1
    lh          $v0, 0xC($s5)
    lw          $a2, 0x1C($s7)
    bne         $a2, $v0, .L8001BCD4
    addu        $a1, $v0, $zero
    lh          $v1, 0xE($s5)
    lw          $v0, 0x20($s7)
    beq         $v0, $v1, .L8001BD2C
    nop
.L8001BCD4:
    lw          $v0, 0x18($s5)
    lw          $a0, 0x20($s7)
    lhu         $v1, 0xE($s5)
    lw          $s0, 0x8($v0)
    subu        $s3, $a2, $a1
    beqz        $s0, .L8001BD2C
    subu        $s1, $a0, $v1
.L8001BCF0:
    jal         func_80017C7C
    addu        $a0, $s0, $zero
    lhu         $a1, 0x0($v0)
    addu        $a0, $s0, $zero
    lhu         $a2, 0x2($v0)
    addu        $a1, $s3, $a1
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    addu        $a2, $s1, $a2
    sll         $a2, $a2, 16
    jal         func_80017000
    sra         $a2, $a2, 16
    lw          $s0, 0x4($s0)
    bnez        $s0, .L8001BCF0
    nop
.L8001BD2C:
    lui         $s0, 0x8008
    lw          $s0, -0x6B88($s0)
    lbu         $v0, 0x0($s0)
    nor         $v0, $zero, $v0
    andi        $v0, $v0, 0xFF
    beqz        $v0, .L8001C3D4
    nop
    sll         $s4, $s4, 16
    sll         $s3, $s6, 16
    lui         $s6, 0x7F7F
    ori         $s6, $s6, 0x7F7F
    addiu       $s1, $s2, 0x1C
.L8001BD5C:
    lbu         $v0, 0x0($s0)
    andi        $v0, $v0, 0x80
    beqz        $v0, .L8001BD7C
    addu        $a0, $s5, $zero
    jal         func_8001CA8C
    addu        $a1, $fp, $zero
    j .L8001C3B8
    nop
.L8001BD7C:
    addiu       $v0, $s0, 0x1
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    lbu         $s0, 0x0($s0)
    andi        $v1, $s0, 0x1F
    sltiu       $v0, $v1, 0x1F
    beqz        $v0, .L8001C3B8
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xA50($at)
    jr          $v0
    nop
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x20($s1)
    sw          $v0, 0x10($s1)
    sw          $v0, 0x0($s1)
    j .L8001C1F8
    sw          $v0, -0x10($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x0($s1)
    sw          $v0, -0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    sw          $v0, 0x20($s1)
    j .L8001C1F8
    sw          $v0, 0x10($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x10($s1)
    sw          $v0, -0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    j .L8001C1F4
    sw          $v0, 0x20($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x20($s1)
    sw          $v0, 0x0($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    j .L8001C1F8
    sw          $v0, 0x10($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x20($s1)
    sw          $v0, 0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    sw          $v0, 0x0($s1)
    j .L8001C1F8
    sw          $v0, -0x10($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x0($s1)
    sw          $v0, -0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x20($s1)
    j .L8001C1F8
    sw          $v0, 0x10($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x10($s1)
    sw          $v0, -0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    ori         $v0, $v0, 0xFF
    j .L8001C1F4
    sw          $v0, 0x20($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    srl         $v0, $v0, 1
    and         $v0, $v0, $s6
    ori         $v0, $v0, 0x80
    sw          $v0, 0x20($s1)
    sw          $v0, 0x10($s1)
    sw          $v0, 0x0($s1)
    j .L8001C1F8
    sw          $v0, -0x10($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    jal         func_8001C4E4
    addu        $a0, $s0, $zero
    jal         func_8001C534
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    ori         $v0, $v0, 0xFF
    sw          $v0, -0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a0, $s2, $zero
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x0($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF4($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF0($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    ori         $v0, $v0, 0xFF
    j .L8001C1F8
    sw          $v0, 0x20($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    jal         func_8001C4E4
    addu        $a0, $s0, $zero
    jal         func_8001C534
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    srl         $v0, $v0, 1
    and         $v0, $v0, $s6
    ori         $v0, $v0, 0x80
    sw          $v0, -0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a0, $s2, $zero
    srl         $v0, $v0, 1
    and         $v0, $v0, $s6
    ori         $v0, $v0, 0x80
    sw          $v0, 0x0($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF4($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    srl         $v0, $v0, 1
    and         $v0, $v0, $s6
    ori         $v0, $v0, 0x80
    sw          $v0, 0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF0($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
    srl         $v0, $v0, 1
    and         $v0, $v0, $s6
    ori         $v0, $v0, 0x80
    j .L8001C1F8
    sw          $v0, 0x20($s1)
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    jal         func_8001C4E4
    addu        $a0, $s0, $zero
    jal         func_8001C534
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a0, $s2, $zero
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x20($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF4($v0)
    sra         $a1, $s4, 16
    j .L8001C1E0
    sra         $a2, $s3, 16
    andi        $s0, $s0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    jal         func_8001C4E4
    addu        $a0, $s0, $zero
    jal         func_8001C534
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6AFC($v0)
    sw          $v0, 0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF8($v0)
    addu        $a0, $s2, $zero
    ori         $v0, $v0, 0xFF
    sw          $v0, 0x20($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF4($v0)
    sra         $a1, $s4, 16
    sra         $a2, $s3, 16
    ori         $v0, $v0, 0xFF
.L8001C1E0:
    sw          $v0, -0x10($s1)
    lui         $v0, 0x8008
    lw          $v0, -0x6AF0($v0)
    addu        $a3, $s0, $zero
    addiu       $s2, $s2, 0x40
.L8001C1F4:
    sw          $v0, 0x0($s1)
.L8001C1F8:
    jal         func_8001C584
    addiu       $s1, $s1, 0x40
    j .L8001C3B8
    nop
    jal         func_8001C670
    nop
    lui         $at, 0x8008
    sh          $v0, -0x6AEC($at)
    jal         func_8001CA44
    nop
    lui         $v1, 0x8008
    lw          $v1, -0x6B88($v1)
    lui         $a0, 0x8007
    lw          $a0, -0x6D64($a0)
    addiu       $t0, $v0, 0x1
    lui         $at, 0x8008
    sh          $t0, -0x6AE8($at)
    lbu         $v0, 0x0($v1)
    addiu       $v1, $v1, 0x1
    lui         $at, 0x8008
    sw          $v1, -0x6B88($at)
    beqz        $a0, .L8001C3B8
    andi        $v1, $v0, 0xFF
    sll         $v0, $v1, 2
    addu        $v0, $v0, $a0
    lw          $a3, 0x4($v0)
    beqz        $a3, .L8001C3B8
    addiu       $v0, $v1, 0x1
    lui         $a2, 0x8008
    lh          $a2, -0x6AEC($a2)
    sll         $v0, $v0, 24
    addu        $a0, $fp, $zero
    lui         $a1, 0x8002
    addiu       $a1, $a1, -0x48C8
    lw          $v1, 0x8($a3)
    andi        $a2, $a2, 0xFFF
    sll         $a2, $a2, 12
    lh          $a3, 0x3A($v1)
    andi        $v1, $t0, 0xFFF
    or          $a2, $a2, $v1
    jal         func_80008F30
    or          $a2, $v0, $a2
    j .L8001C3B8
    nop
    jal         func_8001C670
    nop
    lui         $at, 0x8008
    sh          $v0, -0x6AEC($at)
    jal         func_8001CA44
    nop
    lui         $v1, 0x8008
    lw          $v1, -0x6B88($v1)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sh          $v0, -0x6AE8($at)
    lbu         $s0, 0x0($v1)
    addiu       $v1, $v1, 0x1
    lui         $at, 0x8008
    sw          $v1, -0x6B88($at)
    jal         func_8001C670
    nop
    lui         $at, 0x8008
    sh          $v0, -0x6AE4($at)
    jal         func_8001CA44
    nop
    lbu         $a2, 0x17($sp)
    lui         $a0, 0x8008
    lhu         $a0, -0x6AEC($a0)
    lui         $a1, 0x8008
    lhu         $a1, -0x6AE8($a1)
    lui         $at, 0x8008
    sh          $v0, -0x6AE0($at)
    sll         $v1, $a2, 5
    subu        $v1, $v1, $a2
    sll         $v1, $v1, 3
    addu        $v1, $v1, $a2
    sll         $v1, $v1, 3
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, -0x7B10($at)
    lui         $v0, 0x8008
    lhu         $v0, -0x6AE4($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $a0, -0x7B14($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $a1, -0x7B12($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, -0x7B0F($at)
    addiu       $v0, $s0, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sb          $v0, -0x7B0E($at)
    lui         $v1, 0x8007
    lw          $v1, -0x6D64($v1)
    beqz        $v1, .L8001C3AC
    sll         $v0, $s0, 2
    addu        $v0, $v0, $v1
    lw          $v0, 0x4($v0)
    beqz        $v0, .L8001C3AC
    addu        $a0, $fp, $zero
    lw          $v0, 0x8($v0)
    lh          $a3, 0x3A($v0)
    lui         $a1, 0x8002
    addiu       $a1, $a1, -0x4840
    jal         func_80008F30
    addiu       $a2, $a2, 0x1
.L8001C3AC:
    lbu         $t1, 0x17($sp)
    addiu       $t1, $t1, 0x1
    sb          $t1, 0x17($sp)
.L8001C3B8:
    lui         $s0, 0x8008
    lw          $s0, -0x6B88($s0)
    lbu         $v0, 0x0($s0)
    nor         $v0, $zero, $v0
    andi        $v0, $v0, 0xFF
    bnez        $v0, .L8001BD5C
    nop
.L8001C3D4:
    lw          $a0, 0x18($s5)
    jal         func_8000DB20
    addu        $a1, $fp, $zero
    lhu         $a3, 0x1C($s5)
    addiu       $v0, $zero, 0x1
    sh          $v0, 0xA($s5)
    lw          $v0, 0x1C($s7)
    addu        $a0, $fp, $zero
    sh          $v0, 0xC($s5)
    lw          $v0, 0x20($s7)
    lui         $a1, 0x8002
    addiu       $a1, $a1, -0x4A40
    addu        $a2, $s7, $zero
    jal         func_80008F30
    sh          $v0, 0xE($s5)
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
.end ui_resource_render
