.text
.align 2
.set noreorder
.globl func_800BF7D8
.ent func_800BF7D8
func_800BF7D8:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    jal         func_800BD6CC
    sw          $s1, 0x14($sp)
    addu        $s1, $v0, $zero
    jal         func_800BD694
    addu        $a0, $s0, $zero
    addu        $a1, $v0, $zero
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    nor         $v0, $zero, $a1
    beq         $s0, $v1, .L800BF858
    and         $s1, $s1, $v0
    lbu         $v0, 0x21($s0)
    andi        $a0, $v0, 0xBF
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, 0x2720($at)
    lw          $v0, 0x8($v0)
    and         $v0, $a1, $v0
    beqz        $v0, .L800BF87C
    addu        $v0, $zero, $zero
    jal         func_800BD79C
    nop
    j           func_800BB158
    addu        $v0, $zero, $zero
.L800BF858:
    lui         $v0, 0x8008
    lw          $v0, 0xC1C($v0)
    and         $v0, $v0, $s1
    beqz        $v0, .L800BF87C
    addu        $v0, $zero, $zero
    lw          $v0, 0x8C($s0)
    negu        $v0, $v0
    sw          $v0, 0x8C($s0)
    addu        $v0, $zero, $zero
.L800BF87C:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BF7D8
