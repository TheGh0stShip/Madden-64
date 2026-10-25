.text
.align 2
.set noreorder
.globl func_800A5094
.ent func_800A5094
func_800A5094:
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    lw          $v1, 0x20($a0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A5168
    lui         $v0, 0x1000
    lui         $a1, 0x8008
    lw          $a1, 0xC10($a1)
    ori         $v0, $v0, 0x8
    and         $v0, $a1, $v0
    bnez        $v0, .L800A5168
    addiu       $v0, $zero, 0x1A
    lui         $at, 0x8008
    sb          $v0, 0x7AB0($at)
    lh          $v0, 0x1C($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB2($at)
    lh          $a0, 0x20($a0)
    ori         $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    lui         $at, 0x8008
    sw          $v1, 0x7ABC($at)
    lui         $at, 0x8008
    sh          $a0, 0x7AB4($at)
    jal         func_800C5F80
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x10
    beqz        $v0, .L800A5138
    nop
    jal         func_800BC98C
    nop
.L800A5138:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beqz        $v0, .L800A5150
    nop
    jal         func_800A365C
    addiu       $a0, $zero, 0x4
.L800A5150:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, -0x141
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800A5168:
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lw          $a0, 0x1C($v0)
    bltzl       $a0, .L800A517C
    negu        $a0, $a0
.L800A517C:
    lui         $a1, 0x8009
    lw          $a1, -0x5FA8($a1)
    beqz        $a1, .L800A51F4
    lui         $v0, 0x18F
    lbu         $v0, 0x2D($a1)
    addiu       $v0, $v0, -0x1D
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800A51B4
    lui         $v1, 0x2
    lw          $a2, 0x24($a1)
    lw          $v0, 0x14($a2)
    and         $v0, $v0, $v1
    bnez        $v0, .L800A51D8
    nop
.L800A51B4:
    lw          $v0, 0x24($a1)
    lw          $v0, 0x48($v0)
    lh          $v1, 0x0($v0)
    lhu         $v0, 0x8($v0)
    addiu       $v1, $v1, -0x3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 16
    j           func_800A0ACC
    addu        $a0, $a0, $v0
.L800A51D8:
    lw          $v0, 0x48($a2)
    lh          $v1, 0x0($v0)
    lhu         $v0, 0x8($v0)
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 16
    addu        $a0, $a0, $v1
    lui         $v0, 0x18F
.L800A51F4:
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $a0
    beqz        $v0, .L800A539C
    addiu       $v0, $zero, 0x18
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7AB0
    sb          $v0, 0x0($s0)
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    lh          $v0, 0x1C($a0)
    sh          $v0, 0x2($s0)
    lh          $v0, 0x20($a0)
    beqz        $v1, .L800A52EC
    sh          $v0, 0x4($s0)
    lui         $v0, 0x8008
    lh          $v0, 0x76F6($v0)
    beqz        $v0, .L800A5264
    addiu       $v0, $zero, 0x6
    lui         $v1, 0x8008
    lh          $v1, 0x4F6E($v1)
    beq         $v1, $v0, .L800A525C
    nop
    jal         func_8009CCD4
    nop
.L800A525C:
    lui         $at, 0x8008
    sh          $zero, 0x76F6($at)
.L800A5264:
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F50($v1)
    lw          $v0, 0x20($v0)
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A52B8
    lui         $v0, 0x8000
    beq         $v1, $v0, .L800A52B8
    sra         $v1, $v1, 16
    lui         $v0, 0x8008
    lw          $v0, 0x57F4($v0)
    lui         $at, 0x8008
    sh          $v1, 0x7AB4($at)
    addiu       $v1, $zero, 0x25
    lui         $at, 0x8008
    sb          $v1, 0x7AB1($at)
    lui         $at, 0x8008
    sw          $v0, 0x7AB8($at)
    j           func_800A0C4C
    nop
.L800A52B8:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    lhu         $v0, 0x34($a0)
    lui         $at, 0x8008
    sb          $v0, 0x7AB1($at)
    jal         func_800C157C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sw          $v0, 0x7AB8($at)
    j           func_800A0C4C
    nop
.L800A52EC:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    addiu       $v0, $v1, -0x4
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800A5370
    andi        $v1, $v1, 0xFFFF
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L800A5368
    addiu       $v0, $zero, 0x3C
    addiu       $v0, $zero, 0xC
    sb          $v0, 0x0($s0)
    lh          $v0, 0x1C($a0)
    sh          $v0, 0x2($s0)
    lh          $v0, 0x20($a0)
    lui         $at, 0x8008
    sw          $zero, 0x7ABC($at)
    jal         func_800C5F80
    sh          $v0, 0x4($s0)
    lh          $v0, 0x4($s0)
    slti        $v0, $v0, -0x320
    bnez        $v0, .L800A5368
    addiu       $v0, $zero, 0x3C
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lw          $a2, 0x20($v0)
    lui         $a1, 0x8008
    lw          $a1, 0xC2C($a1)
    addiu       $a0, $zero, 0x12
    jal         func_8001FA68
    addu        $a3, $a2, $zero
    addiu       $v0, $zero, 0x3C
.L800A5368:
    lui         $at, 0x8008
    sh          $v0, 0x7AF0($at)
.L800A5370:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    lui         $at, 0x8008
    sw          $v0, 0x7ABC($at)
    jal         func_800C5F80
    nop
    addiu       $a0, $zero, 0x2D
    jal         func_8009CA5C
    addiu       $a1, $zero, 0xD2
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
.L800A539C:
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v1, 0x20($a0)
    lui         $v0, 0xFCE0
    slt         $v0, $v0, $v1
    bnez        $v0, .L800A550C
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x8000
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    lui         $v0, 0xFC48
    slt         $v0, $v0, $v1
    bnez        $v0, .L800A550C
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beqz        $v0, .L800A5450
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x76F6($v0)
    beqz        $v0, .L800A541C
    addiu       $v0, $zero, 0x6
    lui         $v1, 0x8008
    lh          $v1, 0x4F6E($v1)
    beq         $v1, $v0, .L800A5414
    nop
    jal         func_8009CCD4
    nop
.L800A5414:
    lui         $at, 0x8008
    sh          $zero, 0x76F6($at)
.L800A541C:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    lhu         $v0, 0x34($a0)
    lui         $at, 0x8008
    sb          $v0, 0x7AB1($at)
    jal         func_800C157C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sw          $v0, 0x7AB8($at)
    j           func_800A0D90
    nop
.L800A5450:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    addiu       $v0, $v1, -0x4
    sltiu       $v0, $v0, 0x2
    beqz        $v0, .L800A54B4
    andi        $v1, $v1, 0xFFFF
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L800A54AC
    addiu       $v0, $zero, 0x3C
    addiu       $v0, $zero, 0xC
    lui         $at, 0x8008
    sb          $v0, 0x7AB0($at)
    lh          $v0, 0x1C($a0)
    lui         $at, 0x8008
    sh          $v0, 0x7AB2($at)
    lh          $v0, 0x20($a0)
    lui         $at, 0x8008
    sw          $zero, 0x7ABC($at)
    lui         $at, 0x8008
    sh          $v0, 0x7AB4($at)
    jal         func_800C5F80
    nop
    addiu       $v0, $zero, 0x3C
.L800A54AC:
    lui         $at, 0x8008
    sh          $v0, 0x7AF0($at)
.L800A54B4:
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    addiu       $v0, $zero, 0x18
    lui         $at, 0x8008
    sb          $v0, 0x7AB0($at)
    lh          $v0, 0x1C($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB2($at)
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    lh          $v1, 0x20($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7ABC($at)
    lui         $at, 0x8008
    sh          $v1, 0x7AB4($at)
    jal         func_800C5F80
    nop
    addiu       $a0, $zero, 0x2D
    jal         func_8009CA5C
    addiu       $a1, $zero, 0xD2
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
.L800A550C:
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a0, 0x20($v1)
    lui         $v0, 0x31F
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $a0
    beqz        $v0, .L800A5670
    lui         $v0, 0x3BF
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $a0
    beqz        $v0, .L800A55EC
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beqz        $v0, .L800A55B4
    addiu       $v0, $zero, 0x18
    lui         $v0, 0x8008
    lh          $v0, 0x76F6($v0)
    beqz        $v0, .L800A557C
    addiu       $v0, $zero, 0x6
    lui         $v1, 0x8008
    lh          $v1, 0x4F6E($v1)
    beq         $v1, $v0, .L800A5574
    nop
    jal         func_8009CCD4
    nop
.L800A5574:
    lui         $at, 0x8008
    sh          $zero, 0x76F6($at)
.L800A557C:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    lhu         $v0, 0x34($a0)
    lui         $at, 0x8008
    sb          $v0, 0x7AB1($at)
    jal         func_800C157C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    sw          $v0, 0x7AB8($at)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    addiu       $v0, $zero, 0x18
.L800A55B4:
    lui         $at, 0x8008
    sb          $v0, 0x7AB0($at)
    lh          $v0, 0x1C($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB2($at)
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    lh          $v1, 0x20($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7ABC($at)
    lui         $at, 0x8008
    sh          $v1, 0x7AB4($at)
    j           func_800A0F14
    nop
.L800A55EC:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    beqz        $a0, .L800A5670
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x76F6($v0)
    bnel        $v0, $zero, .L800A565C
    lui         $v1, 0x200
    addiu       $v0, $zero, 0x19
    lui         $at, 0x8008
    sb          $v0, 0x7AB0($at)
    lh          $v0, 0x1C($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB2($at)
    lh          $v0, 0x20($v1)
    lui         $at, 0x8008
    sw          $a0, 0x7ABC($at)
    lui         $at, 0x8008
    sh          $v0, 0x7AB4($at)
    jal         func_800C5F80
    nop
    addiu       $a0, $zero, 0x2D
    jal         func_8009CA5C
    addiu       $a1, $zero, 0xD2
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    j           func_800A0F4C
    nop
.L800A565C:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    or          $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800A5670:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A5094
