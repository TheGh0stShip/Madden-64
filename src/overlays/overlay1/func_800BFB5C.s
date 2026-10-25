.text
.align 2
.set noreorder
.globl func_800BFB5C
.ent func_800BFB5C
func_800BFB5C:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x20($sp)
    addu        $s0, $a0, $zero
    lui         $v1, 0x100
    sw          $ra, 0x2C($sp)
    sw          $s2, 0x28($sp)
    and         $v0, $v0, $v1
    beqz        $v0, .L800BFB9C
    sw          $s1, 0x24($sp)
    lhu         $v1, 0x28($s0)
    addu        $v0, $zero, $zero
    andi        $v1, $v1, 0xFFFE
    j           func_800BB5F4
    sh          $v1, 0x28($s0)
.L800BFB9C:
    jal         func_800BD694
    addu        $a0, $s0, $zero
    lbu         $v1, 0x21($s0)
    andi        $a0, $v1, 0xBF
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lb          $v1, -0x4D58($at)
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lw          $s2, 0x2720($at)
    lw          $v1, 0x8($s2)
    addu        $s1, $v0, $zero
    and         $v1, $s1, $v1
    beqz        $v1, .L800BFBEC
    nop
    jal         func_800BD734
    nop
    j           func_800BB5F4
    addu        $v0, $zero, $zero
.L800BFBEC:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    bnez        $v0, .L800BFC10
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    beq         $v1, $v0, .L800BFD18
    addu        $v0, $zero, $zero
.L800BFC10:
    lhu         $v0, 0x28($s0)
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800BFD18
    addu        $v0, $zero, $zero
    jal         func_800BBB18
    addu        $a0, $s0, $zero
    sltu        $v1, $zero, $s1
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    nor         $v0, $zero, $v0
    sltu        $v0, $zero, $v0
    or          $v1, $v1, $v0
    beqz        $v1, .L800BFD18
    addu        $v0, $zero, $zero
    lw          $v0, 0x24($s0)
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    lw          $v1, 0x20($v0)
    lw          $a0, 0x20($a0)
    lui         $v0, 0xBF
    ori         $v0, $v0, 0xFFFF
    subu        $v1, $v1, $a0
    slt         $v0, $v0, $v1
    bnez        $v0, .L800BFD18
    addu        $v0, $zero, $zero
    lw          $v0, 0x0($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BFC94
    nop
    jal         func_800C9418
    addu        $a0, $s0, $zero
    j           func_800BB5F4
    addu        $v0, $zero, $zero
.L800BFC94:
    lw          $v0, 0xC($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BFCB4
    addu        $a0, $s0, $zero
    jal         func_800C9778
    addiu       $a1, $zero, 0x1
    j           func_800BB5F4
    addu        $v0, $zero, $zero
.L800BFCB4:
    lw          $v0, 0x4($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BFCE0
    addiu       $v0, $zero, 0x1F
    jal         func_800C157C
    sb          $v0, 0x10($sp)
    srl         $v0, $v0, 4
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x10
    j           func_800BB5E8
    sb          $v0, 0x11($sp)
.L800BFCE0:
    lw          $v0, 0x10($s2)
    and         $v0, $s1, $v0
    beqz        $v0, .L800BFD14
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0x30
    jal         func_800C157C
    sb          $v0, 0x18($sp)
    srl         $v0, $v0, 4
    addu        $a0, $s0, $zero
    addiu       $a1, $sp, 0x18
    sb          $v0, 0x19($sp)
    jal         func_800E1BCC
    nop
.L800BFD14:
    addu        $v0, $zero, $zero
.L800BFD18:
    lw          $ra, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800BFB5C
