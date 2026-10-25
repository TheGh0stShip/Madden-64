.text
.align 2
.set noreorder
.globl func_800BF330
.ent func_800BF330
func_800BF330:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    lui         $v0, 0x100
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    and         $v0, $v1, $v0
    beqz        $v0, .L800BF370
    sw          $s1, 0x14($sp)
    lhu         $v1, 0x28($s0)
    addu        $v0, $zero, $zero
    andi        $v1, $v1, 0xFFFE
    j           func_800BAE30
    sh          $v1, 0x28($s0)
.L800BF370:
    lbu         $v0, 0x21($s0)
    andi        $v0, $v0, 0xBF
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v0, -0x4D58($at)
    andi        $v1, $v1, 0xC0
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s2, 0x2720($at)
    addiu       $v0, $zero, 0x40
    bne         $v1, $v0, .L800BF3D8
    nop
    jal         func_800BABB8
    addu        $a0, $s0, $zero
    sll         $v0, $v0, 16
    beqz        $v0, .L800BF3D8
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $v0, $s0, .L800BF3D8
    nop
    jal         func_800BAE7C
    addu        $a0, $s0, $zero
    j           func_800BAE30
    andi        $v0, $v0, 0xFFFF
.L800BF3D8:
    jal         func_800BD694
    addu        $a0, $s0, $zero
    lhu         $a0, 0x28($s0)
    addu        $s1, $v0, $zero
    andi        $v0, $a0, 0x10
    bnez        $v0, .L800BF554
    addu        $v0, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, 0x80
    andi        $v0, $v0, 0x88
    bne         $v0, $v1, .L800BF424
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x57B4($v0)
    bltz        $v0, .L800BF424
    andi        $v0, $a0, 0xFFFE
    j           func_800BAE2C
    sh          $v0, 0x28($s0)
.L800BF424:
    jal         func_800BBB18
    addu        $a0, $s0, $zero
    sltu        $v1, $zero, $s1
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    nor         $v0, $zero, $v0
    sltu        $v0, $zero, $v0
    or          $v1, $v1, $v0
    beqz        $v1, .L800BF550
    addiu       $v0, $zero, 0x3C
    lui         $at, 0x8009
    sh          $v0, -0x507E($at)
    lw          $v0, 0x0($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BF474
    nop
    jal         func_800C9418
    addu        $a0, $s0, $zero
    j           func_800BAE30
    addu        $v0, $zero, $zero
.L800BF474:
    lw          $v0, 0x4($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BF494
    nop
    jal         func_800C93D8
    addu        $a0, $s0, $zero
    j           func_800BAE30
    addu        $v0, $zero, $zero
.L800BF494:
    lw          $v0, 0xC($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BF4D4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $s0, $v0, .L800BF4C4
    nop
    jal         func_800C94C8
    addu        $a0, $s0, $zero
    bnez        $v0, .L800BF554
    addu        $v0, $zero, $zero
.L800BF4C4:
    jal         func_800C945C
    addu        $a0, $s0, $zero
    j           func_800BAE30
    addu        $v0, $zero, $zero
.L800BF4D4:
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $s0, $v0, .L800BF554
    addu        $v0, $zero, $zero
    lw          $v0, 0x8($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BF504
    andi        $v0, $s1, 0x2020
    jal         func_800C9484
    addu        $a0, $s0, $zero
    j           func_800BAE30
    addu        $v0, $zero, $zero
.L800BF504:
    beqz        $v0, .L800BF51C
    addu        $a0, $s0, $zero
    jal         func_800C9724
    addiu       $a1, $zero, 0x1
    j           func_800BAE30
    addu        $v0, $zero, $zero
.L800BF51C:
    andi        $v0, $s1, 0x10
    beqz        $v0, .L800BF538
    nop
    jal         func_800C9724
    addiu       $a1, $zero, 0x2
    j           func_800BAE30
    addu        $v0, $zero, $zero
.L800BF538:
    lw          $v0, 0x10($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BF554
    addu        $v0, $zero, $zero
    jal         func_800BB7E4
    addu        $a0, $s0, $zero
.L800BF550:
    addu        $v0, $zero, $zero
.L800BF554:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BF330
