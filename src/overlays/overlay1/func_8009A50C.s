.text
.align 2
.set noreorder
.globl func_8009A50C
.ent func_8009A50C
func_8009A50C:
    lw          $v0, -0x7BAC($v0)
    lw          $a1, 0x64($s0)
    beq         $v0, $a1, .L8009A530
    nop
    jal         func_80009310
    addu        $a0, $zero, $zero
    lw          $v0, 0x64($s0)
    lui         $at, 0x8008
    sw          $v0, -0x7BAC($at)
.L8009A530:
    lui         $v1, 0x8008
    lw          $v1, -0x7BB0($v1)
    lw          $v0, 0x54($s0)
    beq         $v1, $v0, .L8009A5FC
    addiu       $v0, $zero, 0x2
    lhu         $a2, 0x5C($s0)
    lhu         $a3, 0x5E($s0)
    sw          $zero, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    lw          $a0, 0x54($s0)
    jal         func_8000979C
    addiu       $a1, $zero, 0x2
    j           func_80095ECC
    nop
    lui         $v0, 0x8008
    lw          $v0, -0x7BAC($v0)
    lw          $a0, 0x64($s0)
    beq         $v0, $a0, .L8009A5A4
    nop
    jal         func_800093F4
    nop
    lw          $v0, 0x64($s0)
    lui         $at, 0x8008
    sw          $v0, -0x7BAC($at)
.L8009A5A4:
    lui         $v1, 0x8008
    lw          $v1, -0x7BB0($v1)
    lw          $v0, 0x54($s0)
    beq         $v1, $v0, .L8009A5FC
    addiu       $v0, $zero, 0x2
    lhu         $a3, 0x5A($s0)
    lhu         $v1, 0x5E($s0)
    sw          $zero, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $v0, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    sw          $v1, 0x10($sp)
    lw          $a0, 0x54($s0)
    addiu       $a1, $zero, 0x2
    jal         func_800094D0
    addiu       $a2, $zero, 0x1
    lw          $v0, 0x54($s0)
    lui         $at, 0x8008
    sw          $v0, -0x7BB0($at)
.L8009A5FC:
    lui         $a1, 0x8008
    lw          $a1, 0x4F5C($a1)
    andi        $v1, $s7, 0xFFF
    sll         $v1, $v1, 12
    lui         $a0, 0xE400
    addiu       $v0, $a1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    andi        $v0, $fp, 0xFFF
    or          $v0, $v0, $a0
    or          $v1, $v1, $v0
    andi        $v0, $s4, 0xFFF
    sll         $v0, $v0, 12
    sw          $v1, 0x0($a1)
    andi        $v1, $s2, 0xFFF
    or          $v0, $v0, $v1
    sw          $v0, 0x4($a1)
    addiu       $v0, $a1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB400
    sw          $v0, 0x8($a1)
    sll         $v0, $s3, 16
    andi        $v1, $s6, 0xFFFF
    or          $v0, $v0, $v1
    sw          $v0, 0xC($a1)
    addiu       $v0, $a1, 0x18
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB300
    sw          $v0, 0x10($a1)
    sll         $v0, $s1, 16
    andi        $v1, $s5, 0xFFFF
    or          $v0, $v0, $v1
    sw          $v0, 0x14($a1)
    lw          $ra, 0x9C($sp)
    lw          $fp, 0x98($sp)
    lw          $s7, 0x94($sp)
    lw          $s6, 0x90($sp)
    lw          $s5, 0x8C($sp)
    lw          $s4, 0x88($sp)
    lw          $s3, 0x84($sp)
    lw          $s2, 0x80($sp)
    lw          $s1, 0x7C($sp)
    lw          $s0, 0x78($sp)
    addiu       $sp, $sp, 0xA0
    jr          $ra
    nop
.end func_8009A50C
