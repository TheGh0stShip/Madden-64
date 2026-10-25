.text
.align 2
.set noreorder
.globl func_800A4484
.ent func_800A4484
func_800A4484:
    lw          $v1, 0x1C($a2)
    lw          $v0, 0x1C($v0)
    subu        $v1, $v1, $v0
    addu        $a0, $v1, $zero
    bgez        $a0, .L800A44A0
    sw          $a0, 0x28($sp)
    negu        $a0, $a0
.L800A44A0:
    lw          $v0, 0x24($s2)
    lw          $v1, 0x20($a2)
    lw          $v0, 0x20($v0)
    subu        $v1, $v1, $v0
    addu        $v0, $v1, $zero
    bgez        $v0, .L800A44C0
    sw          $v0, 0x2C($sp)
    negu        $v0, $v0
.L800A44C0:
    lui         $a1, 0x7
    ori         $a1, $a1, 0xFFFF
    slt         $v1, $a1, $a0
    xori        $v1, $v1, 0x1
    slt         $v0, $a1, $v0
    xori        $v0, $v0, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, . + 4 + (0xF9 << 2)
    addiu       $v0, $zero, 0x3C
    lw          $v0, 0x24($a2)
    slt         $v0, $a1, $v0
    bnez        $v0, . + 4 + (0x17B << 2)
    addu        $v0, $zero, $zero
    lw          $v0, 0x24($s2)
    sw          $zero, 0x2C($v0)
    lw          $v0, 0x24($s2)
    sw          $zero, 0x30($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x7FA4($v1)
    addiu       $v0, $zero, 0x8
    beq         $v1, $v0, .L800A4528
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7FAC($v0)
    bnez        $v0, . + 4 + (0x16E << 2)
    addu        $v0, $zero, $zero
.L800A4528:
    lui         $v1, 0x8008
    lw          $v1, 0x54A4($v1)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, . + 4 + (0xDC << 2)
    addiu       $v0, $zero, 0x3
    lw          $v0, 0x9C($s2)
    bnez        $v0, .L800A45C4
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x5F84($v0)
    bnez        $v0, .L800A4568
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x5F80($v0)
    beqz        $v0, .L800A45B8
    nop
.L800A4568:
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    addiu       $v1, $zero, 0x2
    sw          $v1, 0x10($sp)
    sw          $v1, 0x14($sp)
    sw          $v1, 0x18($sp)
    sw          $zero, 0x1C($sp)
    lw          $a0, 0x1C($v0)
    lw          $a1, 0x20($v0)
    lw          $a2, 0x24($v0)
    lw          $a3, 0x28($v0)
    jal         func_8009F1DC
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    bnez        $v0, .L800A45B8
    addiu       $a0, $zero, 0x8
    lw          $a1, 0x24($s2)
    jal         func_800A3704
    addu        $a2, $zero, $zero
.L800A45B8:
    lw          $v0, 0x9C($s2)
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x9C($s2)
.L800A45C4:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bnez        $v0, . + 4 + (0x143 << 2)
    addu        $v0, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lw          $v0, 0x24($v0)
    bnez        $v0, . + 4 + (0x13E << 2)
    addu        $v0, $zero, $zero
    addu        $s4, $zero, $zero
    addiu       $s6, $zero, 0x37
    addiu       $s5, $zero, 0x34
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7138
    addu        $s0, $v0, $zero
    addiu       $s1, $s0, 0x28
    addu        $s3, $zero, $zero
.L800A4608:
    lhu         $v1, 0x0($s1)
    andi        $v0, $v1, 0x20
    beqz        $v0, .L800A4658
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x3C
    andi        $v0, $v1, 0xFFDF
    jal         func_800C0BBC
    sh          $v0, 0x0($s1)
    sb          $s6, 0x20($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $v0, 0x719C($at)
    bne         $v0, $s5, .L800A4650
    addu        $a0, $s0, $zero
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x20
    j           func_8009FF38
    addiu       $s0, $s0, 0xB0
.L800A4650:
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x20
.L800A4658:
    addiu       $s0, $s0, 0xB0
    addiu       $s1, $s1, 0xB0
    addiu       $s4, $s4, 0x1
    sltiu       $v0, $s4, 0x4
    bnez        $v0, .L800A4608
    addiu       $s3, $s3, 0xB0
    lui         $a1, 0x8008
    lw          $a1, -0x5F84($a1)
    beqz        $a1, .L800A4710
    addiu       $s0, $zero, 0x3
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lw          $v1, 0x9C($s2)
    addu        $v0, $v0, $v1
    sw          $v0, 0x9C($s2)
    slti        $v0, $v0, 0x1E
    bnez        $v0, . + 4 + (0x110 << 2)
    addu        $v0, $zero, $zero
    jal         func_800C0BBC
    addu        $a0, $s2, $zero
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L800A46F4
    addu        $a0, $s2, $zero
    jal         func_800C16A0
    addiu       $a1, $zero, 0x400
    jal         func_800A6580
    nop
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    lui         $at, 0x8009
    sb          $v0, -0x79CA($at)
    jal         func_800A6590
    addiu       $a1, $zero, 0x9
    addiu       $v1, $zero, 0x1
    sw          $v1, 0x8C($s2)
    lui         $at, 0x8008
    sw          $zero, -0x5F84($at)
    j           func_800A03B8
    addu        $v0, $zero, $zero
.L800A46F4:
    addiu       $a1, $zero, 0x3E
    jal         func_800C0BBC
    sw          $s0, 0x8C($a0)
    lui         $at, 0x8008
    sw          $zero, -0x5F84($at)
    j           func_800A03B8
    addu        $v0, $zero, $zero
.L800A4710:
    lui         $v0, 0x8008
    lw          $v0, -0x5F80($v0)
    beqz        $v0, . + 4 + (0x56 << 2)
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    beqz        $v0, . + 4 + (0x20 << 2)
    addiu       $v0, $zero, 0x201
    lui         $v1, 0x8008
    lw          $v1, 0x7424($v1)
    beq         $v1, $v0, . + 4 + (0xE7 << 2)
    addiu       $v0, $zero, 0x1
    lw          $v1, 0x9C($s2)
    bne         $v1, $v0, . + 4 + (0x19 << 2)
    addiu       $a0, $zero, 0xA
    lw          $a1, 0x24($s2)
    jal         func_800A3704
    addu        $a2, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x78E4($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x793C($v1)
    slt         $v0, $v0, $v1
    bnez        $v0, .L800A478C
    addiu       $a0, $zero, 0x2
    sw          $zero, 0x10($sp)
    addiu       $a0, $zero, 0x1
    addiu       $a1, $zero, 0x17
    addu        $a2, $zero, $zero
    j           func_800A0080
    addu        $a3, $zero, $zero
.L800A478C:
    lui         $a2, 0x8009
.end func_800A4484
