.text
.align 2
.set noreorder
.globl func_800BF93C
.ent func_800BF93C
func_800BF93C:
    bnez        $v0, .L800BF958
    addiu       $v1, $zero, 0x40
    lbu         $a0, 0x21($s0)
    jal         func_800BD79C
    andi        $a0, $a0, 0xBF
    j           func_800BB41C
    addu        $v0, $zero, $zero
.L800BF958:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x48
    bne         $v0, $v1, .L800BF9CC
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x5FA8($a0)
    beqz        $a0, .L800BF9CC
    nop
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800BF9CC
    lui         $v1, 0x1
    lw          $v0, 0x24($a0)
    lw          $v0, 0x14($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L800BF9CC
    nop
    lbu         $v0, 0x1F($s0)
    sltiu       $v0, $v0, 0x6
    beqz        $v0, .L800BF9CC
    addiu       $v0, $zero, 0xE
    sb          $v0, 0x10($sp)
    lbu         $v0, 0x1F($s0)
    addiu       $a1, $sp, 0x10
    jal         func_800E1A84
    sb          $v0, 0x11($sp)
    j           func_800BB41C
    addu        $v0, $zero, $zero
.L800BF9CC:
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800BFA00
    addiu       $v1, $zero, 0x3
    lui         $v0, 0x8009
    lh          $v0, -0x6CC0($v0)
    beq         $v0, $v1, .L800BFA00
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4E($v0)
    bne         $v0, $v1, .L800BFA40
    nop
.L800BFA00:
    lbu         $a0, 0x21($s0)
    jal         func_800BD79C
    andi        $a0, $a0, 0xBF
    lui         $v0, 0x8009
    lw          $v0, -0x6B70($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x7F10($at)
    lw          $a1, 0x24($v0)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2E4C
    nop
    j           func_800BB41C
    addu        $v0, $zero, $zero
.L800BFA40:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L800BFB40
    addu        $v0, $zero, $zero
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800BFB40
    addu        $v0, $zero, $zero
    jal         func_800BBB18
    addu        $a0, $s0, $zero
    lw          $v0, 0xC($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BFAD8
    addiu       $v0, $zero, 0x8
    lbu         $v1, 0x64($s0)
    bnel        $v1, $v0, .L800BFAC8
    addu        $a0, $s0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4E($v1)
    addiu       $v0, $zero, 0x5
    bnel        $v1, $v0, .L800BFAC8
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x6178($v0)
    lw          $v1, 0x24($v0)
    lui         $v0, 0x40
    slt         $v0, $v0, $v1
    beqz        $v0, .L800BFAD8
    nop
    jal         func_800C9F58
    addu        $a0, $s0, $zero
    j           func_800BB41C
    addu        $v0, $zero, $zero
.L800BFAC8:
    jal         func_800C9778
    addiu       $a1, $zero, 0x1
    j           func_800BB41C
    addu        $v0, $zero, $zero
.L800BFAD8:
    lw          $v0, 0x4($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BFAF8
    nop
    jal         func_800C93D8
    addu        $a0, $s0, $zero
    j           func_800BB41C
    addu        $v0, $zero, $zero
.L800BFAF8:
    lw          $v0, 0x24($s0)
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v1, 0x20($v0)
    lw          $a0, 0x20($a0)
    lui         $v0, 0xBF
    ori         $v0, $v0, 0xFFFF
    subu        $v1, $v1, $a0
    slt         $v0, $v0, $v1
    bnez        $v0, .L800BFB40
    addu        $v0, $zero, $zero
    lw          $v0, 0x0($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BFB40
    addu        $v0, $zero, $zero
    jal         func_800C9418
    addu        $a0, $s0, $zero
    addu        $v0, $zero, $zero
.L800BFB40:
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800BF93C
