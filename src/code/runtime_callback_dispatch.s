.text
.align 2
.set noreorder
.globl runtime_callback_dispatch
.ent runtime_callback_dispatch
runtime_callback_dispatch:
    addu        $s2, $a0, $zero
    addiu       $a0, $zero, 0x96
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x4D98
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x4988
    addiu       $a3, $zero, 0x32
    sw          $ra, 0x3C($sp)
    sw          $s1, 0x34($sp)
    jal         func_8004C048
    sw          $s0, 0x30($sp)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x55E0
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5C50
    jal         func_80045B68
    addiu       $a2, $zero, 0x32
    lb          $v0, 0x0($s2)
    lb          $v1, 0x1($s2)
    addiu       $a0, $zero, 0xFE
    sll         $s1, $v0, 3
    sll         $v1, $v1, 2
    lb          $v0, 0x3($s2)
    or          $s1, $s1, $v1
    lb          $v1, 0x2($s2)
    sll         $v0, $v0, 1
    or          $s1, $s1, $v0
    jal         func_8004E238
    or          $s1, $s1, $v1
    lui         $v1, 0x8000
    lw          $v1, 0x300($v1)
    beqz        $v1, .L800302F4
    addiu       $v0, $zero, 0x2
    beql        $v1, $v0, .L800302F8
    addiu       $a1, $zero, 0x1C
    j .L800302F8
    addu        $a1, $zero, $zero
.L800302F4:
    addiu       $a1, $zero, 0xE
.L800302F8:
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lbu         $v0, 0x2338($at)
    addu        $v0, $v0, $a1
    sll         $a0, $v0, 2
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 4
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x4FD0
    addu        $a0, $a0, $v0
    lui         $at, 0x8009
    sw          $a0, -0x4C84($at)
    jal         func_8004EB78
    sll         $s0, $s1, 2
    jal         func_8004EBE8
    addiu       $a0, $zero, 0xA
    jal         func_80031A78
    nop
    lui         $a1, 0x8009
    lw          $a1, -0x4C84($a1)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x7B50
    jal         func_8002E17C
    addiu       $a2, $zero, 0x50
    lui         $v0, 0x8007
    addiu       $v0, $v0, 0x2348
    addu        $s0, $s0, $v0
    lw          $a1, 0x0($s0)
    addu        $a0, $zero, $zero
    jal         func_800337CC
    lui         $a2, 0x10
    lui         $at, 0x8009
    sw          $v0, -0x63C0($at)
    lui         $at, 0x8009
    sw          $v0, -0x5F98($at)
    lw          $v1, 0x0($s0)
    lui         $a0, 0xAAAA
    ori         $a0, $a0, 0xAAAB
    .word       0x00640019  # multu       $v1, $a0
    .word       0x00004010  # mfhi        $t0
    srl         $v1, $t0, 1
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sw          $v0, -0x63BC($at)
    lui         $at, 0x8009
    sw          $v0, -0x5F94($at)
    lw          $v1, 0x0($s0)
    .word       0x00640019  # multu       $v1, $a0
    lui         $a1, 0x2
    addiu       $v1, $zero, 0x140
    lui         $at, 0x8009
    sh          $v1, -0x79CC($at)
    addiu       $v1, $zero, 0xF0
    lui         $at, 0x8009
    sh          $v1, -0x78FC($at)
    .word       0x00004010  # mfhi        $t0
    srl         $v1, $t0, 1
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sw          $v0, -0x63B8($at)
    lui         $at, 0x8009
    sw          $v0, -0x5F90($at)
    andi        $v0, $s1, 0x8
    beqz        $v0, .L8003041C
    ori         $a1, $a1, 0x5800
    lui         $a1, 0x9
    ori         $a1, $a1, 0x6000
    addiu       $v0, $zero, 0x280
    lui         $at, 0x8009
    sh          $v0, -0x79CC($at)
    addiu       $v0, $zero, 0x1E0
    lui         $at, 0x8009
    sh          $v0, -0x78FC($at)
.L8003041C:
    addu        $a0, $zero, $zero
    jal         func_800337CC
    lui         $a2, 0x10
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x4D78
    addu        $a0, $s0, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x6A54
    addiu       $a2, $zero, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x7910($at)
    jal         func_80045B68
    sb          $zero, 0x28($sp)
    addu        $a0, $s0, $zero
    jal         func_80032A4C
    addiu       $a1, $zero, 0x1
    addu        $a0, $s0, $zero
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x5180
    jal         func_8004F4B8
    addiu       $a1, $sp, 0x28
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6C98
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x6C90
    jal         func_80045B68
    addiu       $a2, $zero, 0x4
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8007
    sw          $v0, 0x2320($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sw          $v0, 0x2324($at)
    jal         func_80032ABC
    nop
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5600
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x46
    lui         $a2, 0x8003
    addiu       $a2, $a2, 0x24FC
    addu        $a3, $zero, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x54A0
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x13
    jal         func_80045B98
    sw          $v0, 0x14($sp)
    jal         func_8004DE18
    addu        $a0, $s0, $zero
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0xA80
    addu        $a0, $s1, $zero
    lw          $v0, 0x4($s2)
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x4F88
    addiu       $a2, $zero, 0x8
    lui         $at, 0x8009
    sw          $zero, -0x79E0($at)
    lui         $at, 0x8008
    sw          $v0, 0x6184($at)
    jal         func_80045B68
    nop
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x5DD8
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x45
    lui         $a2, 0x8003
    addiu       $a2, $a2, 0x2088
    addu        $a3, $zero, $zero
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x63E8
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x14
    jal         func_80045B98
    sw          $v0, 0x14($sp)
    addu        $a0, $s1, $zero
    addu        $a1, $zero, $zero
    jal         func_8004EB08
    addiu       $a2, $zero, 0x1
    jal         func_8004DE18
    addu        $a0, $s0, $zero
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x6D88
    addu        $a0, $s0, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7A9C
    jal         func_80045B68
    addiu       $a2, $zero, 0x1
    addiu       $a0, $zero, 0xE
    addu        $a1, $s0, $zero
    jal         func_8004D098
    addu        $a2, $zero, $zero
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x5F88
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x42
    lui         $a2, 0x8003
    addiu       $a2, $a2, 0x2498
    addu        $a3, $zero, $zero
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x67E8
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x12
    jal         func_80045B98
    sw          $v0, 0x14($sp)
    jal         func_8004DE18
    addu        $a0, $s0, $zero
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, -0x10
    jal         func_800325C0
    addu        $a3, $zero, $zero
    jal         func_8000DD90
    addiu       $a0, $zero, 0x80
    jal         func_80045DE8
    addiu       $a0, $sp, 0x18
    lw          $v0, 0x18($sp)
    lui         $at, 0x8008
    sb          $zero, 0x6C65($at)
    lui         $at, 0x8008
    sw          $v0, 0x7998($at)
    lw          $ra, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end runtime_callback_dispatch
