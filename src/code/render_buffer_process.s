.text
.align 2
.set noreorder
.globl render_buffer_process
.ent render_buffer_process
render_buffer_process:
    addiu       $sp, $sp, -0x28
    sw          $s2, 0x20($sp)
    addu        $s2, $zero, $zero
    sw          $s0, 0x18($sp)
    addu        $s0, $zero, $zero
    sw          $s1, 0x1C($sp)
    lui         $s1, 0x8009
    addiu       $s1, $s1, -0x4860
    sw          $ra, 0x24($sp)
    addu        $a0, $zero, $zero
.L800116E0:
    jal         func_80032E00
    addiu       $a1, $zero, 0xA0
    sll         $v1, $s0, 16
    sra         $v1, $v1, 14
    addu        $v1, $v1, $s1
    sw          $v0, 0x0($v1)
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x40
    bnez        $v0, .L800116E0
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x320
    lui         $at, 0x8009
    sw          $v0, -0x4760($at)
    lui         $s0, 0x8000
    addiu       $s0, $s0, 0x410
    jal         func_80035674
    addu        $a0, $s0, $zero
    addu        $a0, $v0, $zero
    andi        $v1, $a0, 0xFFFF
    ori         $v0, $zero, 0xFFFF
    bnel        $v1, $v0, .L80011760
    andi        $s0, $a0, 0xFFFF
    addu        $a0, $s0, $zero
    jal         func_800356C4
    addiu       $a1, $zero, 0x2B8
    addu        $a0, $v0, $zero
    addiu       $s2, $zero, 0x1
    andi        $s0, $a0, 0xFFFF
.L80011760:
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addiu       $a1, $zero, 0x20
    lhu         $a1, 0x0($v0)
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x6D34($at)
    lui         $at, 0x8008
    sw          $v0, 0x6CA4($at)
    jal         func_80032E00
    addiu       $a1, $a1, -0x6
    lui         $a1, 0x8008
    lw          $a1, 0x6CA4($a1)
    lhu         $a2, 0x0($a1)
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    sw          $a0, 0x76D8($at)
    addiu       $a1, $a1, 0x6
    jal         func_8002E17C
    addiu       $a2, $a2, -0x6
    addu        $a0, $s0, $zero
    jal         func_80035D7C
    addiu       $a1, $zero, 0x1F
    lw          $a1, 0x0($v0)
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x6D34($at)
    lui         $at, 0x8008
    sw          $v0, 0x6C70($at)
    jal         func_80032E00
    addiu       $a1, $a1, -0x8
    lui         $a1, 0x8008
    lw          $a1, 0x6C70($a1)
    lw          $a2, 0x0($a1)
    addu        $a0, $v0, $zero
    lui         $at, 0x8006
    sw          $a0, 0x551C($at)
    addiu       $a1, $a1, 0x8
    jal         func_8002E17C
    addiu       $a2, $a2, -0x8
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addiu       $a1, $zero, 0x20
    addu        $a0, $s0, $zero
    jal         func_80035F88
    addiu       $a1, $zero, 0x1F
    beqz        $s2, .L80011828
    nop
    jal         func_80035A7C
    addu        $a0, $s0, $zero
.L80011828:
    lui         $v1, 0x8008
    lw          $v1, 0x6DD8($v1)
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x8B8
    bne         $v1, $v0, .L800118E0
    nop
    lui         $v1, 0x8007
    lbu         $v1, 0x1C50($v1)
    sll         $v0, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x6CC8($at)
    lw          $a0, 0x8($v0)
    lui         $v0, 0x8007
    lhu         $v0, 0x1C48($v0)
    addiu       $v1, $v1, -0x1
    sll         $v1, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a1, 0x5158($at)
    lw          $a0, 0x8($a0)
    jal         func_8002E17C
    addiu       $a2, $zero, 0x200
    lui         $v0, 0x8007
    lbu         $v0, 0x1C50($v0)
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, 0x6CC8($at)
    jal         func_80016FE4
    nop
    lui         $v0, 0x8007
    lhu         $v0, 0x1C48($v0)
    addiu       $v0, $v0, 0x1
    lui         $at, 0x8007
    sh          $v0, 0x1C48($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, .L800118E0
    nop
    lui         $at, 0x8007
    sh          $zero, 0x1C48($at)
.L800118E0:
    lw          $ra, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end render_buffer_process
