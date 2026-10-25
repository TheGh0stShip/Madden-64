.text
.align 2
.set noreorder
.globl func_800B24F4
.ent func_800B24F4
func_800B24F4:
    lui         $v1, 0x8007
    lh          $v1, -0x463A($v1)
    addiu       $sp, $sp, -0x38
    sw          $s3, 0x24($sp)
    lhu         $s3, 0x4A($sp)
    sw          $s4, 0x28($sp)
    addu        $s4, $a1, $zero
    sw          $s1, 0x1C($sp)
    addu        $s1, $a2, $zero
    sw          $s5, 0x2C($sp)
    addu        $s5, $a3, $zero
    addiu       $v0, $zero, -0x1
    sw          $ra, 0x30($sp)
    sw          $s2, 0x20($sp)
    bne         $v1, $v0, . + 4 + (0x1CB << 2)
    sw          $s0, 0x18($sp)
    jal         func_800AD404
    nop
    jal         func_800AD49C
    nop
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    jal         func_800209AC
    nop
    addiu       $v1, $zero, 0x4
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x5A58
    addu        $s2, $v0, $zero
    lui         $at, 0x8007
    sw          $v1, -0x4674($at)
    lui         $at, 0x8007
    sw          $zero, -0x4664($at)
    lui         $at, 0x8007
    sw          $zero, -0x4670($at)
    lui         $at, 0x8007
    sw          $a1, -0x466C($at)
    lw          $a0, 0x4($s2)
    lbu         $v0, 0x1E($a0)
    lbu         $a0, 0x1F($a0)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x1860
    sll         $a0, $a0, 1
    addu        $v0, $v1, $v0
    addu        $a0, $a0, $v0
    lh          $a0, 0x0($a0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xD77($at)
    jal         func_800167FC
    nop
    lw          $v0, 0x4($s2)
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lbu         $a0, 0x1E($v0)
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    bne         $a0, $v0, .L800B2624
    andi        $v1, $v1, 0x1
    xori        $v0, $v1, 0x1
    beqz        $v0, .L800B263C
    nop
    j           func_800ADF08
    nop
.L800B2624:
    beqz        $v1, .L800B263C
    nop
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4244
    j           func_800ADF20
    nop
.L800B263C:
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x423C
    lui         $at, 0x8007
    sw          $v0, -0x4668($at)
    lw          $a0, 0x4($s2)
    jal         func_800AD124
    nop
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x1E9C
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x4664
    addiu       $a1, $s0, -0x10
    lui         $v1, 0x8009
    lh          $v1, -0x6A2E($v1)
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x46B8
    addiu       $a3, $zero, 0x1F4
    sw          $v0, 0x0($s0)
    jal         func_8003DDF8
    sw          $v1, 0x10($sp)
    lhu         $v1, 0x0($s2)
    lui         $a0, 0x8008
    lh          $a0, 0x7768($a0)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $v1, 0x8007
    lw          $v1, -0x46B4($v1)
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $v0, -0x6128($at)
    sw          $v1, 0x0($s0)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5A58
    lui         $at, 0x8007
    sw          $v0, -0x4670($at)
    addiu       $v0, $zero, -0x2
    lui         $at, 0x8007
    sw          $s0, -0x466C($at)
    bne         $a0, $v0, .L800B26F8
    nop
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x2110
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    j           func_800AE114
    nop
.L800B26F8:
    lui         $v1, 0x8008
    lhu         $v1, 0x777C($v1)
    andi        $v0, $v1, 0x4
    beqz        $v0, .L800B2724
    nop
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x20B8
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    j           func_800AE114
    nop
.L800B2724:
    lui         $v0, 0x8008
    lh          $v0, 0x777E($v0)
    bnez        $v0, .L800B274C
    andi        $v0, $v1, 0x2
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x20A4
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    j           func_800AE114
    nop
.L800B274C:
    beqz        $v0, .L800B27BC
    andi        $v0, $v1, 0x8
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    blez        $v0, .L800B27A4
    nop
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x20C8
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    jal         func_8004DF94
    addu        $a0, $s0, $zero
    lui         $a1, 0x8009
    lh          $a1, -0x6CE0($a1)
    jal         func_800AB2D0
    addu        $a0, $v0, $s0
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x20C0
    jal         func_8002E688
    addu        $a0, $s0, $zero
    j           func_800AE114
    nop
.L800B27A4:
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x20DC
    jal         func_8002E65C
    addu        $a0, $s0, $zero
    j           func_800AE114
    nop
.L800B27BC:
    beqz        $v0, .L800B27E0
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    addiu       $v0, $v0, 0xA0
    slti        $v0, $v0, 0x320
    xori        $v0, $v0, 0x1
    negu        $v0, $v0
    j           func_800AE0E8
    ori         $v0, $v0, 0xA
.L800B27E0:
    lui         $a1, 0x8008
    lw          $a1, 0x793C($a1)
    lui         $v0, 0x320
    beq         $a1, $v0, .L800B2808
    sll         $a0, $s1, 16
    sra         $a0, $a0, 16
    jal         func_800B932C
    sra         $a1, $a1, 16
    j           func_800AE0E8
    nop
.L800B2808:
    addiu       $v0, $zero, -0x1
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x5A58
    sll         $a1, $s4, 16
    sra         $a1, $a1, 16
    sll         $a2, $v0, 16
    sra         $a2, $a2, 16
    lh          $v0, 0x10($s2)
    sll         $a3, $s1, 16
    sra         $a3, $a3, 16
    jal         func_800AB074
    sw          $v0, 0x10($sp)
    lui         $v0, 0x8009
    lhu         $v0, -0x7F50($v0)
    lui         $v1, 0x8008
    addiu       $v1, $v1, 0x5A80
    lui         $at, 0x8007
    sw          $v1, -0x4668($at)
    addiu       $v0, $v0, 0x2
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    sltiu       $v0, $v1, 0x9
    beqz        $v0, . + 4 + (0x2E << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1008($at)
    jr          $v0
    nop
.end func_800B24F4
