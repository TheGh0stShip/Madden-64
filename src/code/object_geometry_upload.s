.text
.align 2
.set noreorder
.globl object_geometry_upload
.ent object_geometry_upload
object_geometry_upload:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x18($sp)
    sw          $s0, 0x10($sp)
    lw          $v0, 0x10($s1)
    lw          $s0, 0x8($a0)
    beql        $v0, $zero, .L8000E6C8
    addu        $a0, $zero, $zero
    lw          $a2, 0x8($v0)
    or          $v0, $a2, $s0
    andi        $v0, $v0, 0x3
    beqz        $v0, .L8000E688
    addu        $a3, $s0, $zero
    addiu       $t0, $a2, 0x100
.L8000E634:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    lwl         $a0, 0x8($a2)
    lwr         $a0, 0xB($a2)
    lwl         $a1, 0xC($a2)
    lwr         $a1, 0xF($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a0, 0x8($a3)
    swr         $a0, 0xB($a3)
    swl         $a1, 0xC($a3)
    swr         $a1, 0xF($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8000E634
    addiu       $a3, $a3, 0x10
    j .L8000E6B8
    nop
.L8000E688:
    addiu       $t0, $a2, 0x100
.L8000E68C:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8000E68C
    addiu       $a3, $a3, 0x10
.L8000E6B8:
    lhu         $v0, 0xA8($s0)
    ori         $v0, $v0, 0x2
    j .L8000E6F4
    sh          $v0, 0xA8($s0)
.L8000E6C8:
    addu        $a1, $s0, $zero
    addiu       $a2, $zero, 0x100
    jal         func_80033308
    addu        $a3, $zero, $zero
    jal         func_8000E558
    addu        $a0, $s1, $zero
    sw          $v0, 0x4($s0)
    lhu         $v0, 0x0($s1)
    sh          $v0, 0x0($s0)
    lhu         $v0, 0x2($s1)
    sh          $v0, 0x2($s0)
.L8000E6F4:
    lw          $v1, 0x4($s0)
    lui         $v0, 0x2
    ori         $v0, $v0, 0x6666
    sw          $v0, 0xC4($s0)
    sw          $v0, 0xC8($s0)
    sw          $v0, 0xCC($s0)
    lhu         $v0, 0x4($v1)
    andi        $v0, $v0, 0x4
    beqz        $v0, .L8000E724
    nop
    lw          $v0, 0xC($s1)
    sw          $v0, 0x10($s0)
.L8000E724:
    lw          $v1, 0x4($s0)
    lhu         $v0, 0x4($v1)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L8000E770
    nop
    lw          $a0, 0x18($v1)
    sltu        $v0, $a0, $v1
    beqz        $v0, .L8000E74C
    addu        $v0, $v1, $a0
    sw          $v0, 0x18($v1)
.L8000E74C:
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x200
    lw          $v1, 0x4($s0)
    sw          $v0, 0xC($s0)
    lw          $a1, 0x18($v1)
    addu        $a0, $v0, $zero
    jal         func_8002E17C
    addiu       $a2, $zero, 0x200
.L8000E770:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_geometry_upload
