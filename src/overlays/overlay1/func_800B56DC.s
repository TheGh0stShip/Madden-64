.text
.align 2
.set noreorder
.globl func_800B56DC
.ent func_800B56DC
func_800B56DC:
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L800B5708
    nop
    jal         func_800BE784
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x2000
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800B5708:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x10
    beqz        $v0, .L800B5738
    nop
    jal         func_800BC98C
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x10
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
.L800B5738:
    jal         func_800BF1C8
    nop
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x7AF2($at)
    jal         func_800E0E24
    nop
    andi        $v0, $v0, 0xFFFF
    addiu       $v1, $zero, 0x1
    bne         $v0, $v1, .L800B576C
    nop
    jal         func_800E0CFC
    nop
.L800B576C:
    jal         func_80036540
    addu        $a0, $zero, $zero
    jal         func_800A22FC
    nop
    jal         func_800AA33C
    nop
    jal         func_8000CDC0
    nop
    jal         func_800334B8
    nop
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x5
    lui         $v0, 0x8009
    lh          $v0, -0x5088($v0)
    blez        $v0, .L800B57E4
    addu        $a0, $zero, $zero
    addiu       $a3, $zero, -0x2
    addu        $a2, $v0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x5C18
.L800B57C0:
    lw          $v1, 0x0($a1)
    beqz        $v1, .L800B57D8
    addiu       $a0, $a0, 0x1
    lw          $v0, 0x14($v1)
    and         $v0, $v0, $a3
    sw          $v0, 0x14($v1)
.L800B57D8:
    slt         $v0, $a0, $a2
    bnez        $v0, .L800B57C0
    addiu       $a1, $a1, 0x4
.L800B57E4:
    jal         func_8001AEA8
    addu        $a0, $zero, $zero
    addu        $s0, $v0, $zero
    lui         $v0, 0x800E
    addiu       $v0, $v0, 0x6C5C
    lui         $at, 0x800E
    sw          $v0, 0x6D20($at)
    jal         func_800B13A4
    nop
    lui         $v0, 0x8009
    lbu         $v0, -0x4DF0($v0)
    lui         $v1, 0x8009
    lbu         $v1, -0x7F68($v1)
    lui         $a1, 0x800E
    addiu       $a1, $a1, 0x6C56
    lui         $at, 0x8009
    sb          $zero, -0x6A1C($at)
    lui         $at, 0x8008
    sb          $zero, 0x7AA0($at)
    lui         $at, 0x8009
    sb          $zero, -0x4D7E($at)
    sb          $v0, 0x0($a1)
    lui         $at, 0x8007
    sb          $v0, 0x2096($at)
    lui         $at, 0x8007
    sb          $v0, 0x20F2($at)
    lui         $at, 0x800E
    sb          $v0, 0x6DD6($at)
    lui         $at, 0x800E
    sb          $v0, 0x6ED2($at)
    lui         $at, 0x800E
    sb          $v0, 0x6F9A($at)
    lui         $at, 0x800E
    sb          $v0, 0x71A2($at)
    lui         $at, 0x8007
    sb          $v0, 0x21B2($at)
    lui         $at, 0x800E
    sb          $v0, 0x7572($at)
    lui         $at, 0x8007
    sb          $v0, 0x2192($at)
    lui         $at, 0x800E
    sb          $v0, 0x7252($at)
    lui         $at, 0x800E
    sb          $v0, 0x73FA($at)
    lui         $at, 0x800E
    sb          $v0, 0x5FB2($at)
    lui         $at, 0x800E
    sb          $v0, 0x76A6($at)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B58C0
    addiu       $a1, $a1, -0x1A
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    j           func_800B11AC
    nop
.L800B58C0:
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x800E
    addiu       $a1, $a1, 0x6D9C
    jal         func_800DC978
    addiu       $a2, $zero, 0x3C
    jal         func_800DCBC4
    nop
    jal         func_800B1744
    nop
    jal         func_800BDF68
    nop
    lui         $v0, 0x8008
    lb          $v0, 0x7AA0($v0)
    addiu       $v1, $zero, 0x1
    bne         $v0, $v1, .L800B5958
    nop
    lui         $v0, 0x8009
    lbu         $v0, -0x4DF0($v0)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    lui         $at, 0x8008
    sh          $v0, 0x7B5C($at)
    jal         func_800A2800
    nop
    jal         func_800B2394
    nop
    jal         func_800A27CC
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x7
    beq         $v1, $v0, .L800B599C
    nop
    lui         $v0, 0x800E
    addiu       $v0, $v0, 0x6C7C
    j           func_800B10D4
    nop
.L800B5958:
    lui         $v0, 0x8009
    lb          $v0, -0x6A1C($v0)
    bne         $v0, $v1, .L800B599C
    nop
    jal         func_800D05D4
    nop
    jal         func_800A27CC
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x7
    beq         $v1, $v0, .L800B599C
    nop
    lui         $v0, 0x800E
    addiu       $v0, $v0, 0x6CCC
    j           func_800B10D4
    nop
.L800B599C:
    jal         func_8003190C
    addiu       $a0, $zero, 0x1000
    jal         func_8001AEA8
    addu        $a0, $s0, $zero
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x4
    jal         func_800AA1E4
    nop
.end func_800B56DC
