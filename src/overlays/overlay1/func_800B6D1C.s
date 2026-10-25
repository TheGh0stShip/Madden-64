.text
.align 2
.set noreorder
.globl func_800B6D1C
.ent func_800B6D1C
func_800B6D1C:
    jal         func_8000DC18
    nop
    lui         $at, 0x8007
    sh          $zero, 0x18EC($at)
.L800B6D2C:
    addu        $s0, $zero, $zero
    addu        $s1, $s3, $zero
.L800B6D34:
    lui         $v0, 0x8007
    lw          $v0, 0x18E8($v0)
    andi        $a0, $s2, 0xFFFF
    sll         $v1, $s0, 1
    addu        $v0, $s1, $v0
    addu        $v0, $v0, $v1
    lhu         $a2, 0x14($v0)
    andi        $a1, $s0, 0xFFFF
    jal         func_8003B9C0
    addiu       $s0, $s0, 0x1
    slti        $v0, $s0, 0xB
    bnez        $v0, .L800B6D34
    nop
    addiu       $s2, $s2, 0x1
    slti        $v0, $s2, 0x2
    bnez        $v0, .L800B6D2C
    addiu       $s3, $s3, 0x16
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    addiu       $a1, $zero, 0x5
    jal         func_8000D740
    addu        $a2, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x5D48($a0)
    addu        $a1, $v0, $zero
    lui         $at, 0x8007
    sw          $a1, 0x18F4($at)
    jal         func_80098164
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x7F70($v0)
    lhu         $a0, 0x206($v0)
    jal         func_800B67D4
    andi        $a0, $a0, 0x100
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a1, 0x800A
    addiu       $a1, $a1, 0x3164
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x5A20
    jal         func_8000CB78
    nop
    jal         func_8000BEE8
    addiu       $a0, $zero, 0x2
    andi        $v0, $s6, 0xFFFF
    bnez        $v0, .L800B6EA8
    nop
    lui         $s5, 0x8009
    addiu       $s5, $s5, -0x49E0
.L800B6DF8:
    jal         func_80030884
    nop
    lui         $a0, 0x8008
    lh          $a0, 0x7B5C($a0)
    jal         func_80030B54
    nop
    addu        $s0, $v0, $zero
    xor         $v0, $s0, $s2
    and         $s4, $v0, $s2
    nor         $v0, $zero, $s2
    and         $s1, $v0, $s0
    andi        $v0, $s1, 0x1000
    beqz        $v0, .L800B6E38
    addu        $s2, $s0, $zero
    jal         func_80011308
    addiu       $s6, $zero, 0x1
.L800B6E38:
    andi        $s3, $s6, 0xFFFF
    bnez        $s3, .L800B6E78
    nop
    lw          $a0, 0x0($s5)
    jal         func_800BF644
    nop
    lw          $a0, 0x4($s5)
    jal         func_800BF644
    nop
    addiu       $a0, $sp, 0x18
    andi        $a1, $s7, 0xFFFF
    addu        $a2, $s0, $zero
    addu        $a3, $s1, $zero
    jal         func_800B685C
    sw          $s4, 0x10($sp)
    addu        $s7, $v0, $zero
.L800B6E78:
    jal         func_800BCFBC
    nop
    jal         func_800B63B8
    nop
    jal         func_8000BF08
    nop
    jal         func_80030110
    nop
    jal         func_80030050
    nop
    beqz        $s3, .L800B6DF8
    nop
.L800B6EA8:
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5C18($v0)
    beqz        $v0, .L800B6EDC
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x5C18($v1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
.L800B6EDC:
    jal         func_8000BE80
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lw          $a1, 0x18($sp)
    jal         func_8000D998
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lw          $a1, 0x1C($sp)
    jal         func_8000D998
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lw          $a1, 0x20($sp)
    jal         func_8000D998
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lw          $a1, 0x24($sp)
    jal         func_8000D998
    nop
    jal         func_8000BEE8
    addiu       $a0, $zero, 0x1
    jal         func_800A6580
    nop
    andi        $v0, $v0, 0xFF
    addiu       $v1, $zero, 0x7
    bne         $v0, $v1, .L800B6F5C
    nop
    jal         func_8004519C
    nop
.L800B6F5C:
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    lui         $a1, 0x8007
    lw          $a1, 0x18F4($a1)
    jal         func_8000D998
    nop
    jal         func_800B49CC
    nop
    jal         func_800BCFBC
    nop
    jal         func_800BF1C8
    nop
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $zero, -0x5080($at)
    lui         $at, 0x8006
    sh          $v0, 0x4A72($at)
    lui         $at, 0x8007
    sh          $zero, 0x18E2($at)
    lw          $ra, 0x48($sp)
    lw          $s7, 0x44($sp)
    lw          $s6, 0x40($sp)
    lw          $s5, 0x3C($sp)
    lw          $s4, 0x38($sp)
    lw          $s3, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_800B6D1C
