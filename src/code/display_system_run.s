.text
.align 2
.set noreorder
.globl display_system_run
.ent display_system_run
display_system_run:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    lui         $s3, 0x8008
    addiu       $s3, $s3, 0x6170
    sw          $s2, 0x18($sp)
    addiu       $s2, $zero, 0x2
    sw          $s1, 0x14($sp)
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0x55D8
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x7908
    sw          $ra, 0x20($sp)
.L8000BA08:
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A00
    addu        $a1, $zero, $zero
    jal         func_8004CDA8
    addiu       $a2, $zero, 0x1
    lui         $v0, 0x8009
    lhu         $v0, -0x6AEA($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s3
    sw          $s2, 0x0($v0)
    lui         $v0, 0x8009
    lhu         $v0, -0x6AEA($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x6AEA($v1)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    lw          $a0, 0x0($v0)
    xori        $v1, $v1, 0x1
    lui         $at, 0x8009
    sh          $v1, -0x6AEA($at)
    jal         func_8004EDA8
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x4F90($v0)
    ori         $v0, $v0, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x4F90($at)
    lui         $v0, 0x8009
    lhu         $v0, -0x6AEA($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    lw          $v0, 0x0($v0)
    beqz        $v0, .L8000BAB4
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x6AEA($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sw          $zero, 0x0($v0)
    lui         $a0, 0x8009
    lhu         $a0, -0x6AEA($a0)
    jal         func_8000BB98
    nop
.L8000BAB4:
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4C68
    addu        $a1, $zero, $zero
    jal         func_8004CDA8
    addiu       $a2, $zero, 0x1
    j .L8000BA08
    nop
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end display_system_run
