.text
.align 2
.set noreorder
.globl game_session_initialize
.ent game_session_initialize
game_session_initialize:
    addiu       $sp, $sp, -0x68
    sw          $s7, 0x5C($sp)
    addu        $s7, $a0, $zero
    sw          $ra, 0x64($sp)
    sw          $fp, 0x60($sp)
    sw          $s6, 0x58($sp)
    sw          $s5, 0x54($sp)
    sw          $s4, 0x50($sp)
    sw          $s3, 0x4C($sp)
    sw          $s2, 0x48($sp)
    sw          $s1, 0x44($sp)
    sw          $s0, 0x40($sp)
    jal         func_8000BEF8
    sw          $a1, 0x34($sp)
    addiu       $a0, $zero, 0x4
    jal         func_8000BEE8
    sh          $v0, 0x3E($sp)
    jal         func_80031A78
    nop
    addu        $a0, $zero, $zero
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x3
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x420
    jal         func_800356C4
    addiu       $a1, $zero, 0x648
    jal         func_8002FE58
    addu        $fp, $v0, $zero
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x65D0
    jal         func_8000B2E0
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4C30
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000C930
    addu        $a3, $zero, $zero
    addiu       $a0, $zero, 0x4
    jal         func_8000B6F8
    addiu       $a1, $zero, 0x5
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    lui         $at, 0x8009
    sw          $a0, -0x7F70($at)
    jal         func_8000C940
    addu        $a2, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addiu       $a1, $zero, 0x140
    jal         func_8000C964
    addiu       $a2, $zero, 0xF0
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x6910
    jal         func_8000D2C0
    nop
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    jal         func_8000D5BC
    addu        $a2, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addu        $a1, $v0, $zero
    lui         $at, 0x8008
    sw          $a1, 0x7A64($at)
    jal         func_8000C898
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addu        $a1, $zero, $zero
    jal         func_8000CB78
    addu        $a2, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000B7A4
    addiu       $a1, $zero, 0x12C
    jal         func_800334B8
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $v1, 0x8009
    lw          $v1, -0x7F70($v1)
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x1A($sp)
    sll         $v0, $s7, 1
    addu        $v0, $v0, $s7
    sll         $s1, $v0, 4
    sw          $v1, 0x1C($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $v0, -0x5AD8($at)
    sw          $v0, 0x14($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $v0, -0x5AE0($at)
    sh          $fp, 0x10($sp)
    sh          $fp, 0x12($sp)
    sh          $v0, 0x18($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $v0, -0x5AD4($at)
    sw          $v0, 0x20($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $v0, -0x5AB8($at)
    sw          $v0, 0x28($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lhu         $v0, -0x5AB4($at)
    addiu       $a1, $zero, 0x10
    sh          $v0, 0x2C($sp)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lhu         $s5, -0x5ADA($at)
    jal         func_8000D740
    addiu       $a2, $sp, 0x10
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x5930
    addu        $s6, $v0, $zero
    lw          $s4, 0x8($s6)
    jal         func_8002CB18
    addu        $a0, $s0, $zero
    lw          $t0, 0x0($s0)
    addiu       $t1, $zero, 0x1000
    .word       0x01090018  # mult        $t0, $t1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    addiu       $v0, $s0, 0x4
    sw          $t0, 0x0($s0)
    addiu       $t0, $zero, 0x1000
    lw          $v0, 0x0($v0)
    .word       0x00480018  # mult        $v0, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    addiu       $v0, $s0, 0x8
    sw          $t0, 0x4($s0)
    lw          $v0, 0x0($v0)
    .word       0x00490018  # mult        $v0, $t1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t1, $t6, $t7
    addiu       $v0, $s0, 0xC
    addiu       $t0, $zero, 0x1000
    sw          $t1, 0x8($s0)
    lw          $v0, 0x0($v0)
    .word       0x00480018  # mult        $v0, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    addiu       $v0, $s0, 0x10
    addiu       $t1, $zero, 0x1000
    sw          $t0, 0xC($s0)
    lw          $v0, 0x0($v0)
    .word       0x00490018  # mult        $v0, $t1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t1, $t6, $t7
    addiu       $v0, $s0, 0x14
    addiu       $t0, $zero, 0x1000
    sw          $t1, 0x10($s0)
    lw          $v0, 0x0($v0)
    .word       0x00480018  # mult        $v0, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    addiu       $v0, $s0, 0x18
    addiu       $t1, $zero, 0x1000
    sw          $t0, 0x14($s0)
    lw          $v0, 0x0($v0)
    .word       0x00490018  # mult        $v0, $t1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t1, $t6, $t7
    addiu       $v0, $s0, 0x1C
    addiu       $t0, $zero, 0x1000
    sw          $t1, 0x18($s0)
    lw          $v0, 0x0($v0)
    .word       0x00480018  # mult        $v0, $t0
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t0, $t6, $t7
    addiu       $v0, $s0, 0x20
    sw          $t0, 0x1C($s0)
    lw          $v0, 0x0($v0)
    addiu       $t1, $zero, 0x1000
    .word       0x00490018  # mult        $v0, $t1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $t1, $t6, $t7
    sw          $t1, 0x20($s0)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lh          $v0, -0x5AC4($at)
    beqz        $v0, .L80021C58
    addiu       $a1, $zero, 0xB1C
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x41C
    addiu       $a2, $zero, 0x42
    jal         func_8003C8E0
    addiu       $a3, $zero, 0x1
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lh          $a0, -0x5AC4($at)
    jal         func_8003D158
    nop
.L80021C58:
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $a0, -0x5ACC($at)
    beqz        $a0, .L80021C74
    nop
    jal         func_8003D2D4
    addu        $a1, $zero, $zero
.L80021C74:
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $a0, -0x5AC8($at)
    beqz        $a0, .L80021C90
    nop
    jal         func_800457F8
    nop
.L80021C90:
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lhu         $v0, -0x5AC0($at)
    andi        $v0, $v0, 0x1
    beqz        $v0, .L80021CC4
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lb          $a2, -0x5ABD($at)
    jal         func_8000CE10
    addu        $a1, $zero, $zero
.L80021CC4:
    jal         func_8000BF08
    addu        $s2, $zero, $zero
    jal         func_8000BF08
    addu        $s3, $zero, $zero
    jal         func_8000BF08
    nop
    jal         func_80031A98
    nop
    jal         func_80030910
    nop
    lhu         $v0, 0x16($s4)
    sltu        $v0, $v0, $s5
    beqz        $v0, .L80021DCC
    addu        $s0, $s1, $zero
    lw          $t0, 0x34($sp)
    sll         $v0, $t0, 24
    sra         $s1, $v0, 24
.L80021D08:
    lui         $v0, 0x8009
    lw          $v0, -0x7F70($v0)
    lhu         $v0, 0x206($v0)
    xori        $v1, $s3, 0x1
    srl         $v0, $v0, 3
    andi        $v0, $v0, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L80021DD0
    addu        $a0, $s6, $zero
    jal         func_8004583C
    nop
    jal         func_8000BF08
    nop
    jal         func_80030910
    nop
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lhu         $v0, -0x5AC0($at)
    andi        $v0, $v0, 0x2
    beqz        $v0, .L80021DA0
    nop
    lhu         $v0, 0x16($s4)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lhu         $v1, -0x5AC2($at)
    sltu        $v0, $v0, $v1
    xori        $v0, $v0, 0x1
    xori        $v1, $s2, 0x1
    and         $v0, $v0, $v1
    beqz        $v0, .L80021DA0
    addu        $a1, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lb          $a2, -0x5ABB($at)
    jal         func_8000CE10
    addiu       $s2, $zero, 0x1
.L80021DA0:
    beqz        $s1, .L80021DBC
    nop
    jal         func_80030DF0
    nop
    andi        $v0, $v0, 0x1000
    bnel        $v0, $zero, .L80021DBC
    addiu       $s3, $zero, 0x1
.L80021DBC:
    lhu         $v0, 0x16($s4)
    sltu        $v0, $v0, $s5
    bnez        $v0, .L80021D08
    nop
.L80021DCC:
    addu        $a0, $s6, $zero
.L80021DD0:
    jal         func_80041620
    addu        $a1, $zero, $zero
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    sll         $v0, $s7, 1
    addu        $v0, $v0, $s7
    sll         $s0, $v0, 4
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $v0, -0x5AC8($at)
    beqz        $v0, .L80021E18
    nop
    jal         func_800458F8
    nop
.L80021E18:
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lw          $a0, -0x5ACC($at)
    beqz        $a0, .L80021E34
    nop
    jal         func_8003D78C
    nop
.L80021E34:
    lui         $at, 0x8007
    addu        $at, $at, $s0
    lh          $v0, -0x5AC4($at)
    beqz        $v0, .L80021E50
    nop
    jal         func_8003CA4C
    nop
.L80021E50:
    lhu         $a0, 0x3E($sp)
    jal         func_8000BEE8
    nop
    jal         func_8000BE80
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000D998
    addu        $a1, $s6, $zero
    jal         func_80035A7C
    andi        $a0, $fp, 0xFFFF
    jal         func_8000D4AC
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000B7E4
    nop
    jal         func_8000B614
    nop
    jal         func_800334B8
    nop
    lw          $ra, 0x64($sp)
    lw          $fp, 0x60($sp)
    lw          $s7, 0x5C($sp)
    lw          $s6, 0x58($sp)
    lw          $s5, 0x54($sp)
    lw          $s4, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end game_session_initialize
