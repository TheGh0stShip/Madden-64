.text
.align 2
.set noreorder
.globl func_80036B94
.ent func_80036B94
func_80036B94:
    lui         $v0, 0x8007
    lw          $v0, 0x1308($v0)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    beqz        $v0, .L80036C98
    sw          $s0, 0x10($sp)
    lhu         $a0, 0xC($v0)
    lw          $s2, 0x8($v0)
    andi        $v0, $a0, 0x4000
    beqz        $v0, .L80036C24
    andi        $v0, $a0, 0xBFFF
    sll         $s0, $v0, 1
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $s1, -0x4F84($at)
    .word       0x02510018  # mult        $s2, $s1
    .word       0x00002812  # mflo        $a1
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a0, -0x4F7C($at)
    jal         func_80036628
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a0, -0x4F7C($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F80($at)
    jal         func_800365B8
    addu        $a2, $s1, $zero
    j .L80036C90
    nop
.L80036C24:
    andi        $a0, $a0, 0xFFFF
    sll         $s0, $a0, 1
    addu        $s0, $s0, $a0
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F88($at)
    sll         $v0, $s2, 1
    addu        $v0, $v0, $s2
    sll         $v0, $v0, 2
    lui         $s1, 0x8008
    lw          $s1, -0x5B00($s1)
    addu        $v0, $v0, $v1
    lw          $a2, 0x4($v0)
    lui         $at, 0x8008
    sw          $zero, -0x5B00($at)
    jal         func_8003663C
    addu        $a1, $s2, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F80($at)
    lui         $at, 0x8008
    sw          $s1, -0x5B00($at)
    addu        $v1, $v1, $s2
    lbu         $v0, 0x0($v1)
    andi        $v0, $v0, 0xFE
    sb          $v0, 0x0($v1)
.L80036C90:
    jal         func_80040348
    nop
.L80036C98:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80036B94
