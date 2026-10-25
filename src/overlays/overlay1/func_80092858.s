.text
.align 2
.set noreorder
.globl func_80092858
.ent func_80092858
func_80092858:
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x100
    bnez        $v0, .L80092888
    addiu       $v0, $zero, 0x3C
    lui         $at, 0x8008
    sh          $v0, 0x5BFE($at)
    jal         func_80093110
    nop
    jal         func_800416A4
    addiu       $a0, $zero, 0xA
.L80092888:
    lui         $v0, 0x8009
    lbu         $v0, -0x503A($v0)
    beqz        $v0, .L80092988
    andi        $v0, $s0, 0x2020
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x100
    bnez        $v0, .L80092988
    andi        $v0, $s0, 0x2020
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s6
    sll         $v1, $s2, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $v0
    lw          $a0, 0x0($v1)
    lbu         $a1, 0x21($a0)
    and         $v0, $a1, $s4
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    lw          $v0, 0xC($v0)
    and         $v0, $s0, $v0
    beqz        $v0, .L80092988
    andi        $v0, $s0, 0x2020
    jal         func_800BDD70
    andi        $a1, $a1, 0x3F
    lui         $v0, 0x8009
    lw          $v0, -0x6B70($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $s0, -0x7F10($at)
    lbu         $v0, 0x1F($s0)
    beqz        $v0, .L80092944
    nop
    lw          $a1, 0x24($s0)
    j           func_8008E228
    nop
.L80092944:
    lui         $a1, 0x8008
    lw          $a1, 0x6178($a1)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2E4C
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    lbu         $v1, 0x1F($s0)
    and         $v0, $v0, $s4
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s5
    lui         $at, 0x8009
    sb          $v1, -0x6AE6($at)
    j           func_8008E708
    sw          $zero, 0x0($v0)
.L80092988:
    beqz        $v0, .L800929A8
    andi        $v0, $s0, 0x10
    lui         $a0, 0x8008
    lbu         $a0, 0x57B3($a0)
    jal         func_80093540
    andi        $a0, $a0, 0x3F
    j           func_8008E29C
    nop
.L800929A8:
    beqz        $v0, .L800929C0
    nop
    lui         $a0, 0x8008
    lbu         $a0, 0x57B3($a0)
    jal         func_800935A4
    andi        $a0, $a0, 0x3F
.L800929C0:
    lui         $a1, 0x8009
    lh          $a1, -0x6AE8($a1)
    addiu       $v0, $zero, -0x1
    beq         $a1, $v0, .L80092AE0
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $s6
    sll         $v0, $s2, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $v1
    lw          $a0, 0x0($v0)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $v1
    lw          $s0, 0x0($v0)
    jal         func_800BBA64
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v0, $v0, 0xFF
    lbu         $v1, 0x21($s0)
    sra         $a0, $v0, 9
    addiu       $v0, $zero, 0x40
    andi        $v1, $v1, 0xC0
    beq         $v1, $v0, .L80092AE0
    addu        $a1, $a0, $zero
    lbu         $v0, 0x64($s0)
    sltiu       $v1, $v0, 0x1
    xori        $v0, $v0, 0x2
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L80092AE0
    addiu       $v0, $zero, 0x6
    bne         $a0, $v0, .L80092A9C
    sll         $v0, $a1, 16
    lw          $v0, 0x24($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x76EC($v1)
    lw          $a0, 0x1C($v0)
    lui         $v0, 0x3
    addu        $v1, $v1, $v0
    slt         $v1, $v1, $a0
    beqz        $v1, .L80092A9C
    sll         $v0, $a1, 16
    jal         func_800E1C98
    addu        $a0, $s0, $zero
    jal         func_800C9FB4
    addu        $a0, $s0, $zero
    j           func_8008E3BC
    nop
.L80092A9C:
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x2
    bne         $v0, $v1, .L80092AE0
    nop
    lw          $v0, 0x24($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x76F0($v1)
    lw          $a0, 0x1C($v0)
    lui         $v0, 0xFFFD
    addu        $v1, $v1, $v0
    slt         $a0, $a0, $v1
    beqz        $a0, .L80092AE0
    nop
    jal         func_800E1C98
    addu        $a0, $s0, $zero
    jal         func_800CA120
    addu        $a0, $s0, $zero
.L80092AE0:
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    and         $v0, $v0, $s4
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s5
    j           func_8008E53C
    sw          $zero, 0x0($v0)
.end func_80092858
