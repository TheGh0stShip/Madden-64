.text
.align 2
.set noreorder
.globl func_8003663C
.ent func_8003663C
func_8003663C:
    lui         $v0, 0x8008
    lw          $v0, -0x5B00($v0)
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a2, $zero
    addu        $a2, $a0, $zero
    sw          $ra, 0x1C($sp)
    bnez        $v0, .L8003673C
    sw          $s0, 0x10($sp)
    andi        $a0, $a2, 0xFFFF
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x4F88($at)
    sll         $v0, $s1, 1
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    addu        $v1, $v0, $v1
    lw          $a1, 0x8($v1)
    beqz        $a1, .L800366C4
    lui         $v0, 0x7FFF
    lw          $v1, 0x4($v1)
    ori         $v0, $v0, 0xFFFF
    and         $a1, $a1, $v0
    beq         $a1, $v1, .L800366C8
    andi        $v0, $a2, 0xFFFF
    jal         func_80036764
    addu        $a1, $s1, $zero
    j .L80036748
    nop
.L800366C4:
    andi        $v0, $a2, 0xFFFF
.L800366C8:
    sll         $s0, $v0, 1
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a0, -0x4F7C($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F88($at)
    sll         $v0, $s1, 1
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $a1, 0x0($v0)
    jal         func_80036628
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $v1, -0x4F84($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a0, -0x4F7C($at)
    sll         $v0, $s1, 2
    addu        $v0, $v0, $v1
    lw          $a1, 0x0($v0)
    jal         func_800365B8
    addu        $a2, $s2, $zero
    j .L80036748
    nop
.L8003673C:
    andi        $a0, $a2, 0xFFFF
    jal         func_80036A24
    addu        $a1, $s1, $zero
.L80036748:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8003663C
