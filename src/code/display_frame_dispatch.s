.text
.align 2
.set noreorder
.globl display_frame_dispatch
.ent display_frame_dispatch
display_frame_dispatch:
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    addiu       $sp, $sp, -0x70
    sw          $s3, 0x5C($sp)
    addu        $s3, $a0, $zero
    sw          $s5, 0x64($sp)
    addu        $s5, $a1, $zero
    sw          $ra, 0x68($sp)
    sw          $s4, 0x60($sp)
    sw          $s2, 0x58($sp)
    sw          $s1, 0x54($sp)
    sw          $s0, 0x50($sp)
    lw          $s2, 0x8($s3)
    addiu       $s1, $sp, 0x30
    lhu         $s0, 0x206($v0)
    addu        $a1, $s1, $zero
    lh          $a2, 0x12($s2)
    andi        $s0, $s0, 0x100
    jal         func_800438B4
    addu        $a3, $s0, $zero
    addu        $a0, $s3, $zero
    addu        $a1, $s1, $zero
    addiu       $a2, $sp, 0x40
    addu        $a3, $s0, $zero
    jal         func_8004367C
    addu        $s4, $v0, $zero
    bnez        $v0, .L80043D54
    nop
    jal         func_8002CBD4
    nop
    jal         func_8002DA14
    addu        $a0, $s1, $zero
    lhu         $v0, 0x40($sp)
    beqz        $v0, .L80043BE0
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, 0x48F4
    jal         func_80043648
    nop
    sh          $v0, 0x40($sp)
    andi        $v1, $v0, 0xFFFF
    addiu       $v0, $zero, 0x8
    beq         $v1, $v0, .L80043D4C
    sltiu       $v0, $v1, 0x4
    bnel        $v0, $zero, .L80043BE0
    sh          $zero, 0x40($sp)
    addiu       $v0, $zero, 0x1
    sh          $v0, 0x40($sp)
.L80043BE0:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addu        $a0, $s2, $zero
    sw          $v0, 0x10($sp)
    lw          $a3, 0x18($s3)
    addiu       $a1, $sp, 0x44
    jal         func_80043114
    addiu       $a2, $sp, 0x48
    andi        $s0, $v0, 0xFF
    andi        $v0, $s5, 0xFF
    beqz        $v0, .L80043C38
    addiu       $v0, $zero, 0xF
    lw          $a2, 0x44($sp)
    lw          $v1, 0x0($a2)
    bne         $v1, $v0, .L80043C38
    andi        $v0, $s4, 0xFFFF
    sw          $s0, 0x10($sp)
    sw          $v0, 0x14($sp)
    lw          $a3, 0x48($sp)
    addu        $a0, $s2, $zero
    jal         func_8004399C
    addiu       $a1, $sp, 0x18
.L80043C38:
    jal         func_8002CD44
    addiu       $a0, $zero, 0x400
    jal         func_8002CF48
    andi        $a0, $s4, 0xFFFF
    jal         func_8002D14C
    addu        $a0, $zero, $zero
    lw          $a0, 0x3C($s2)
    addu        $s1, $zero, $zero
    andi        $s4, $s0, 0xFF
    addu        $a1, $a0, $zero
    jal         func_8002D8D0
    addu        $a2, $a0, $zero
.L80043C68:
    jal         func_8002CBD4
    andi        $s3, $s1, 0xFF
    addiu       $a0, $sp, 0x18
    sw          $s4, 0x10($sp)
    lw          $a1, 0x44($sp)
    lw          $a2, 0x48($sp)
    jal         func_80042F50
    addu        $a3, $s3, $zero
    jal         func_8002DA14
    addiu       $a0, $sp, 0x18
    lw          $a0, 0x2C($sp)
    jal         func_8002D14C
    nop
    lw          $a0, 0x28($sp)
    jal         func_8002CF48
    nop
    lw          $a0, 0x24($sp)
    jal         func_8002CD44
    nop
    jal         func_8002D398
    nop
    lw          $a0, 0x40($s2)
    lw          $a1, 0x44($s2)
    lw          $a2, 0x48($s2)
    jal         func_8002D8D0
    nop
    lhu         $v0, 0x40($sp)
    beqz        $v0, .L80043D08
    andi        $v1, $s1, 0xFFFF
    lw          $v0, 0x24($s2)
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    lw          $a0, 0x0($v1)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x48F4
    jal         func_80043610
    nop
    andi        $v0, $v0, 0xFFFF
    bnez        $v0, .L80043D34
    nop
.L80043D08:
    lui         $s0, 0x8008
    lw          $s0, -0x5AA0($s0)
    addiu       $v0, $s0, 0x40
    lui         $at, 0x8008
    sw          $v0, -0x5AA0($at)
    jal         func_8002DEF4
    addu        $a0, $s0, $zero
    addu        $a0, $s2, $zero
    addu        $a1, $s0, $zero
    jal         func_80042DC8
    addu        $a2, $s3, $zero
.L80043D34:
    jal         func_8002CD28
    addiu       $s1, $s1, 0x1
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0xE
    bnez        $v0, .L80043C68
    nop
.L80043D4C:
    jal         func_8002CD28
    nop
.L80043D54:
    lw          $ra, 0x68($sp)
    lw          $s5, 0x64($sp)
    lw          $s4, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end display_frame_dispatch
