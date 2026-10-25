.text
.align 2
.set noreorder
.globl memory_block_finalize
.ent memory_block_finalize
memory_block_finalize:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a0, $zero
    sw          $ra, 0x1C($sp)
    jal         func_80034FD8
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8007
    lbu         $v0, 0x24DA($v0)
    addu        $s0, $zero, $zero
    beqz        $v0, .L80035250
    addu        $a0, $zero, $zero
    lui         $t2, 0x8007
    lw          $t2, 0x24DC($t2)
    addiu       $t5, $zero, 0x2
    addiu       $t4, $zero, 0xFF
    addu        $t3, $zero, $zero
    lui         $t0, 0xFF
    andi        $a3, $s2, 0xFF
    addu        $t1, $v0, $zero
    andi        $v0, $a0, 0xFFFF
.L800351B4:
    sll         $v1, $v0, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $t2
    lw          $v0, 0x8($v1)
    bnel        $v0, $t5, .L80035240
    addiu       $a0, $a0, 0x1
    lbu         $v0, 0xD($v1)
    beql        $v0, $t4, .L80035240
    addiu       $a0, $a0, 0x1
    lw          $v0, 0x4($v1)
    lw          $a2, 0xC($v0)
    lw          $v0, 0x0($a2)
    sltu        $v0, $t3, $v0
    beqz        $v0, .L8003523C
    addu        $a1, $zero, $zero
    andi        $v0, $a1, 0xFFFF
.L800351F8:
    sll         $v0, $v0, 3
    addu        $v0, $a2, $v0
    lw          $v1, 0x4($v0)
    and         $v0, $v1, $t0
    srl         $v0, $v0, 16
    bne         $v0, $a3, .L80035224
    andi        $v0, $s0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s1
    sh          $v1, 0x0($v0)
    addiu       $s0, $s0, 0x1
.L80035224:
    lw          $v1, 0x0($a2)
    addiu       $a1, $a1, 0x1
    andi        $v0, $a1, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L800351F8
    andi        $v0, $a1, 0xFFFF
.L8003523C:
    addiu       $a0, $a0, 0x1
.L80035240:
    andi        $v0, $a0, 0xFFFF
    sltu        $v0, $v0, $t1
    bnez        $v0, .L800351B4
    andi        $v0, $a0, 0xFFFF
.L80035250:
    lui         $v0, 0x8009
    lw          $v0, -0x79D0($v0)
    lw          $a2, 0xC($v0)
    lw          $v0, 0x0($a2)
    beqz        $v0, .L800352B8
    addu        $a1, $zero, $zero
    lui         $a3, 0xFF
    andi        $a0, $s2, 0xFF
    andi        $v0, $a1, 0xFFFF
.L80035274:
    sll         $v0, $v0, 3
    addu        $v0, $a2, $v0
    lw          $v1, 0x4($v0)
    and         $v0, $v1, $a3
    srl         $v0, $v0, 16
    bne         $v0, $a0, .L800352A0
    andi        $v0, $s0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s1
    sh          $v1, 0x0($v0)
    addiu       $s0, $s0, 0x1
.L800352A0:
    lw          $v1, 0x0($a2)
    addiu       $a1, $a1, 0x1
    andi        $v0, $a1, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, .L80035274
    andi        $v0, $a1, 0xFFFF
.L800352B8:
    andi        $v0, $s0, 0xFFFF
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end memory_block_finalize
