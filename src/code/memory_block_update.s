.text
.align 2
.set noreorder
.globl memory_block_update
.ent memory_block_update
memory_block_update:
    addiu       $sp, $sp, -0x28
    sw          $s3, 0x1C($sp)
    addu        $s3, $a0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    addu        $a0, $zero, $zero
    sw          $ra, 0x20($sp)
    sw          $s1, 0x14($sp)
    jal         func_80036540
    sw          $s0, 0x10($sp)
    addu        $s1, $zero, $zero
    andi        $v0, $s1, 0xFFFF
.L800356F4:
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 3
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x4F88($at)
    beqz        $v0, .L8003572C
    addu        $a0, $zero, $zero
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x10
    bnez        $v0, .L800356F4
    andi        $v0, $s1, 0xFFFF
    addu        $a0, $zero, $zero
.L8003572C:
    jal         func_80032E00
    addu        $a1, $s2, $zero
    addu        $a0, $s3, $zero
    andi        $s1, $s1, 0xFFFF
    sll         $s0, $s1, 1
    addu        $s0, $s0, $s1
    sll         $s0, $s0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sw          $v0, -0x4F88($at)
    jal         func_800365AC
    addiu       $a1, $zero, 0x1
    addu        $a0, $v0, $zero
    addu        $a1, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sw          $a0, -0x4F7C($at)
    jal         func_80036628
    addu        $a2, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a0, -0x4F7C($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F88($at)
    jal         func_800365B8
    addu        $a2, $s2, $zero
    lui         $v0, 0xAAAA
    ori         $v0, $v0, 0xAAAB
    .word       0x02420019  # multu       $s2, $v0
    addu        $a0, $zero, $zero
    .word       0x00004010  # mfhi        $t0
    srl         $v0, $t0, 3
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sw          $v0, -0x4F78($at)
    jal         func_80032E00
    sll         $a1, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F78($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sw          $v0, -0x4F84($at)
    jal         func_80032E00
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F84($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a2, -0x4F78($at)
    addu        $a0, $zero, $zero
    addu        $a3, $zero, $zero
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sw          $v0, -0x4F80($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    sw          $s3, -0x4F74($at)
    jal         func_80033308
    sll         $a2, $a2, 2
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a1, -0x4F80($at)
    lui         $at, 0x8009
    addu        $at, $at, $s0
    lw          $a2, -0x4F78($at)
    addu        $a0, $zero, $zero
    jal         func_80033308
    addu        $a3, $zero, $zero
    addu        $v0, $s1, $zero
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end memory_block_update
