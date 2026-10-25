.text
.align 2
.set noreorder
.globl func_800AD78C
.ent func_800AD78C
func_800AD78C:
    addiu       $v0, $v0, -0x5EAC
    addu        $a1, $a1, $v0
    lhu         $v1, 0x0($a1)
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L800AD7B0
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x0($a1)
    jal         func_800A9330
    addiu       $a1, $zero, 0x2
.L800AD7B0:
    jal         func_80031A1C
    addiu       $a0, $zero, 0x20
    addiu       $v0, $v0, 0x7
    sh          $v0, 0x0($s0)
    andi        $s2, $s3, 0xFFFF
.L800AD7C4:
    sll         $s0, $s2, 2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $s1, -0x5EC4($at)
    lhu         $v0, 0x0($s1)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    addiu       $v0, $v0, 0x1
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s1
    lhu         $a0, 0x0($v0)
    sll         $v1, $s2, 1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    sh          $a0, -0x5ED8($at)
    lhu         $v0, 0x0($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $s1, -0x49CC($at)
    lui         $v0, 0x8008
    addiu       $v0, $v0, -0x5EE0
    addu        $s0, $s0, $v0
    lw          $v0, 0x0($s0)
    beql        $v0, $s1, .L800AD7C4
    andi        $s2, $s3, 0xFFFF
    sw          $s1, 0x0($s0)
    lhu         $a0, 0x0($s1)
    addiu       $a0, $a0, -0x2
    jal         func_80031A1C
    andi        $a0, $a0, 0xFFFF
    andi        $a0, $v0, 0xFFFF
    jal         func_800A84E0
    addu        $a1, $s2, $zero
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800AD78C
