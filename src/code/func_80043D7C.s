.text
.align 2
.set noreorder
.globl func_80043D7C
.ent func_80043D7C
func_80043D7C:
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    lui         $v0, 0x8008
    lw          $v0, -0x5A9C($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    addu        $a0, $a1, $zero
    beq         $v0, $v1, .L80043E0C
    sw          $ra, 0x14($sp)
    lui         $a1, 0x8004
    addiu       $a1, $a1, 0x2A04
    addu        $a2, $s0, $zero
    jal         func_80008F30
    addiu       $a3, $zero, 0xC8
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v1, -0x5AA8($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, -0x5668($at)
    lui         $at, 0x8008
    sw          $v1, -0x5AA0($at)
    lui         $at, 0x8008
    sw          $v0, -0x5660($at)
    jal         func_8004291C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $at, 0x8008
    sw          $zero, -0x564C($at)
    lui         $at, 0x8008
    sw          $v0, -0x5A9C($at)
.L80043E0C:
    jal         func_800B2240
    nop
    sll         $v0, $v0, 16
    beqz        $v0, .L80043E30
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x4C98($v1)
    j .L80043E54
    nop
.L80043E30:
    lui         $v1, 0x8009
    lw          $v1, -0x5FA8($v1)
    bnez        $v1, .L80043E54
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x5FAC($v1)
    sltu        $v0, $zero, $v1
    negu        $v0, $v0
    and         $v1, $v1, $v0
.L80043E54:
    lw          $a1, 0x10($s0)
    addu        $a0, $s0, $zero
    xor         $a1, $a1, $v1
    jal         func_80043B20
    sltiu       $a1, $a1, 0x1
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80043D7C
