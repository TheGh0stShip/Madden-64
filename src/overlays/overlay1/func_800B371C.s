.text
.align 2
.set noreorder
.globl func_800B371C
.ent func_800B371C
func_800B371C:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a2, $zero
    sw          $s1, 0x14($sp)
    lui         $s1, 0x8007
    addiu       $s1, $s1, -0x4688
    sw          $ra, 0x20($sp)
    bnez        $a3, .L800B3780
    sw          $zero, 0x0($s1)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    jal         func_800363F4
    addiu       $a1, $v0, 0x2
    jal         func_800AE680
    nop
    addu        $a3, $v0, $zero
.L800B3780:
    sll         $v1, $s0, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x2DCC($at)
    lui         $at, 0x8007
    sw          $a3, -0x468C($at)
    lui         $at, 0x8007
    sw          $zero, -0x467C($at)
    lui         $at, 0x8007
    sw          $zero, -0x4680($at)
    lui         $at, 0x8007
    sw          $zero, -0x4684($at)
    sw          $zero, 0x0($s1)
    lui         $at, 0x8007
    sw          $v0, -0x4690($at)
    jal         func_8001AEA8
    addiu       $a0, $s1, -0x10
    sll         $a0, $s2, 16
    sra         $a0, $a0, 16
    addu        $a1, $s3, $zero
    jal         func_800AACE8
    addiu       $a2, $zero, 0x3
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800B371C
