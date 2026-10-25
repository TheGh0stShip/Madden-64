.text
.align 2
.set noreorder
.globl text_line_render
.ent text_line_render
text_line_render:
    addiu       $sp, $sp, -0x28
    sw          $ra, 0x20($sp)
    addu        $t2, $a1, $zero
    andi        $v0, $a3, 0xFF
    beqz        $v0, .L8001D2F0
    addu        $t8, $a2, $zero
    lw          $v0, 0x8($a0)
    lhu         $a2, 0x1A($v0)
    addiu       $t5, $zero, 0x6
    addiu       $t4, $zero, 0xFF
    lui         $at, 0x8008
    sb          $zero, 0x5027($at)
    lhu         $t7, 0x1C($v0)
    andi        $t3, $a2, 0xFFFF
    srl         $t6, $t3, 1
    sll         $v0, $t3, 1
    addu        $v0, $v0, $t3
    sll         $t1, $v0, 1
.L8001D228:
    srl         $t0, $t1, 1
    addiu       $v0, $t0, -0x5
    addu        $t0, $v0, $t6
    addu        $a1, $t2, $t0
    addiu       $t0, $t0, 0x1
    addu        $a0, $t2, $t0
    addiu       $t0, $t0, 0x1
    addu        $v0, $t2, $t0
    addiu       $t0, $t0, 0x1
    subu        $t1, $t1, $t3
    addu        $v1, $t5, $zero
    addiu       $t5, $t5, -0x1
    sb          $t4, 0x0($a1)
    sb          $t4, 0x0($a0)
    sb          $t4, 0x0($v0)
    addu        $v0, $t2, $t0
    bnez        $v1, .L8001D228
    sb          $t4, 0x0($v0)
    andi        $a0, $a3, 0xFF
    addiu       $v0, $zero, 0x20
    beq         $a0, $v0, .L8001D2F0
    addiu       $v1, $a3, -0x41
    andi        $v0, $v1, 0xFF
    sltiu       $v0, $v0, 0x1A
    beql        $v0, $zero, .L8001D298
    addiu       $v1, $a3, -0x30
    j .L8001D2B8
    addu        $a3, $v1, $zero
.L8001D298:
    andi        $v0, $v1, 0xFF
    sltiu       $v0, $v0, 0xA
    beqz        $v0, .L8001D2B0
    addiu       $v0, $zero, 0x2D
    j .L8001D2B8
    addiu       $a3, $v1, 0x1A
.L8001D2B0:
    beql        $a0, $v0, .L8001D2B8
    addiu       $a3, $zero, 0x24
.L8001D2B8:
    andi        $v0, $a3, 0xFF
    addiu       $v0, $v0, 0x9
    addiu       $a0, $a2, -0x7
    sll         $a0, $a0, 24
    sll         $a2, $a2, 24
    sll         $a3, $t7, 24
    sra         $a0, $a0, 24
    addiu       $a1, $zero, 0x6
    sra         $a2, $a2, 24
    sra         $a3, $a3, 24
    sw          $t2, 0x10($sp)
    sw          $t8, 0x14($sp)
    jal         func_8001E4B0
    sw          $v0, 0x18($sp)
.L8001D2F0:
    lw          $ra, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end text_line_render
