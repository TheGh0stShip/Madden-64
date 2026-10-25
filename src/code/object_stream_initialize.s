.text
.align 2
.set noreorder
.globl object_stream_initialize
.ent object_stream_initialize
object_stream_initialize:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s5, 0x24($sp)
    sw          $s2, 0x18($sp)
    addu        $s2, $a2, $zero
    lui         $v0, 0x3B9A
    ori         $v0, $v0, 0xC9F0
    sw          $ra, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s0, 0x10($sp)
    lw          $s6, 0x4($s1)
    sltu        $v0, $v0, $s2
    beqz        $v0, .L80063628
    addu        $s5, $a1, $zero
    jal         func_800635A0
    addiu       $a1, $zero, 0x1
.L80063628:
    andi        $v1, $s2, 0x7
    beqz        $v1, .L80063638
    addiu       $v0, $s2, 0x8
    subu        $s2, $v0, $v1
.L80063638:
    sltiu       $v0, $s5, 0x2
    bnez        $v0, .L8006366C
    sll         $v0, $s5, 2
    lw          $v1, 0x0($s1)
    addiu       $v0, $zero, 0xC
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s1)
    sw          $s5, 0x18($v0)
    lw          $v0, 0x0($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s1, $zero
    sll         $v0, $s5, 2
.L8006366C:
    addu        $v0, $v0, $s6
    lw          $a1, 0x30($v0)
    beqz        $a1, .L800636A4
    addu        $s4, $zero, $zero
.L8006367C:
    lw          $v0, 0x8($a1)
    sltu        $v0, $v0, $s2
    beqz        $v0, .L8006369C
    nop
    addu        $s4, $a1, $zero
    lw          $a1, 0x0($a1)
    bnez        $a1, .L8006367C
    nop
.L8006369C:
    bnez        $a1, .L80063758
    nop
.L800636A4:
    bnez        $s4, .L800636C4
    addiu       $s3, $s2, 0x10
    sll         $v0, $s5, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $s0, 0x49E0($at)
    j .L800636D8
    lui         $v0, 0x3B9A
.L800636C4:
    sll         $v0, $s5, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $s0, 0x49E8($at)
    lui         $v0, 0x3B9A
.L800636D8:
    ori         $v0, $v0, 0xCA00
    subu        $v1, $v0, $s3
    sltu        $v0, $v1, $s0
    bnel        $v0, $zero, .L800636EC
    addu        $s0, $v1, $zero
.L800636EC:
    addu        $a0, $s1, $zero
.L800636F0:
    jal         func_80064930
    addu        $a1, $s3, $s0
    addu        $a1, $v0, $zero
    bnez        $a1, .L80063724
    addu        $v1, $s3, $s0
    srl         $s0, $s0, 1
    sltiu       $v0, $s0, 0x32
    beqz        $v0, .L800636F0
    addu        $a0, $s1, $zero
    jal         func_800635A0
    addiu       $a1, $zero, 0x2
    j .L800636F0
    addu        $a0, $s1, $zero
.L80063724:
    lw          $v0, 0x48($s6)
    addu        $v0, $v0, $v1
    sw          $v0, 0x48($s6)
    addu        $v0, $s2, $s0
    sw          $zero, 0x0($a1)
    sw          $zero, 0x4($a1)
    bnez        $s4, .L80063754
    sw          $v0, 0x8($a1)
    sll         $v0, $s5, 2
    addu        $v0, $v0, $s6
    j .L80063758
    sw          $a1, 0x30($v0)
.L80063754:
    sw          $a1, 0x0($s4)
.L80063758:
    lw          $v1, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lw          $a0, 0x8($a1)
    addu        $v0, $v0, $v1
    addu        $v1, $v1, $s2
    subu        $a0, $a0, $s2
    sw          $v1, 0x4($a1)
    sw          $a0, 0x8($a1)
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end object_stream_initialize
