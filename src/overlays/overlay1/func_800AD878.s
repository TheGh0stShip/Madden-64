.text
.align 2
.set noreorder
.globl func_800AD878
.ent func_800AD878
func_800AD878:
    lui         $v1, 0x8007
    lhu         $v1, -0x4858($v1)
    addiu       $sp, $sp, -0x28
    addiu       $v0, $zero, 0x3
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    beq         $v1, $v0, .L800AD908
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4AA8
    lui         $at, 0x8008
    sw          $v0, -0x5EC4($at)
    lui         $at, 0x8008
    sw          $v0, -0x5EE0($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4AC8
    lui         $at, 0x8008
    sw          $v0, -0x5EC0($at)
    lui         $at, 0x8008
    sw          $v0, -0x5EDC($at)
    addiu       $v0, $zero, 0x5A
    lui         $at, 0x8008
    sh          $v0, -0x5EA0($at)
    addiu       $v0, $zero, 0x35
    lui         $at, 0x8008
    sh          $zero, -0x5EB6($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EB8($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EAA($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EAC($at)
    lui         $at, 0x8007
    sb          $v0, -0x483C($at)
.L800AD908:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800AD934
    nop
    lui         $v0, 0x8008
    lhu         $v0, -0x5EA8($v0)
    lui         $v1, 0x8008
    lhu         $v1, -0x5EA6($v1)
    j           func_800A9220
    nop
.L800AD934:
    lui         $v0, 0x8008
    lhu         $v0, -0x5EA6($v0)
    lui         $v1, 0x8008
    lhu         $v1, -0x5EA8($v1)
    lui         $at, 0x8007
    sh          $v0, -0x4848($at)
    lui         $at, 0x8007
    sh          $v1, -0x4846($at)
    lui         $a0, 0x8007
    lw          $a0, -0x477C($a0)
    lui         $a1, 0x8007
    lw          $a1, -0x4774($a1)
    jal         func_8000D874
    addu        $s3, $zero, $zero
    jal         func_8000BF08
    nop
    lui         $a0, 0x8007
    lw          $a0, -0x4774($a0)
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x7928
    jal         func_8000DA98
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x6D70
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5BF0
    jal         func_8000D684
    nop
    addu        $a0, $zero, $zero
.L800AD9B0:
    lw          $a1, 0x0($s0)
    addiu       $s0, $s0, 0x4
    jal         func_80032F3C
    addiu       $s3, $s3, 0x1
    lw          $a1, 0x0($s1)
    addu        $a0, $zero, $zero
    jal         func_80032F3C
    addiu       $s1, $s1, 0x4
    lw          $a1, 0x0($s2)
    addu        $a0, $zero, $zero
    jal         func_80032F3C
    addiu       $s2, $s2, 0x4
    sltiu       $v0, $s3, 0x2
    bnez        $v0, .L800AD9B0
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    lw          $a1, 0xC8C($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    lw          $a1, 0x61C0($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $zero, -0x5EF4($at)
    lui         $at, 0x8008
    sw          $zero, -0x5EF8($at)
    lui         $at, 0x8008
    sw          $zero, -0x5EEC($at)
    lui         $at, 0x8008
    sw          $zero, -0x5EF0($at)
    lui         $at, 0x8008
    sh          $zero, -0x5E98($at)
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800AD878
