.text
.align 2
.set noreorder
.globl func_8009198C
.ent func_8009198C
func_8009198C:
    lw          $a1, 0x798C($a1)
    jal         func_8000D834
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7AC8($v0)
    beqz        $v0, .L800919E0
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8A0
    nop
    lui         $a1, 0x8008
    lw          $a1, 0x7AC8($a1)
    jal         func_8000D874
    addu        $a0, $v0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7AC8($a1)
    jal         func_8000D834
    nop
.L800919E0:
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x6A28($a1)
    jal         func_8000D874
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x6A28($a1)
    jal         func_8000D834
    nop
    jal         func_800B7D98
    nop
    jal         func_80041660
    nop
    jal         func_800B7BB8
    nop
    jal         func_8003CA4C
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x5A40($v0)
    bnez        $v0, .L80091A48
    nop
    jal         func_800B1F30
    nop
.L80091A48:
    jal         func_800E0BBC
    addiu       $s5, $zero, 0x1
    jal         func_80024F5C
    nop
    jal         func_800BF93C
    nop
    lui         $v0, 0x8007
    lbu         $v0, -0x1590($v0)
    bne         $v0, $s5, .L80091A78
    nop
    jal         func_800AF8E0
    nop
.L80091A78:
    jal         func_800A6F00
    nop
    jal         func_800BE784
    nop
    jal         func_800AA220
    nop
    jal         func_8002E9E8
    addiu       $a0, $zero, 0x4
    jal         func_800395AC
    nop
    jal         func_800967CC
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000D684
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7AA8($a0)
    jal         func_8000D684
    nop
    jal         func_800B95A8
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000B7E4
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7AA4($a0)
    jal         func_8000B7E4
    nop
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2FF0
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x4C30
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000C930
    addu        $a3, $zero, $zero
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8000BF08
    nop
    jal         func_8001AB74
    nop
    jal         func_80015CFC
    nop
    jal         func_80016EE4
    nop
    jal         func_800971DC
    nop
    jal         func_80045794
    nop
    jal         func_8000DDE8
    nop
    jal         menu_resources_release
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    jal         func_80035A7C
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7904($a0)
    jal         func_80035A7C
    nop
    jal         func_80016FD4
    nop
    jal         func_80035A7C
    andi        $a0, $v0, 0xFFFF
    lui         $a0, 0x8008
    lhu         $a0, -0x7D18($a0)
    jal         func_80035A7C
    nop
    jal         func_8000D4AC
    nop
    jal         func_8009506C
    nop
    jal         func_8002FE58
    nop
    jal         func_8000B614
    nop
    jal         func_800334B8
    nop
    lui         $v1, 0x8009
    lw          $v1, -0x6B70($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L80091D40
    addiu       $v0, $zero, 0x7
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    beq         $v1, $v0, .L80091D40
    nop
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x5138
    sw          $zero, 0x0($s2)
    jal         func_8009321C
    addu        $a0, $zero, $zero
    addiu       $a0, $zero, 0x1
    jal         func_8009321C
    addu        $s3, $v0, $zero
    addu        $s4, $v0, $zero
    sll         $v0, $s3, 16
    sra         $v1, $v0, 16
    sll         $v0, $s4, 16
    sra         $s1, $v0, 16
    addu        $s0, $v1, $s1
    bnel        $s0, $s5, .L80091C6C
    sll         $v0, $s3, 16
    bne         $v1, $s0, .L80091C50
    addu        $a0, $zero, $zero
    jal         func_80093294
    addiu       $a1, $zero, 0x1
    sw          $v0, 0x0($s2)
.L80091C50:
    bne         $s1, $s0, .L80091C6C
    sll         $v0, $s3, 16
    addiu       $a0, $zero, 0x1
    jal         func_80093294
    addu        $a1, $zero, $zero
    sw          $v0, 0x0($s2)
    sll         $v0, $s3, 16
.L80091C6C:
    sra         $v0, $v0, 16
    sll         $v1, $s4, 16
    sra         $v1, $v1, 16
    addu        $v0, $v0, $v1
    addiu       $v1, $zero, 0x2
    bne         $v0, $v1, .L80091CBC
    nop
    jal         func_800933A4
    nop
    sll         $s0, $v0, 16
    jal         func_800933A4
    sra         $s0, $s0, 16
    addu        $a0, $s0, $zero
    addiu       $a1, $zero, 0x1
    subu        $a1, $a1, $v0
    sll         $a1, $a1, 16
    jal         func_80093294
    sra         $a1, $a1, 16
    lui         $at, 0x8008
    sw          $v0, 0x5138($at)
.L80091CBC:
    lui         $v1, 0x8008
    lw          $v1, 0x5138($v1)
    beqz        $v1, .L80091D40
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L80091CF8
    addiu       $v0, $zero, 0x1
    addiu       $v1, $zero, 0x3
    lui         $at, 0x8008
    sw          $v1, 0x513C($at)
    lui         $at, 0x8008
    sw          $v0, 0x5140($at)
    lui         $at, 0x8009
    sw          $v1, -0x4DA0($at)
    j           func_8008D5DC
    nop
.L80091CF8:
    lui         $at, 0x8009
    sw          $v0, -0x4DA0($at)
    lui         $v0, 0x8008
    lw          $v0, 0x5138($v0)
    beqz        $v0, .L80091D40
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sw          $v0, -0x6D54($at)
    lui         $v0, 0x8003
    addiu       $v0, $v0, -0x1290
    lui         $at, 0x8008
    sw          $v0, 0x6DD8($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x8B8
    lui         $at, 0x8009
    sw          $v0, -0x72D4($at)
    j           func_8008D62C
    nop
.L80091D40:
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x8B8
    lui         $at, 0x8008
    sw          $v0, 0x6DD8($at)
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009198C
