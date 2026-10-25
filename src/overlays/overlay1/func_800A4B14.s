.text
.align 2
.set noreorder
.globl func_800A4B14
.ent func_800A4B14
func_800A4B14:
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    addiu       $sp, $sp, -0x58
    sw          $s0, 0x50($sp)
    addu        $s0, $a0, $zero
    bnez        $v0, .L800A4B54
    sw          $ra, 0x54($sp)
    lui         $v0, 0x8008
    lw          $v0, 0x4F30($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    sw          $v0, 0x20($sp)
    sw          $v0, 0x30($sp)
    sw          $v1, 0x24($sp)
    j           func_800A0480
    sw          $v1, 0x34($sp)
.L800A4B54:
    lui         $v0, 0x8009
    lw          $v0, -0x6C58($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x6C54($v1)
    sw          $v0, 0x20($sp)
    jal         func_8000C8EC
    sw          $v1, 0x24($sp)
    beqz        $v0, .L800A4B8C
    lui         $v1, 0xFFEC
    lw          $v0, 0x20($sp)
    j           func_800A0474
    addu        $v0, $v0, $v1
.L800A4B8C:
    lw          $v0, 0x20($sp)
    lui         $v1, 0x14
    addu        $v0, $v0, $v1
    sw          $v0, 0x30($sp)
    lw          $v0, 0x24($sp)
    sw          $v0, 0x34($sp)
    lw          $v1, 0x90($s0)
    addiu       $v0, $zero, 0x3
    beq         $v1, $v0, .L800A4D6C
    slti        $v0, $v1, 0x4
    beql        $v0, $zero, .L800A4BCC
    addiu       $v0, $zero, 0x4
    beqz        $v1, .L800A4BDC
    addu        $v0, $zero, $zero
    j           func_800A095C
    nop
.L800A4BCC:
    beq         $v1, $v0, .L800A5010
    lui         $v1, 0x2
    j           func_800A095C
    addu        $v0, $zero, $zero
.L800A4BDC:
    jal         func_8002098C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x1
    beq         $v0, $v1, .L800A5080
    addu        $v0, $zero, $zero
    lw          $v0, 0x24($s0)
    lw          $v1, 0x30($sp)
    lw          $v0, 0x1C($v0)
    subu        $v1, $v1, $v0
    addu        $a1, $v1, $zero
    bgez        $a1, .L800A4C18
    sw          $a1, 0x10($sp)
    negu        $a1, $a1
.L800A4C18:
    lw          $v0, 0x24($s0)
    lw          $v1, 0x34($sp)
    lw          $v0, 0x20($v0)
    subu        $v1, $v1, $v0
    addu        $a0, $v1, $zero
    bgez        $a0, .L800A4C38
    sw          $a0, 0x14($sp)
    negu        $a0, $a0
.L800A4C38:
    lui         $v1, 0x7
    ori         $v1, $v1, 0xFFFF
    slt         $v0, $v1, $a1
    xori        $v0, $v0, 0x1
    slt         $v1, $v1, $a0
    xori        $v1, $v1, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L800A4D30
    lui         $v1, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L800A5080
    addu        $v0, $zero, $zero
    lw          $v0, 0x24($s0)
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    sw          $zero, 0x2C($v0)
    lw          $v0, 0x24($s0)
    sw          $zero, 0x30($v0)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L800A4CA4
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    bnez        $v0, .L800A5080
    addu        $v0, $zero, $zero
.L800A4CA4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, 0x3
    sw          $v1, 0x90($s0)
    lui         $v1, 0x1000
    and         $v0, $v0, $v1
    bnez        $v0, .L800A4D10
    addu        $a0, $s0, $zero
    lw          $v0, 0x20($sp)
    lw          $a1, 0x30($sp)
    lw          $v1, 0x24($sp)
    lw          $a2, 0x34($sp)
    addiu       $a0, $sp, 0x40
    subu        $v0, $v0, $a1
    subu        $v1, $v1, $a2
    sw          $v0, 0x40($sp)
    jal         func_800B9208
    sw          $v1, 0x44($sp)
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    jal         func_800C16A0
    sra         $a1, $v0, 16
    addu        $a0, $s0, $zero
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x3D
    j           func_800A095C
    addu        $v0, $zero, $zero
.L800A4D10:
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x41
    lw          $v0, 0x24($s0)
    lw          $v1, 0x14($v0)
    lui         $a0, 0x4
    or          $v1, $v1, $a0
    j           func_800A0958
    sw          $v1, 0x14($v0)
.L800A4D30:
    lw          $v1, 0x2C($s0)
    addiu       $v0, $zero, 0x3C
    beq         $v1, $v0, .L800A4D48
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x3C
.L800A4D48:
    jal         func_800B9208
    addiu       $a0, $sp, 0x10
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    sra         $a1, $v0, 16
    jal         func_800C0018
    addu        $a2, $zero, $zero
    j           func_800A095C
    addu        $v0, $zero, $zero
.L800A4D6C:
    lw          $v0, 0x24($s0)
    lw          $v1, 0x30($sp)
    lw          $v0, 0x1C($v0)
    subu        $v1, $v1, $v0
    addu        $a1, $v1, $zero
    bgez        $a1, .L800A4D8C
    sw          $a1, 0x10($sp)
    negu        $a1, $a1
.L800A4D8C:
    lw          $v0, 0x24($s0)
    lw          $v1, 0x34($sp)
    lw          $v0, 0x20($v0)
    subu        $v1, $v1, $v0
    addu        $a0, $v1, $zero
    bgez        $a0, .L800A4DAC
    sw          $a0, 0x14($sp)
    negu        $a0, $a0
.L800A4DAC:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    bne         $v1, $v0, .L800A4DD0
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    bnez        $v0, .L800A5080
    addu        $v0, $zero, $zero
.L800A4DD0:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lui         $v0, 0x1000
    and         $v0, $v1, $v0
    beqz        $v0, .L800A4DF0
    andi        $v0, $v1, 0x800
    beqz        $v0, .L800A5080
    addu        $v0, $zero, $zero
.L800A4DF0:
    lui         $v1, 0x7
    ori         $v1, $v1, 0xFFFF
    slt         $v0, $v1, $a1
    xori        $v0, $v0, 0x1
    slt         $v1, $v1, $a0
    xori        $v1, $v1, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L800A4F94
    lui         $v1, 0x4
    lw          $v0, 0x24($s0)
    lw          $v0, 0x14($v0)
    and         $v0, $v0, $v1
    beqz        $v0, .L800A4FA4
    nop
    jal         func_800311D0
    nop
    jal         func_800C6330
    addiu       $a0, $zero, 0x1
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $v0, 0x20($sp)
    lui         $a0, 0x8009
    lh          $a0, -0x6CE0($a0)
    sw          $v0, 0x1C($v1)
    lw          $v0, 0x24($sp)
    sw          $zero, 0x24($v1)
    sw          $zero, 0x2C($v1)
    sw          $zero, 0x30($v1)
    sw          $zero, 0x34($v1)
    sw          $v0, 0x20($v1)
    addiu       $v0, $zero, -0x1
    bne         $a0, $v0, .L800A4E78
    addiu       $v0, $zero, 0x3FF
    addiu       $v0, $zero, 0xFF
.L800A4E78:
    lui         $at, 0x8008
    sh          $v0, 0x76E0($at)
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x76E2
    sh          $zero, 0x0($v0)
    lui         $at, 0x8008
    sh          $zero, 0x76E4($at)
    lui         $at, 0x8008
    sh          $zero, 0x6E28($at)
    lui         $at, 0x8008
    sh          $zero, 0x6E2A($at)
    lui         $at, 0x8008
    sh          $zero, 0x6E2C($at)
    lui         $at, 0x8008
    sh          $zero, 0xC14($at)
    jal         func_8000EC8C
    addiu       $a1, $v0, -0x2
    lui         $v1, 0x8008
    lw          $v1, 0x54A4($v1)
    addiu       $v0, $zero, 0x4
    bnez        $v1, .L800A4FA4
    sw          $v0, 0x90($s0)
    jal         func_800AE9A4
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A4EF4
    nop
    jal         func_8009C99C
    nop
.L800A4EF4:
    lui         $v1, 0x8008
    lb          $v1, 0x5BFA($v1)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800A4F10
    nop
    jal         func_8009BCB0
    nop
.L800A4F10:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lb          $v1, 0x6DDC($at)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800A4F44
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x7758($v0)
    addiu       $v0, $v0, -0x3
    lui         $at, 0x8008
    sh          $v0, 0x69D6($at)
.L800A4F44:
    lui         $a0, 0x8008
    lw          $a0, 0xC10($a0)
    andi        $v0, $a0, 0x100
    beqz        $v0, .L800A4F84
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    bne         $v1, $v0, .L800A4F6C
    andi        $v0, $a0, 0x2
    andi        $v0, $a0, 0x4
.L800A4F6C:
    beqz        $v0, .L800A4F7C
    nop
    jal         func_800BE1B0
    nop
.L800A4F7C:
    jal         func_800A365C
    addiu       $a0, $zero, 0x3
.L800A4F84:
    jal         func_8009BB00
    nop
    j           func_800A0880
    nop
.L800A4F94:
    sw          $zero, 0x90($s0)
    addu        $a0, $s0, $zero
    jal         func_800C0C8C
    addiu       $a1, $zero, 0x3C
.L800A4FA4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x1000
    and         $v0, $v0, $v1
    beqz        $v0, .L800A507C
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    bne         $v1, $v0, .L800A5080
    addu        $v0, $zero, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a0, 0x5040($at)
    jal         func_800C61E8
    nop
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x5A4E($at)
    j           func_800A095C
    addu        $v0, $zero, $zero
.L800A5010:
    lw          $v0, 0x24($s0)
    lw          $v0, 0x14($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L800A5080
    addu        $v0, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x54A4($v0)
    beqz        $v0, .L800A5068
    addu        $a0, $s0, $zero
    lui         $v1, 0x8009
    lw          $v1, -0x6C58($v1)
    addiu       $v0, $zero, 0x35
    sb          $v0, 0x40($sp)
    lui         $at, 0x8008
    sw          $v1, 0xC40($at)
    lui         $at, 0x8008
    sw          $v1, 0xC70($at)
    jal         func_800E1BAC
    addiu       $a1, $sp, 0x40
    addu        $a0, $s0, $zero
    j           func_800A0948
    addiu       $a1, $zero, 0x41
.L800A5068:
    addiu       $a1, $zero, 0x3C
    jal         func_800C0C8C
    nop
    j           func_800A095C
    addiu       $v0, $zero, 0x1
.L800A507C:
    addu        $v0, $zero, $zero
.L800A5080:
    lw          $ra, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_800A4B14
