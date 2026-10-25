.text
.align 2
.set noreorder
.globl func_800ABD44
.ent func_800ABD44
func_800ABD44:
    addu        $at, $at, $a2
    sh          $a3, -0x5ED8($at)
    jal         func_800A9330
    addiu       $a1, $zero, 0x1
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    addiu       $v1, $zero, 0x40
    andi        $v0, $v0, 0xC0
    bne         $v0, $v1, .L800ABDE0
    addu        $a0, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, -0x5F00($a0)
    addu        $v0, $s0, $s1
    sll         $v0, $v0, 3
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, 0x2E04($at)
    lui         $at, 0x8007
    sw          $v0, -0x4820($at)
    jal         func_8001EC20
    addiu       $a1, $zero, 0x6
    j           func_800A76BC
    addu        $a0, $zero, $zero
    sll         $v0, $a3, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x49CC($at)
    addu        $a0, $t0, $zero
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sh          $a3, -0x5ED8($at)
    sw          $v0, 0x0($t1)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $a2
    sh          $v0, -0x5EAC($at)
    jal         func_800A9330
    addiu       $a1, $zero, 0x2
    addu        $a0, $zero, $zero
.L800ABDE0:
    jal         func_800A84E0
    andi        $a1, $s2, 0xFFFF
    jal         func_800A9F70
    nop
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800ABD44
