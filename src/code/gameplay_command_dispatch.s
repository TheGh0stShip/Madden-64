.text
.align 2
.set noreorder
.globl gameplay_command_dispatch
.ent gameplay_command_dispatch
gameplay_command_dispatch:
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    jal         func_8000047C
    sw          $s0, 0x20($sp)
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x6924
    jal         func_80032B00
    nop
    jal         func_8002FE10
    addiu       $a0, $zero, 0x10
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x6918
    jal         func_80030258
    nop
    jal         func_80035428
    addiu       $a0, $zero, 0x20
    jal         func_8003C780
    addiu       $a0, $zero, 0x2
    addu        $a0, $zero, $zero
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x2
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x5
    jal         func_8002F594
    nop
    jal         func_80030620
    nop
    addiu       $a0, $zero, 0x3030
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    jal         func_8003190C
    sw          $v0, 0x10($sp)
    lw          $v0, 0x10($sp)
    lui         $at, 0x8009
    sb          $zero, -0x63E8($at)
    beqz        $v0, .L8002EBA8
    addu        $a0, $zero, $zero
    jal         func_80030B9C
    addiu       $a1, $sp, 0x10
    lw          $v1, 0x10($sp)
    addiu       $v0, $zero, 0x1000
    bne         $v1, $v0, .L8002EB28
    addiu       $v0, $zero, 0x2130
    j .L8002EBAC
    addiu       $v0, $zero, 0x2
.L8002EB20:
    j .L8002EB98
    addiu       $s2, $zero, 0x1
.L8002EB28:
    beq         $v1, $v0, .L8002EBA8
    addu        $s1, $zero, $zero
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    blez        $v0, .L8002EB98
    addu        $s2, $zero, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x6DE4
.L8002EB48:
    lbu         $v0, 0x0($s0)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    lui         $at, 0x8008
    sh          $v0, 0x4F6C($at)
    lb          $a0, 0x0($s0)
    jal         func_800E14D0
    nop
    sltiu       $v0, $v0, 0x7B
    beql        $v0, $zero, .L8002EB98
    addiu       $s2, $zero, 0x1
    jal         func_800E1354
    nop
    bnez        $v0, .L8002EB20
    addiu       $s1, $s1, 0x1
    lui         $v0, 0x8008
    lh          $v0, 0x6DA8($v0)
    slt         $v0, $s1, $v0
    bnez        $v0, .L8002EB48
    addiu       $s0, $s0, 0x1
.L8002EB98:
    bnez        $s2, .L8002EBB4
    addiu       $v0, $zero, 0x1
    j .L8002EBAC
    nop
.L8002EBA8:
    addiu       $v0, $zero, 0x3
.L8002EBAC:
    lui         $at, 0x8009
    sb          $v0, -0x63E8($at)
.L8002EBB4:
    lui         $v0, 0x8009
    lbu         $v0, -0x63E8($v0)
    xori        $v1, $v0, 0x3
    sltiu       $v1, $v1, 0x1
    xori        $v0, $v0, 0x1
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L8002EBE0
    nop
    jal         func_8002F038
    nop
.L8002EBE0:
    lui         $v0, 0x8000
    lw          $v0, 0x31C($v0)
    bnez        $v0, .L8002EC48
    addiu       $a0, $zero, 0x83
    addiu       $a1, $zero, 0x1
    lui         $at, 0x8009
    sw          $zero, -0x79E0($at)
    jal         func_8002EE7C
    nop
.L8002EC04:
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    slti        $v0, $v0, 0x78
    bnez        $v0, .L8002EC04
    addiu       $a0, $zero, 0x84
    addu        $a1, $zero, $zero
    lui         $at, 0x8009
    sw          $zero, -0x79E0($at)
    jal         func_8002EE7C
    nop
.L8002EC2C:
    lui         $v0, 0x8009
    lw          $v0, -0x79E0($v0)
    slti        $v0, $v0, 0x96
    bnez        $v0, .L8002EC2C
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8000
    sw          $v0, 0x31C($at)
.L8002EC48:
    jal         func_80035428
    addiu       $a0, $zero, 0x20
    jal         func_8002F838
    nop
    jal         func_80011B4C
    nop
    addu        $a0, $zero, $zero
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x3
    lui         $v0, 0x8009
    lbu         $v0, -0x63E8($v0)
    bnez        $v0, .L8002ECBC
    addu        $a0, $zero, $zero
    jal         func_800218D4
    addiu       $a1, $zero, 0x1
    jal         func_80030778
    nop
    jal         func_80030DF0
    nop
    sw          $v0, 0x10($sp)
    andi        $v0, $v0, 0x2030
    addiu       $v1, $zero, 0x2030
    bne         $v0, $v1, .L8002ECBC
    addiu       $a0, $zero, 0x2
    jal         func_800218D4
    addiu       $a1, $zero, 0x1
    addiu       $a0, $zero, 0x3
    jal         func_800218D4
    addiu       $a1, $zero, 0x1
.L8002ECBC:
    lui         $s2, 0x8009
    addiu       $s2, $s2, -0x4718
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x49F0
    lui         $s0, 0x8009
    addiu       $s0, $s0, 0x8B8
.L8002ECD4:
    jal         func_80030910
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6DD8($v0)
    beq         $v0, $s2, .L8002ECF4
    addu        $a0, $zero, $zero
    bne         $v0, $s1, .L8002ED10
    nop
.L8002ECF4:
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x1
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x4
    lui         $v0, 0x8008
    lw          $v0, 0x6DD8($v0)
.L8002ED10:
    bne         $v0, $s0, .L8002ED34
    addu        $a0, $zero, $zero
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x2
    addiu       $a0, $zero, 0x1
    jal         func_8003C7E4
    addiu       $a1, $zero, 0x5
    jal         func_80011B4C
    nop
.L8002ED34:
    lui         $v0, 0x8008
    lw          $v0, 0x6DD8($v0)
    jalr        $v0
    nop
    jal         func_80030050
    nop
    j .L8002ECD4
    nop
    lw          $ra, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end gameplay_command_dispatch
