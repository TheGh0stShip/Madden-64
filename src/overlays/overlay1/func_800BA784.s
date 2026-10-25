.text
.align 2
.set noreorder
.globl func_800BA784
.ent func_800BA784
func_800BA784:
    sll         $a0, $s0, 16
    lui         $a2, 0x8009
    lhu         $a2, -0x5A4C($a2)
    sra         $a0, $a0, 16
    addiu       $a1, $sp, 0x10
    jal         func_800B9274
    sll         $a2, $a2, 17
    lui         $a2, 0x8008
    lw          $a2, 0x794C($a2)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x14($sp)
    lw          $a1, 0x1C($a2)
    lw          $a0, 0x20($a2)
    addu        $s2, $a1, $v1
    addu        $s1, $a0, $v0
    lui         $v0, 0xFE70
    slt         $v0, $s2, $v0
    bnel        $v0, $zero, .L800BA7D0
    lui         $s2, 0xFE70
.L800BA7D0:
    lui         $v0, 0x190
    slt         $v0, $v0, $s2
    bnel        $v0, $zero, .L800BA7E0
    lui         $s2, 0x190
.L800BA7E0:
    lui         $v0, 0xFC40
    slt         $v0, $s1, $v0
    bnel        $v0, $zero, .L800BA7F0
    lui         $s1, 0xFC40
.L800BA7F0:
    lui         $v0, 0x3C0
    slt         $v0, $v0, $s1
    bnel        $v0, $zero, .L800BA800
    lui         $s1, 0x3C0
.L800BA800:
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    sw          $s2, 0x1C($a2)
    sw          $s1, 0x20($a2)
    lw          $v0, 0x1C($v1)
    subu        $a0, $s2, $v0
    bltzl       $a0, .L800BA820
    negu        $a0, $a0
.L800BA820:
    lw          $v0, 0x20($v1)
    subu        $v1, $s1, $v0
    bltzl       $v1, .L800BA830
    negu        $v1, $v1
.L800BA830:
    slt         $v0, $a0, $v1
    beqz        $v0, .L800BA84C
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j           func_800B6138
    addu        $v1, $v1, $v0
.L800BA84C:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $v1, $a0, $v0
    lui         $v0, 0x5
    ori         $v0, $v0, 0xFFFF
    slt         $v0, $v0, $v1
    bnez        $v0, .L800BA888
    addu        $s0, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x6178($a0)
    jal         func_800B6378
    nop
    j           func_800B6350
    nop
.L800BA888:
    lui         $s3, 0x5
    ori         $s3, $s3, 0xFFFF
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x5040
    addiu       $s4, $s5, 0x58
    sll         $v0, $s0, 16
.L800BA8A0:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s5
    lw          $v0, 0x0($v0)
    lw          $v1, 0x24($v0)
    lw          $v0, 0x1C($v1)
    subu        $a0, $s2, $v0
    bltzl       $a0, .L800BA8C0
    negu        $a0, $a0
.L800BA8C0:
    lw          $v0, 0x20($v1)
    subu        $v1, $s1, $v0
    bltzl       $v1, .L800BA8D0
    negu        $v1, $v1
.L800BA8D0:
    slt         $v0, $a0, $v1
    beqz        $v0, .L800BA8EC
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j           func_800B61D8
    addu        $v1, $v1, $v0
.L800BA8EC:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $v1, $a0, $v0
    slt         $v0, $s3, $v1
    beqz        $v0, .L800BAA10
    sll         $v0, $s0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s4
    lw          $v0, 0x0($v0)
    lw          $v1, 0x24($v0)
    lw          $v0, 0x1C($v1)
    subu        $a0, $s2, $v0
    bltzl       $a0, .L800BA928
    negu        $a0, $a0
.L800BA928:
    lw          $v0, 0x20($v1)
    subu        $v1, $s1, $v0
    bltzl       $v1, .L800BA938
    negu        $v1, $v1
.L800BA938:
    slt         $v0, $a0, $v1
    beqz        $v0, .L800BA954
    srl         $v0, $a0, 31
    addu        $v0, $a0, $v0
    sra         $v0, $v0, 1
    j           func_800B6240
    addu        $v1, $v1, $v0
.L800BA954:
    srl         $v0, $v1, 31
    addu        $v0, $v1, $v0
    sra         $v0, $v0, 1
    addu        $v1, $a0, $v0
    slt         $v0, $s3, $v1
    bnez        $v0, .L800BA9A4
    addiu       $v0, $s0, 0x1
    sll         $v0, $s0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s4
    lw          $v0, 0x0($v0)
    lw          $a0, 0x24($v0)
    lui         $at, 0x8008
    sh          $s0, 0x6BE0($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sh          $v0, 0x7988($at)
    jal         func_800B6378
    nop
    addiu       $v0, $s0, 0x1
.L800BA9A4:
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xB
    bnez        $v0, .L800BA8A0
    sll         $v0, $s0, 16
    j           func_800B6350
    nop
    sra         $a0, $a0, 16
    lw          $v0, 0x14($v1)
    addiu       $a1, $sp, 0x10
    lui         $a2, 0x8
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    jal         func_800B9274
    sw          $v1, 0x0($a3)
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    lw          $v1, 0x10($sp)
    lw          $v0, 0x1C($a0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x1C($a0)
    lw          $v0, 0x20($a0)
    lw          $v1, 0x14($sp)
    addu        $v0, $v0, $v1
    j           func_800B6350
    sw          $v0, 0x20($a0)
.L800BAA10:
    sra         $v0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x5040($at)
    lw          $a0, 0x24($v0)
    lui         $at, 0x8008
    sh          $zero, 0x7988($at)
    lui         $at, 0x8008
    sh          $s0, 0x6BE0($at)
    jal         func_800B6378
    nop
    j           func_800B6350
    nop
.end func_800BA784
