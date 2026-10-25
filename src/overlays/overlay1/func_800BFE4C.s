.text
.align 2
.set noreorder
.globl func_800BFE4C
.ent func_800BFE4C
func_800BFE4C:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lbu         $v0, 0x21($s0)
    andi        $v0, $v0, 0xBF
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s1, 0x2720($at)
    jal         func_800BD694
    nop
    lhu         $v1, 0x28($s0)
    andi        $v1, $v1, 0x8
    beqz        $v1, .L800BFED0
    addu        $a0, $v0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beq         $s0, $v0, .L800BFEF0
    addu        $v0, $zero, $zero
    lw          $v0, 0x8($s1)
    and         $v0, $a0, $v0
    beqz        $v0, .L800BFEF0
    addu        $v0, $zero, $zero
    lbu         $a0, 0x21($s0)
    jal         func_800BD79C
    andi        $a0, $a0, 0xBF
    j           func_800BB7CC
    addu        $v0, $zero, $zero
.L800BFED0:
    lw          $v0, 0x8($s1)
    and         $v0, $a0, $v0
    beqz        $v0, .L800BFEF0
    addu        $v0, $zero, $zero
    lbu         $a0, 0x21($s0)
    jal         func_800BD734
    andi        $a0, $a0, 0xBF
    addu        $v0, $zero, $zero
.L800BFEF0:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BFE4C
