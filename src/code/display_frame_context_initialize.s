.text
.align 2
.set noreorder
.globl display_frame_context_initialize
.ent display_frame_context_initialize
display_frame_context_initialize:
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    sw          $v0, 0x5294($at)
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x14($sp)
    sw          $s0, 0x10($sp)
    xori        $v1, $v1, 0x1
    lui         $at, 0x8009
    sh          $v1, -0x502C($at)
    sltiu       $v0, $v0, 0x3
    bnez        $v0, .L8000BF64
    sll         $v0, $v1, 2
    lui         $at, 0x8008
    sw          $zero, 0x5294($at)
    sll         $v0, $v1, 2
.L8000BF64:
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v0, -0x4CB0($at)
    lui         $v1, 0x8008
    lw          $v1, 0xA78($v1)
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x4C30
    lui         $at, 0x8009
    sw          $s0, -0x49AC($at)
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sw          $v0, -0x6B8C($at)
    jal         func_80008FA0
    nop
    addu        $a0, $zero, $zero
    jal         func_8000B184
    addu        $a1, $zero, $zero
    beqz        $s0, .L8000C074
    nop
.L8000BFB8:
    lhu         $v0, 0x206($s0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L8000C060
    addu        $a0, $s0, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    jal         func_8000C260
    sw          $v1, 0x208($v0)
    lw          $v0, 0x238($s0)
    beqz        $v0, .L8000C024
    nop
    jal         func_80008F20
    nop
    lw          $a0, 0x23C($s0)
    jal         func_80008E6C
    nop
    lw          $a0, 0x238($s0)
    lw          $a1, 0x23C($s0)
    jal         func_8000DB20
    nop
    lw          $a0, 0x23C($s0)
    jal         func_80008EA0
    nop
.L8000C024:
    lhu         $v0, 0x206($s0)
    andi        $v0, $v0, 0x400
    beqz        $v0, .L8000C03C
    nop
    jal         func_8000CFA4
    addu        $a0, $s0, $zero
.L8000C03C:
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $a0, 0x208($v0)
    subu        $v1, $v1, $a0
    sw          $v1, 0x210($v0)
.L8000C060:
    lw          $s0, 0x0($s0)
    lui         $at, 0x8009
    sw          $s0, -0x49AC($at)
    bnez        $s0, .L8000BFB8
    nop
.L8000C074:
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    lui         $v0, 0xE900
    sw          $v0, 0x0($v1)
    lui         $v0, 0xB800
    addiu       $a1, $v1, 0x10
    sll         $a0, $a0, 2
    sw          $v0, 0x8($v1)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x6170
    sw          $zero, 0x4($v1)
    sw          $zero, 0xC($v1)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sw          $a1, 0x7A88($at)
    addu        $a0, $a0, $v0
    lw          $v0, 0x0($a0)
    addiu       $v1, $v1, 0x8
    lui         $at, 0x8008
    sw          $v1, 0x4F5C($at)
    lui         $at, 0x8008
    sw          $a1, 0x4F5C($at)
    beqz        $v0, .L8000C0E8
    nop
.L8000C0DC:
    lw          $v0, 0x0($a0)
    bnez        $v0, .L8000C0DC
    nop
.L8000C0E8:
    lui         $v0, 0x8008
    lw          $v0, 0x5294($v0)
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    sll         $v0, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x5F98($at)
    sll         $v0, $a0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    sw          $v1, 0x55D8($at)
    jal         func_8000BAF0
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x7908
    xori        $v0, $v0, 0x1
    sll         $v0, $v0, 2
    addu        $v1, $v0, $v1
    lw          $a0, 0x0($v1)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x6170
    addu        $v0, $v0, $v1
    lw          $v1, 0x0($v0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8000C164
    nop
.L8000C15C:
    beqz        $a0, .L8000C1A8
    nop
.L8000C164:
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x7908
    xori        $v0, $v0, 0x1
    sll         $v0, $v0, 2
    addu        $v1, $v0, $v1
    lw          $a0, 0x0($v1)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x6170
    addu        $v0, $v0, $v1
    lw          $v1, 0x0($v0)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L8000C15C
    nop
    j .L8000C164
    nop
.L8000C1A8:
    lui         $a0, 0x8009
    lw          $a0, -0x79E0($a0)
    lui         $v0, 0x8009
    lw          $v0, -0x49C8($v0)
    subu        $v0, $a0, $v0
    lui         $at, 0x8009
    sh          $v0, -0x5A4C($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $v1, 0x8007
    lhu         $v1, 0x130C($v1)
    sltu        $v0, $v0, $v1
    bnez        $v0, .L8000C1A8
    nop
    lui         $at, 0x8009
    sw          $a0, -0x49C8($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    sltiu       $v0, $v0, 0x10
    bnez        $v0, .L8000C204
    addiu       $v0, $zero, 0xF
    lui         $at, 0x8009
    sh          $v0, -0x5A4C($at)
.L8000C204:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    bnez        $v0, .L8000C21C
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x5A4C($at)
.L8000C21C:
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    jal         func_8000D684
    nop
    jal         func_80033484
    nop
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    jal         func_8000D5BC
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x6CE4($at)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end display_frame_context_initialize
