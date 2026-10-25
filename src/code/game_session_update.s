.text
.align 2
.set noreorder
.globl game_session_update
.ent game_session_update
game_session_update:
    addiu       $sp, $sp, -0x50
    sw          $s5, 0x44($sp)
    addu        $s5, $a0, $zero
    sw          $s2, 0x38($sp)
    addu        $s2, $a1, $zero
    sw          $s3, 0x3C($sp)
    addu        $s3, $a2, $zero
    sw          $s0, 0x30($sp)
    addu        $s0, $a3, $zero
    sw          $s1, 0x34($sp)
    lw          $s1, 0x60($sp)
    addu        $a0, $zero, $zero
    sw          $ra, 0x48($sp)
    sw          $s4, 0x40($sp)
    lw          $s4, 0x0($s5)
    jal         func_80032E00
    addiu       $a1, $zero, 0x10
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x420
    addiu       $a1, $zero, 0x648
    jal         func_800356C4
    sw          $v0, 0x4($s5)
    lw          $v1, 0x4($s5)
    addiu       $a0, $zero, 0x4
    addiu       $a1, $zero, 0x5
    jal         func_8000B6F8
    sh          $v0, 0xC($v1)
    addu        $a0, $zero, $zero
    lw          $v1, 0x4($s5)
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000D5BC
    sw          $v0, 0x0($v1)
    lw          $v1, 0x4($s5)
    sw          $v0, 0x4($v1)
    lw          $v0, 0x4($s5)
    lw          $a0, 0x0($v0)
    lw          $a1, 0x4($v0)
    jal         func_8000C898
    nop
    lw          $v0, 0x4($s5)
    lw          $a0, 0x0($v0)
    andi        $a1, $s2, 0xFFFF
    jal         func_8000C940
    andi        $a2, $s3, 0xFFFF
    lw          $v0, 0x4($s5)
    lw          $a0, 0x0($v0)
    andi        $a1, $s0, 0xFFFF
    jal         func_8000C964
    andi        $a2, $s1, 0xFFFF
    lw          $v0, 0x4($s5)
    lw          $a0, 0x0($v0)
    addu        $a1, $zero, $zero
    jal         func_8000CB78
    addu        $a2, $zero, $zero
    lw          $v0, 0x4($s5)
    lw          $a0, 0x0($v0)
    jal         func_8000B7A4
    addiu       $a1, $zero, 0xB0
    lw          $v0, 0x4($s5)
    lw          $v0, 0x0($v0)
    .word       0x44900000  # mtc1        $s0, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    swc1        $f0, 0x228($v0)
    lw          $v0, 0x4($s5)
    lw          $v0, 0x0($v0)
    .word       0x44910000  # mtc1        $s1, $f0
    .word       0x46800020  # cvt.s.w     $f0, $f0
    swc1        $f0, 0x22C($v0)
    lw          $v0, 0x4($s5)
    lw          $v0, 0x0($v0)
    sll         $s0, $s0, 2
    sh          $s0, 0x218($v0)
    lw          $v0, 0x4($s5)
    lw          $v0, 0x0($v0)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x5930
    sll         $s1, $s1, 2
    jal         func_8002D800
    sh          $s1, 0x21A($v0)
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x1A($sp)
    lw          $v0, 0x4($s5)
    lw          $v0, 0x0($v0)
    sw          $v0, 0x1C($sp)
    sll         $v0, $s4, 1
    addu        $v0, $v0, $s4
    sll         $s0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $v0, -0x5AD8($at)
    sw          $v0, 0x14($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $v0, -0x5AE0($at)
    sh          $v0, 0x18($sp)
    lw          $v0, 0x4($s5)
    lhu         $v0, 0xC($v0)
    sh          $v0, 0x10($sp)
    lw          $v0, 0x4($s5)
    lhu         $v0, 0xC($v0)
    sh          $v0, 0x12($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $v0, -0x5AD4($at)
    sw          $v0, 0x20($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $v0, -0x5AB8($at)
    sw          $v0, 0x28($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lhu         $v0, -0x5AB4($at)
    sh          $v0, 0x2C($sp)
    lw          $v0, 0x4($s5)
    addiu       $a1, $zero, 0x10
    lw          $a0, 0x4($v0)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lhu         $s1, -0x5ADA($at)
    jal         func_8000D740
    addiu       $a2, $sp, 0x10
    lw          $v1, 0x4($s5)
    sw          $v0, 0x8($v1)
    sw          $zero, 0x20($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lh          $v0, -0x5AC4($at)
    beqz        $v0, .L80021730
    addiu       $a1, $zero, 0xB1C
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x41C
    addiu       $a2, $zero, 0x42
    jal         func_8003C8E0
    addiu       $a3, $zero, 0x1
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lh          $a0, -0x5AC4($at)
    jal         func_8003D158
    nop
.L80021730:
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $a0, -0x5ACC($at)
    beqz        $a0, .L8002174C
    nop
    jal         func_8003D2D4
    addu        $a1, $zero, $zero
.L8002174C:
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $a0, -0x5AC8($at)
    beqz        $a0, .L80021768
    nop
    jal         func_800457F8
    nop
.L80021768:
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lhu         $v0, -0x5AC0($at)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800217A0
    addu        $v0, $s1, $zero
    lw          $v0, 0x4($s5)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lb          $a2, -0x5ABD($at)
    lw          $a0, 0x0($v0)
    jal         func_8000CE10
    addu        $a1, $zero, $zero
    addu        $v0, $s1, $zero
.L800217A0:
    lw          $ra, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end game_session_update
