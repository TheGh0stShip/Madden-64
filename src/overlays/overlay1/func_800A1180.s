.text
.align 2
.set noreorder
.globl func_800A1180
.ent func_800A1180
func_800A1180:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x14($sp)
    addiu       $v0, $zero, -0x801
    sw          $ra, 0x18($sp)
    and         $v0, $v1, $v0
    andi        $v1, $v1, 0x2000
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    beqz        $v1, .L800A11C0
    addu        $s1, $a1, $zero
    jal         func_800BE784
    nop
.L800A11C0:
    lui         $v1, 0x8008
    lh          $v1, 0x6CF2($v1)
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800A11DC
    nop
    jal         func_800A365C
    addu        $a0, $zero, $zero
.L800A11DC:
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    bnez        $v0, .L800A12C4
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    lui         $at, 0x8008
    sh          $s0, 0x57F0($at)
    lui         $at, 0x8009
    sh          $s1, -0x6B04($at)
    beq         $v1, $v0, .L800A1214
    nop
    lui         $at, 0x8009
    sh          $zero, -0x5A4E($at)
.L800A1214:
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x4
    bne         $v1, $v0, .L800A124C
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x29
    beqz        $v0, .L800A124C
    nop
    lui         $v0, 0x8008
    lbu         $v0, 0x6DCC($v0)
    beqz        $v0, .L800A12A0
    nop
.L800A124C:
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    beqz        $a0, .L800A1280
    nop
    lw          $v0, 0x24($a0)
    lw          $v1, 0x20($v0)
    lui         $v0, 0x31F
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    beqz        $v0, .L800A1290
    nop
    j           func_8009CB7C
    nop
.L800A1280:
    lui         $a0, 0x8008
    lw          $a0, 0x5284($a0)
    beqz        $a0, .L800A12A0
    nop
.L800A1290:
    jal         func_80039750
    nop
    jal         func_800AE5C4
    andi        $a0, $v0, 0xFFFF
.L800A12A0:
    jal         func_800AEAAC
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A12C4
    nop
    jal         func_800AD404
    nop
    jal         func_800AD49C
    nop
.L800A12C4:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800A1180
