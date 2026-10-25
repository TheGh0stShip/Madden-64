.text
.align 2
.set noreorder
.globl func_800C1368
.ent func_800C1368
func_800C1368:
    addiu       $v0, $zero, -0x1
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x6B70
    lw          $v1, 0x0($a1)
    beq         $v1, $v0, .L800C1508
    addiu       $a3, $zero, -0x1
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x7F10
    lui         $t0, 0x8009
    addiu       $t0, $t0, -0x6CF8
    lui         $t1, 0x8009
    addiu       $t1, $t1, -0x4E08
    lhu         $a0, 0x3C($s3)
    lw          $v0, 0x0($a1)
    bnel        $a0, $v0, .L800C146C
    addiu       $a1, $a1, 0x4
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a2
    lw          $v1, 0x0($v0)
    beqz        $v1, .L800C1508
    nop
    lbu         $v0, 0x1E($v1)
    bnez        $v0, .L800C13D4
    nop
    lbu         $v0, 0x1F($v1)
    j           func_800BCCB8
    nop
.L800C13D4:
    lbu         $v0, 0x1F($v1)
    addiu       $v0, $v0, 0xB
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v0, 0x5E50($at)
    lw          $v0, 0x0($a1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    lw          $v1, 0x0($v0)
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $v1, $v0, .L800C1508
    nop
    lw          $v0, 0x2C($v1)
    addiu       $v0, $v0, -0xB
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C1508
    nop
    lhu         $v0, 0x3C($s3)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sb          $a3, 0x5E50($at)
    lhu         $v0, 0x3C($s3)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t0
    lh          $v0, 0x0($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x6C60($a0)
    sll         $v0, $v0, 1
    addu        $v0, $v0, $t1
    lhu         $a1, 0x0($v0)
    jal         func_80096A00
    nop
    lhu         $v0, 0x3C($s3)
    lui         $at, 0x8009
    sb          $v0, -0x7F8A($at)
    j           func_800BCDE4
    nop
.L800C146C:
    lw          $v0, 0x0($a1)
    beq         $v0, $a3, .L800C1508
    nop
    j           func_800BCC74
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    beqz        $v1, .L800C1508
    nop
    lw          $v0, 0x2C($v1)
    addiu       $v0, $v0, -0xB
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C1508
    nop
    lbu         $v0, 0x21($v1)
    andi        $v0, $v0, 0xC0
    bnez        $v0, .L800C14E0
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x6C60($a0)
    lui         $a1, 0x8009
    lhu         $a1, -0x4DFA($a1)
    jal         func_80096A00
    nop
    addiu       $v0, $zero, 0x8
    lui         $at, 0x8009
    sb          $v0, -0x7F8A($at)
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
.L800C14E0:
    lbu         $v0, 0x1E($v1)
    bnez        $v0, .L800C14F8
    nop
    lbu         $v0, 0x1F($v1)
    j           func_800BCDDC
    nop
.L800C14F8:
    lbu         $v0, 0x1F($v1)
    addiu       $v0, $v0, 0xB
    lui         $at, 0x8008
    sb          $v0, 0x5E58($at)
.L800C1508:
    lw          $ra, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800C1368
