.text
.align 2
.set noreorder
.globl func_800A13F8
.ent func_800A13F8
func_800A13F8:
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    addiu       $sp, $sp, -0x28
    addiu       $v0, $zero, 0x17
    sw          $ra, 0x20($sp)
    lui         $at, 0x8008
    sb          $v0, 0x7AB0($at)
    lh          $v0, 0x1C($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB2($at)
    lh          $v0, 0x20($v1)
    lui         $at, 0x8008
    sh          $v0, 0x7AB4($at)
    jal         func_800C5F80
    nop
    jal         func_8003CBC8
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A1460
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bnez        $v0, .L800A1460
    nop
    jal         menu_sound_play
    addiu       $a0, $zero, 0x3
.L800A1460:
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
    addiu       $a0, $zero, 0x2D
    jal         func_8009CA5C
    addiu       $a1, $zero, 0xD2
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x80
    ori         $v1, $v1, 0x1
    and         $v0, $v0, $v1
    bnez        $v0, .L800A16C0
    lui         $v1, 0x1C0
    lui         $a1, 0x8008
    lw          $a1, 0x6178($a1)
    lw          $a0, 0x1C($a1)
    lui         $v0, 0x380
    addu        $v1, $a0, $v1
    sltu        $v0, $v0, $v1
    beqz        $v0, .L800A14E4
    lui         $v1, 0x4
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    bnez        $v0, .L800A16C0
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bnez        $v0, .L800A16C0
    addiu       $a0, $zero, 0x11
    j           func_8009CF94
    addiu       $a1, $zero, 0x19
.L800A14DC:
    j           func_8009CED8
    addu        $t1, $zero, $zero
.L800A14E4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    beqz        $v0, .L800A1618
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x4CD0($v1)
    beqz        $v1, .L800A16C0
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bnez        $v0, .L800A16C0
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x78EC($a0)
    beqz        $a0, .L800A16C0
    nop
    lhu         $v0, 0x28($v1)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800A1610
    addiu       $t1, $zero, 0x1
    addu        $a3, $zero, $zero
    addu        $t0, $a0, $zero
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    lui         $t2, 0x30
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5040
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    addu        $a2, $v1, $a0
.L800A156C:
    lw          $v0, 0x0($a2)
    lw          $v0, 0x24($v0)
    lw          $v1, 0x24($t0)
    lw          $a0, 0x1C($v0)
    lw          $v0, 0x1C($v1)
    subu        $a0, $a0, $v0
    sw          $a0, 0x10($sp)
    lw          $v0, 0x0($a2)
    lw          $v0, 0x24($v0)
    lw          $v1, 0x24($t0)
    lw          $a1, 0x20($v0)
    lw          $v0, 0x20($v1)
    subu        $v0, $a1, $v0
    bgez        $a0, .L800A15AC
    sw          $v0, 0x14($sp)
    negu        $a0, $a0
.L800A15AC:
    addu        $a1, $v0, $zero
    bltzl       $a1, .L800A15B8
    negu        $a1, $a1
.L800A15B8:
    slt         $v0, $a0, $a1
    beqz        $v0, .L800A15D4
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j           func_8009CEC0
    addu        $a0, $a1, $v0
.L800A15D4:
    srl         $v0, $a1, 31
    addu        $v0, $a1, $v0
    sra         $v0, $v0, 1
    addu        $a0, $a0, $v0
    sltu        $v0, $t2, $a0
    beqz        $v0, .L800A14DC
    addiu       $a3, $a3, 0x1
    slti        $v0, $a3, 0xB
    bnez        $v0, .L800A156C
    addiu       $a2, $a2, 0x4
    addiu       $v0, $zero, 0x1
    bne         $t1, $v0, .L800A16C0
    addiu       $a0, $zero, 0x12
    j           func_8009CF94
    addiu       $a1, $zero, 0x1E
.L800A1610:
    j           func_8009CF90
    addiu       $a0, $zero, 0x10
.L800A1618:
    lui         $v1, 0x8009
    lw          $v1, -0x78EC($v1)
    beqz        $v1, .L800A16C0
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bnez        $v0, .L800A16C0
    nop
    lw          $v0, 0x24($v1)
    lw          $v0, 0x1C($v0)
    subu        $v0, $a0, $v0
    sw          $v0, 0x10($sp)
    lw          $v1, 0x24($v1)
    lw          $a0, 0x20($a1)
    lw          $v1, 0x20($v1)
    addu        $a1, $v0, $zero
    subu        $v0, $a0, $v1
    bgez        $a1, .L800A1668
    sw          $v0, 0x14($sp)
    negu        $a1, $a1
.L800A1668:
    addu        $a0, $v0, $zero
    bltzl       $a0, .L800A1674
    negu        $a0, $a0
.L800A1674:
    slt         $v0, $a1, $a0
    beqz        $v0, .L800A1690
    srl         $v0, $a1, 31
    addu        $v0, $a1, $v0
    sra         $v0, $v0, 1
    j           func_8009CF7C
    addu        $a0, $a0, $v0
.L800A1690:
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    addu        $a0, $a1, $v0
    lui         $v0, 0x4F
    ori         $v0, $v0, 0xFFFF
    sltu        $v0, $v0, $a0
    beqz        $v0, .L800A16C0
    addiu       $a0, $zero, 0xF
    addiu       $a1, $zero, 0x1E
    jal         func_80041BDC
    nop
.L800A16C0:
    lw          $ra, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A13F8
