.text
.align 2
.set noreorder
.globl ui_resource_update
.ent ui_resource_update
ui_resource_update:
    addiu       $sp, $sp, -0x40
    sw          $s5, 0x34($sp)
    addiu       $s5, $a0, -0x1
    sll         $v0, $s5, 5
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s5
    sw          $s3, 0x2C($sp)
    sll         $s3, $v0, 3
    sw          $ra, 0x3C($sp)
    sw          $s6, 0x38($sp)
    sw          $s4, 0x30($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lhu         $s2, -0x7B12($at)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lhu         $s4, -0x7B14($at)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $s1, -0x7B0F($at)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $s0, -0x7B10($at)
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lbu         $v0, -0x7B0E($at)
    lui         $v1, 0x8007
    lw          $v1, -0x6D64($v1)
    andi        $s2, $s2, 0xFFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $s6, 0x0($v0)
    andi        $v0, $s2, 0x800
    beqz        $v0, .L8001B860
    addiu       $v0, $zero, -0x1000
    or          $s2, $s2, $v0
.L8001B860:
    andi        $s4, $s4, 0xFFF
    andi        $v0, $s4, 0x800
    beqz        $v0, .L8001B874
    addiu       $v0, $zero, -0x1000
    or          $s4, $s4, $v0
.L8001B874:
    andi        $s1, $s1, 0xFFF
    andi        $v0, $s1, 0x800
    beqz        $v0, .L8001B888
    addiu       $v0, $zero, -0x1000
    or          $s1, $s1, $v0
.L8001B888:
    andi        $s0, $s0, 0xFFF
    andi        $v0, $s0, 0x800
    beqz        $v0, .L8001B89C
    addiu       $v0, $zero, -0x1000
    or          $s0, $s0, $v0
.L8001B89C:
    addu        $a0, $s6, $zero
    sll         $a1, $s4, 16
    sra         $a1, $a1, 16
    sll         $a2, $s2, 16
    jal         func_80017000
    sra         $a2, $a2, 16
    jal         func_80018540
    addu        $a0, $s6, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lw          $v0, -0x7B0C($at)
    beqz        $v0, .L8001BBD8
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    jal         func_8000C790
    nop
    lui         $v0, 0x8007
    lh          $v0, -0x6D4C($v0)
    lui         $a0, 0x8009
    lhu         $a0, -0x502C($a0)
    beq         $v0, $a0, .L8001B914
    sll         $v0, $s0, 1
    jal         func_80044C6C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    lui         $at, 0x8007
    sh          $v0, -0x6D4C($at)
    sll         $v0, $s0, 1
.L8001B914:
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    jal         func_8002CAD0
    sll         $s3, $v0, 2
    lui         $a0, 0x2AAA
    ori         $a0, $a0, 0xAAAB
    sll         $v0, $s0, 2
    addu        $v0, $v0, $s0
    .word       0x00440018  # mult        $v0, $a0
    sra         $v0, $v0, 31
    lui         $at, 0x8000
    lwc1        $f5, 0xA48($at)
    lwc1        $f4, 0xA4C($at)
    .word       0x00003810  # mfhi        $a3
    subu        $v0, $a3, $v0
    addu        $v0, $s2, $v0
    addiu       $v0, $v0, -0x78
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    lui         $v0, 0x12C
    sw          $v0, 0x18($sp)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    swc1        $f2, 0x14($sp)
    slti        $v0, $s4, 0xB5
    bnez        $v0, .L8001B9E0
    xori        $v1, $s1, 0x30
    xori        $v1, $s1, 0x40
    sltiu       $v1, $v1, 0x1
    xori        $v0, $s0, 0x30
    sltiu       $v0, $v0, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L8001B9C8
    lui         $v0, 0x6666
    ori         $v0, $v0, 0x6667
    sll         $v1, $s1, 2
    .word       0x00620018  # mult        $v1, $v0
    sra         $v1, $v1, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v0, $a3, 1
    j .L8001BA30
    subu        $v0, $v0, $v1
.L8001B9C8:
    lui         $v1, 0x5555
    ori         $v1, $v1, 0x5556
    sll         $v0, $s1, 1
    .word       0x00430018  # mult        $v0, $v1
    j .L8001BA24
    nop
.L8001B9E0:
    sltiu       $v1, $v1, 0x1
    xori        $v0, $s0, 0x40
    sltiu       $v0, $v0, 0x1
    and         $v1, $v1, $v0
    beqz        $v1, .L8001BA18
    lui         $v0, 0x38E3
    ori         $v0, $v0, 0x8E39
    sll         $v1, $s1, 3
    .word       0x00620018  # mult        $v1, $v0
    sra         $v1, $v1, 31
    .word       0x00003810  # mfhi        $a3
    sra         $v0, $a3, 1
    j .L8001BA30
    subu        $v0, $v0, $v1
.L8001BA18:
    sll         $v0, $s1, 2
    addu        $v0, $v0, $s1
    .word       0x00440018  # mult        $v0, $a0
.L8001BA24:
    sra         $v0, $v0, 31
    .word       0x00003810  # mfhi        $a3
    subu        $v0, $a3, $v0
.L8001BA30:
    addu        $v0, $s4, $v0
    addiu       $v0, $v0, -0xB4
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46240002  # mul.d       $f0, $f0, $f4
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    swc1        $f2, 0x10($sp)
    jal         func_8002DA14
    addiu       $a0, $sp, 0x10
    addu        $a0, $s3, $zero
    addu        $a1, $a0, $zero
    jal         func_8002D8D0
    addu        $a2, $a0, $zero
    jal         func_8002CD44
    addiu       $a0, $zero, 0x960
    slti        $v0, $s4, 0xB5
    bnez        $v0, .L8001BA7C
    addiu       $a0, $zero, 0x194
    addiu       $a0, $zero, 0xE10
.L8001BA7C:
    jal         func_8002CF48
    nop
    jal         func_8002D14C
    addu        $a0, $zero, $zero
    sll         $v0, $s5, 5
    subu        $v0, $v0, $s5
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s5
    sll         $s1, $v0, 3
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x7AAC
    addu        $a0, $s1, $s0
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a1, -0x7AEC($at)
    lui         $v1, 0x8009
    lhu         $v1, -0x502C($v1)
    addiu       $v0, $s0, 0x5C
    addu        $v0, $s1, $v0
    sll         $a2, $v1, 3
    subu        $a2, $a2, $v1
    sll         $a2, $a2, 7
    jal         func_80044C8C
    addu        $a2, $v0, $a2
    jal         func_8002CD28
    addiu       $s0, $s0, -0x58
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    jal         func_8000C810
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    addu        $s0, $s1, $s0
    jal         func_80033B20
    addu        $a0, $s0, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, -0x7A54($at)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a0, -0x7B0C($at)
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sw          $v0, -0x7A54($at)
    beqz        $a0, .L8001BBD8
    nop
    lui         $v0, 0x8007
    lh          $v0, -0x6D4E($v0)
    beqz        $v0, .L8001BB5C
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sw          $zero, -0x7A54($at)
.L8001BB5C:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $a1, -0x7B0C($at)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $v1, -0x7B08($at)
    lw          $v0, 0x4($a1)
    sll         $a0, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v1, -0x7A54($at)
    addu        $v0, $a0, $v0
    lw          $v0, 0x0($v0)
    sltu        $v0, $v0, $v1
    beqz        $v0, .L8001BBAC
    lui         $v1, 0x2
    jal         func_8001F0C4
    addu        $a0, $s5, $zero
    j .L8001BBD8
    nop
.L8001BBAC:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, -0x7AF0($at)
    and         $v0, $v0, $v1
    bnez        $v0, .L8001BBD8
    nop
    lw          $v0, 0x0($a1)
    addu        $v0, $a0, $v0
    lw          $a1, 0x0($v0)
    jal         func_80034388
    addu        $a0, $s0, $zero
.L8001BBD8:
    lw          $ra, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end ui_resource_update
