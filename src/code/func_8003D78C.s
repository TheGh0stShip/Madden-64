.text
.align 2
.set noreorder
.globl func_8003D78C
.ent func_8003D78C
func_8003D78C:
    lui         $v0, 0x8006
    lw          $v0, 0x4A00($v0)
    addiu       $sp, $sp, -0x28
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    beqz        $v0, .L8003D8A0
    sw          $s0, 0x10($sp)
    lui         $v1, 0x8007
    lw          $v1, 0x34F8($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L8003D854
    addiu       $s2, $zero, -0x1
.L8003D7C4:
    lui         $v1, 0x8008
    lw          $v1, 0x7B6C($v1)
    lw          $v0, 0x18($v1)
    andi        $v0, $v0, 0x5
    beqz        $v0, .L8003D83C
    nop
    lw          $s0, 0x0($v1)
    addiu       $s0, $s0, -0x3
    nor         $v0, $zero, $s0
    sra         $v0, $v0, 31
    and         $s0, $s0, $v0
    sw          $s0, 0x4($v1)
    lw          $v0, 0x4($v1)
    sw          $v0, 0x0($v1)
    jal         func_80004B40
    nop
    addu        $s1, $v0, $zero
.L8003D808:
    jal         func_80004B40
    nop
    beq         $s1, $v0, .L8003D808
    nop
    bnez        $s0, .L8003D844
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x7B6C($v1)
    lw          $v0, 0x18($v1)
    ori         $v0, $v0, 0x8
    sw          $v0, 0x18($v1)
    j .L8003D844
    nop
.L8003D83C:
    lui         $at, 0x8007
    sw          $s2, 0x34F8($at)
.L8003D844:
    lui         $v0, 0x8007
    lw          $v0, 0x34F8($v0)
    bne         $v0, $s2, .L8003D7C4
    nop
.L8003D854:
    addiu       $s1, $zero, 0x1
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x4F64
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x79F8
.L8003D868:
    lw          $v0, 0x0($s0)
    beqz        $v0, .L8003D888
    addu        $s3, $s1, $zero
    addu        $a0, $s2, $zero
    addu        $a1, $zero, $zero
    jal         func_8004CDA8
    addiu       $a2, $zero, 0x1
    sw          $zero, 0x0($s0)
.L8003D888:
    addiu       $s0, $s0, -0x4
    addiu       $s2, $s2, -0x18
    bnez        $s3, .L8003D868
    addiu       $s1, $s1, -0x1
    lui         $at, 0x8007
    sw          $zero, 0x12C8($at)
.L8003D8A0:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_8003D78C
