.text
.align 2
.set noreorder
.globl func_800A0970
.ent func_800A0970
func_800A0970:
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x200
    beqz        $v0, .L800A0A38
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    beqz        $v0, .L800A0A38
    addu        $a1, $v0, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x6D58($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $a0, $v0, $v1
    sll         $v0, $a0, 16
    lui         $at, 0x8009
    sh          $a0, -0x6D58($at)
    bgez        $v0, .L800A0A38
    addiu       $v1, $a1, -0x1
    lui         $v0, 0x8008
    lhu         $v0, 0x5288($v0)
    lui         $at, 0x8008
    sh          $v1, 0x7AAC($at)
    sll         $v1, $v1, 16
    addu        $v0, $a0, $v0
    lui         $at, 0x8009
    sh          $v0, -0x6D58($at)
    bnez        $v1, .L800A09F0
    nop
    jal         func_8009BD04
    addiu       $a0, $zero, 0x3
.L800A09F0:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lhu         $v0, 0x2D38($at)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $v0, 0x2D38($at)
.L800A0A38:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x400
    beqz        $v0, .L800A0AC0
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x7B5E($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $a0, $v0, $v1
    sll         $v0, $a0, 16
    lui         $at, 0x8008
    sh          $a0, 0x7B5E($at)
    bgez        $v0, .L800A0AC0
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x5288($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x7758($v1)
    addu        $v0, $a0, $v0
    addiu       $v1, $v1, -0x1
    lui         $at, 0x8008
    sh          $v1, 0x7758($at)
    sll         $v1, $v1, 16
    lui         $at, 0x8008
    sh          $v0, 0x7B5E($at)
    bnez        $v1, .L800A0AC0
    nop
    jal         func_8009C9E8
    nop
    lui         $at, 0x8008
    sh          $zero, 0x7758($at)
    jal         func_80020A68
    nop
.L800A0AC0:
    lw          $ra, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x58
    jr          $ra
    nop
.end func_800A0970
