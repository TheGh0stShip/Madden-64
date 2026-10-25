.text
.align 2
.set noreorder
.globl menu_input_activation_update
.ent menu_input_activation_update
menu_input_activation_update:
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $ra, 0x1C($sp)
    bnez        $v0, .L80021160
    sw          $s0, 0x10($sp)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L80021160
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    bne         $s1, $v0, .L80021160
    nop
    lbu         $v0, 0x18($s2)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sra         $a0, $a0, 1
    jal         func_80031A1C
    addiu       $a0, $a0, 0x28
    addiu       $a0, $zero, 0x3
    jal         func_8001FA38
    andi        $s0, $v0, 0xFFFF
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    srl         $v0, $v0, 31
    addu        $v1, $v1, $v0
    sra         $v1, $v1, 1
    addiu       $v1, $v1, -0x1
    slt         $v1, $v1, $s0
    bnez        $v1, .L80021160
    nop
    lbu         $s0, 0xE($s2)
    jal         func_80031A1C
    addiu       $a0, $zero, 0xC8
    andi        $v0, $v0, 0xFFFF
    sltu        $v0, $v0, $s0
    bnez        $v0, .L80021144
    addiu       $a0, $zero, 0x3
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
    j .L80021158
    addiu       $a0, $zero, 0xD
.L80021144:
    lw          $v0, 0x24($s1)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lw          $a2, 0x20($v0)
    lw          $a3, 0x20($v1)
.L80021158:
    jal         func_8001FA68
    addu        $a1, $s2, $zero
.L80021160:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end menu_input_activation_update
