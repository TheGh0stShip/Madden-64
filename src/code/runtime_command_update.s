.text
.align 2
.set noreorder
.globl runtime_command_update
.ent runtime_command_update
runtime_command_update:
    addiu       $sp, $sp, -0x28
    addu        $t4, $zero, $zero
    sw          $s4, 0x20($sp)
    addiu       $s4, $zero, 0x20
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x7E90
    sw          $s3, 0x1C($sp)
    addiu       $s3, $a2, 0x10
    sw          $s2, 0x18($sp)
    addiu       $s2, $a2, 0x20
    addiu       $t9, $a2, 0x30
    addiu       $t8, $zero, -0x1
    sw          $s1, 0x14($sp)
    addiu       $s1, $a2, 0x80
    sw          $s0, 0x10($sp)
    addiu       $s0, $a2, 0x100
    addiu       $t7, $a2, 0x180
    addiu       $t6, $a2, 0x200
    addiu       $t5, $a2, 0x280
    sw          $ra, 0x24($sp)
    addu        $a1, $zero, $zero
.L8002F5E8:
    sll         $a0, $t4, 16
    sra         $a0, $a0, 16
    sll         $v0, $a0, 4
    addu        $t3, $v0, $s1
    addu        $t2, $v0, $s0
    addu        $t1, $v0, $t7
    addu        $t0, $v0, $t6
    addu        $a3, $v0, $t5
    sll         $v1, $a0, 1
    addu        $v0, $v1, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $s4, -0x7EE8($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $zero, -0x7EE7($at)
    addu        $v0, $v1, $a2
    sh          $zero, 0x0($v0)
    addu        $v0, $v1, $s3
    sh          $zero, 0x0($v0)
    addu        $v0, $v1, $s2
    addu        $v1, $v1, $t9
    sll         $a0, $a0, 2
    sh          $zero, 0x0($v0)
    sh          $t8, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $zero, -0x7E50($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $zero, -0x7E4E($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $zero, -0x7E30($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sh          $zero, -0x7E2E($at)
.L8002F684:
    sll         $v1, $a1, 16
    addiu       $a0, $a1, 0x1
    addu        $a1, $a0, $zero
    sra         $v1, $v1, 15
    addu        $v0, $v1, $t3
    sh          $zero, 0x0($v0)
    addu        $v0, $v1, $t2
    sh          $zero, 0x0($v0)
    addu        $v0, $v1, $t1
    sh          $zero, 0x0($v0)
    addu        $v0, $v1, $t0
    addu        $v1, $v1, $a3
    sll         $a0, $a0, 16
    sra         $a0, $a0, 16
    slti        $a0, $a0, 0x8
    sh          $zero, 0x0($v0)
    bnez        $a0, .L8002F684
    sh          $zero, 0x0($v1)
    addiu       $v0, $t4, 0x1
    addu        $t4, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnel        $v0, $zero, .L8002F5E8
    addu        $a1, $zero, $zero
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0xD
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x15B8
    addu        $a1, $v0, $zero
    lui         $at, 0x8008
    sw          $a1, 0x57D8($at)
    jal         func_800E12A0
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x57D8($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    ori         $a0, $zero, 0x86D0
    jal         func_800E1FCC
    addiu       $a1, $zero, 0x1
    ori         $a0, $zero, 0x86D0
    jal         func_800E1FCC
    addu        $a1, $zero, $zero
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x15C0
    addiu       $a1, $zero, 0x358
    lui         $at, 0x8009
    sh          $zero, -0x4C38($at)
    jal         func_800E2278
    addu        $a2, $zero, $zero
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x15C8
    addiu       $a1, $zero, 0x134
    jal         func_800E2278
    addu        $a2, $zero, $zero
    lui         $s1, 0x8000
    addiu       $s1, $s1, 0x15D0
    addu        $a0, $s1, $zero
    addiu       $a1, $zero, 0x1458
    jal         func_800E2278
    addu        $a2, $zero, $zero
    lui         $s0, 0x8000
    addiu       $s0, $s0, 0x15D8
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x3C0
    jal         func_800E2278
    addu        $a2, $zero, $zero
    jal         func_80028B08
    nop
    jal         func_800962F0
    nop
    jal         func_80096604
    nop
    jal         func_8009652C
    nop
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x15E0
    addiu       $a1, $zero, 0xBA0
    jal         func_800E2278
    addiu       $a2, $zero, 0x1
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x15E8
    addiu       $a1, $zero, 0x5C08
    jal         func_800E2278
    addiu       $a2, $zero, 0x1
    addu        $a0, $s1, $zero
    addiu       $a1, $zero, 0x1458
    jal         func_800E2278
    addiu       $a2, $zero, 0x1
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x3C0
    jal         func_800E2278
    addiu       $a2, $zero, 0x1
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0x15F0
    addiu       $a1, $zero, 0x1E4
    jal         func_800E2278
    addiu       $a2, $zero, 0x1
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end runtime_command_update
