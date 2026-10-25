.text
.align 2
.set noreorder
.globl func_800BA348
.ent func_800BA348
func_800BA348:
    lui         $v0, 0x8007
    lw          $v0, 0x18E8($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x7AC4($v1)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lhu         $v0, 0x8($v0)
    bne         $v1, $v0, .L800BA388
    addiu       $s1, $zero, 0x1
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x5080($at)
    j           func_800B5D70
    nop
.L800BA388:
    addiu       $s0, $zero, 0x64
.L800BA38C:
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    jal         func_800B5DA8
    nop
    lui         $at, 0x8008
    sh          $v0, 0x7AC4($at)
    jal         func_800B74FC
    nop
    lui         $v1, 0x8007
    lw          $v1, 0x18E8($v1)
    lui         $a1, 0x8008
    lhu         $a1, 0x7AC4($a1)
    lhu         $v0, 0x8($v1)
    andi        $a0, $a1, 0xFFFF
    bne         $a0, $v0, .L800BA3DC
    sll         $v0, $a0, 4
    lui         $at, 0x8009
    sh          $s1, -0x5080($at)
    lui         $at, 0x8009
    sh          $s0, -0x502E($at)
.L800BA3DC:
    addu        $v0, $v1, $v0
    lw          $v0, 0x48($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x502E($v1)
    srl         $v0, $v0, 7
    andi        $v0, $v0, 0xF
    addu        $v1, $v1, $v0
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $at, 0x8009
    sh          $v1, -0x502E($at)
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    sll         $v0, $v0, 1
    slt         $v0, $v0, $v1
    beqz        $v0, .L800BA38C
    andi        $v0, $a0, 0x7
    lui         $at, 0x8009
    sh          $zero, -0x502E($at)
    bnez        $v0, .L800BA440
    addu        $s0, $v0, $zero
    jal         func_800B5028
    nop
    j           func_800B5D70
    nop
.L800BA440:
    subu        $v0, $a1, $v0
    lui         $at, 0x8008
    sh          $v0, 0x7AC4($at)
    andi        $v0, $s0, 0xFFFF
    beqz        $v0, .L800BA494
    nop
.L800BA458:
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    jal         func_800B5028
    addiu       $s0, $s0, -0x1
    lui         $a0, 0x8008
    lhu         $a0, 0x7AC4($a0)
    jal         func_800B5D88
    nop
    lui         $at, 0x8008
    sh          $v0, 0x7AC4($at)
    jal         func_800B74FC
    nop
    andi        $v0, $s0, 0xFFFF
    bnez        $v0, .L800BA458
    nop
.L800BA494:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800BA348
