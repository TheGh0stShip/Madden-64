.text
.align 2
.set noreorder
.globl interface_state_process
.ent interface_state_process
interface_state_process:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    lui         $v0, 0x8007
    lw          $v0, 0x40E8($v0)
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    subu        $v0, $v0, $v1
    lui         $at, 0x8007
    sw          $v0, 0x40E8($at)
    bgtz        $v0, .L80041AF4
    nop
.L80041A74:
    jal         func_80031A1C
    addiu       $a0, $zero, 0xA
    lui         $v1, 0x8009
    lw          $v1, -0x7F88($v1)
    andi        $s1, $v0, 0xFFFF
    beq         $v1, $s1, .L80041A74
    nop
    jal         func_8003CBB8
    nop
    addiu       $a0, $zero, 0x1F
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $s0, $v0, 2
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 1
    addiu       $s0, $s0, 0x2D
    sll         $s0, $s0, 16
    jal         func_80031A1C
    sra         $s0, $s0, 16
    addiu       $a0, $s1, 0x33
    sll         $v0, $v0, 16
    addu        $a1, $s0, $zero
    jal         func_8003CE88
    sra         $a2, $v0, 16
    lui         $at, 0x8009
    sw          $s1, -0x7F88($at)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x78
    andi        $v0, $v0, 0xFFFF
    addiu       $v0, $v0, 0x258
    lui         $at, 0x8007
    sw          $v0, 0x40E8($at)
.L80041AF4:
    lui         $v1, 0x8009
    lhu         $v1, -0x6CE0($v1)
    addiu       $v0, $v1, 0x1
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L80041B94
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    beqz        $v0, .L80041B94
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1
    bnez        $v0, .L80041B94
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x3
    beq         $v0, $v1, .L80041B84
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x4F34($v0)
    sra         $v0, $v0, 20
    slti        $v0, $v0, 0x1A
    bnez        $v0, .L80041B94
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x4EE0($v0)
    lui         $v1, 0x8008
    lhu         $v1, 0x2D94($v1)
    subu        $v0, $v0, $v1
    bltzl       $v0, .L80041B78
    negu        $v0, $v0
.L80041B78:
    slti        $v0, $v0, 0x7
    beqz        $v0, .L80041B94
    nop
.L80041B84:
    jal         func_80041850
    addiu       $a0, $zero, 0x2
    j .L80041B9C
    nop
.L80041B94:
    jal         func_800418F8
    nop
.L80041B9C:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end interface_state_process
