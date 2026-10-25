.text
.align 2
.set noreorder
.globl func_800A7AB0
.ent func_800A7AB0
func_800A7AB0:
    lui         $v0, 0x8008
    lw          $v0, 0x7A74($v0)
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    sw          $v1, 0x0($a1)
    negu        $v0, $v0
    lui         $at, 0x8008
    sw          $v0, 0x7A74($at)
    sw          $v1, 0x1C($a0)
    lui         $v0, 0x8008
    lw          $v0, 0x7A74($v0)
    sw          $v0, 0x20($a0)
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x4F30
    lw          $v0, 0x0($a2)
    lui         $v1, 0x8008
    lw          $v1, 0x4F34($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x793C($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x58E0($a1)
    addu        $s1, $zero, $zero
    negu        $v0, $v0
    negu        $v1, $v1
    negu        $a0, $a0
    negu        $a1, $a1
    sw          $v0, 0x0($a2)
    lui         $at, 0x8008
    sw          $v1, 0x4F34($at)
    lui         $at, 0x8008
    sw          $a0, 0x793C($at)
    lui         $at, 0x8009
    sw          $a1, -0x58E0($at)
.L800A7B34:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 4
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a0, 0x715C($at)
    lw          $v0, 0x1C($a0)
    negu        $v0, $v0
    sw          $v0, 0x1C($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a0, 0x715C($at)
    lw          $v0, 0x20($a0)
    negu        $v0, $v0
    sw          $v0, 0x20($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a0, 0x715C($at)
    lw          $v0, 0x2C($a0)
    negu        $v0, $v0
    sw          $v0, 0x2C($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a0, 0x715C($at)
    addiu       $v0, $s1, 0x1
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    lw          $v1, 0x30($a0)
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    negu        $v1, $v1
    bnez        $v0, .L800A7B34
    sw          $v1, 0x30($a0)
    jal         func_8009BA3C
    addu        $s1, $zero, $zero
    sll         $a0, $s1, 16
.L800A7BD4:
    sra         $a0, $a0, 12
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lw          $v1, 0xC40($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lw          $a1, 0xC44($at)
    addiu       $v0, $s1, 0x1
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    negu        $v1, $v1
    negu        $a1, $a1
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sw          $v1, 0xC40($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sw          $a1, 0xC44($at)
    bnez        $v0, .L800A7BD4
    sll         $a0, $s1, 16
    lui         $a0, 0x8009
    lw          $a0, -0x791C($a0)
    lw          $v0, 0x1C($a0)
    lw          $v1, 0x20($a0)
    lui         $a1, 0x8009
    lw          $a1, -0x7B80($a1)
    negu        $v0, $v0
    negu        $v1, $v1
    sw          $v0, 0x1C($a0)
    sw          $v1, 0x20($a0)
    lw          $v0, 0x1C($a1)
    lw          $v1, 0x20($a1)
    negu        $v0, $v0
    negu        $v1, $v1
    sw          $v0, 0x1C($a1)
    sw          $v1, 0x20($a1)
    lui         $v1, 0x8009
    lw          $v1, -0x49E0($v1)
    lw          $v0, 0x20($v1)
    negu        $v0, $v0
    sw          $v0, 0x20($v1)
    lui         $v1, 0x8009
    lw          $v1, -0x49DC($v1)
    lw          $v0, 0x20($v1)
    negu        $v0, $v0
    jal         func_800B9794
    sw          $v0, 0x20($v1)
    lui         $a0, 0x8008
    lw          $a0, 0x55F8($a0)
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x58DC
    jal         func_800E1914
    addu        $s1, $zero, $zero
    lui         $a1, 0x8008
    lw          $a1, 0x6178($a1)
    lui         $s3, 0x8007
    addiu       $s3, $s3, -0x5880
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2E4C
    nop
    sll         $v0, $s1, 16
.L800A7CD4:
    sra         $v0, $v0, 14
    addu        $s0, $v0, $s2
    lw          $v0, 0x0($s0)
    beql        $v0, $zero, .L800A7D50
    addiu       $v0, $s1, 0x1
    lw          $a0, 0x14($v0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800A7D14
    nop
    lw          $v0, 0x0($s0)
    lw          $a0, 0x14($v0)
    jal         func_8000C8DC
    nop
    j           func_800A3604
    sll         $v0, $s1, 16
.L800A7D14:
    lw          $v0, 0x0($s0)
    lw          $a0, 0x14($v0)
    jal         func_8000C8CC
    nop
    sll         $v0, $s1, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s2
    lw          $a0, 0x0($v0)
    lh          $v0, 0x2($a0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
    addiu       $v0, $s1, 0x1
.L800A7D50:
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    blez        $v0, .L800A7CD4
    sll         $v0, $s1, 16
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800A7AB0
