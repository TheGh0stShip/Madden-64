.text
.align 2
.set noreorder
.globl func_8003586C
.ent func_8003586C
func_8003586C:
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $ra, 0x1C($sp)
    sw          $s0, 0x10($sp)
    andi        $v0, $s1, 0xFFFF
.L8003588C:
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x4F88($at)
    beqz        $v0, .L800358C4
    andi        $s0, $a0, 0xFFFF
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x10
    bnez        $v0, .L8003588C
    andi        $v0, $s1, 0xFFFF
    andi        $s0, $a0, 0xFFFF
.L800358C4:
    addu        $a0, $s0, $zero
    jal         func_80035EF0
    addu        $a1, $s2, $zero
    andi        $v1, $s1, 0xFFFF
    sll         $a0, $v1, 1
    addu        $a0, $a0, $v1
    sll         $a0, $a0, 3
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sw          $v0, -0x4F88($at)
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x4F80($at)
    addu        $v1, $v1, $s2
    lbu         $v0, 0x0($v1)
    ori         $v0, $v0, 0x10
    sb          $v0, 0x0($v1)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    lw          $v1, -0x4F88($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sw          $v0, -0x4F84($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sw          $s2, -0x4F80($at)
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sw          $s0, -0x4F7C($at)
    lw          $v1, 0x0($v1)
    lui         $v0, 0xAAAA
    ori         $v0, $v0, 0xAAAB
    .word       0x00620019  # multu       $v1, $v0
    ori         $v0, $s1, 0x8000
    andi        $v0, $v0, 0xFFFF
    .word       0x00003010  # mfhi        $a2
    srl         $v1, $a2, 3
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sw          $v1, -0x4F78($at)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8003586C
