.text
.align 2
.set noreorder
.globl func_800AB700
.ent func_800AB700
func_800AB700:
    addiu       $sp, $sp, -0x38
    sw          $s2, 0x28($sp)
    addu        $s2, $a0, $zero
    andi        $v0, $s2, 0xFFFF
    sll         $v0, $v0, 2
    sw          $ra, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $s4, -0x5EE0($at)
    andi        $v0, $a1, 0xC0
    beqz        $v0, .L800AB754
    andi        $a0, $a1, 0xFF3F
    sll         $a0, $a0, 16
    jal         func_80030B54
    sra         $a0, $a0, 16
    j           func_800A7034
    addu        $s3, $v0, $zero
.L800AB754:
    addu        $s3, $zero, $zero
    andi        $s1, $s2, 0xFFFF
    beqz        $s1, .L800AB7D4
    andi        $v0, $s3, 0x8
    beqz        $v0, .L800AB7D4
    sll         $s0, $s1, 1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lhu         $v1, -0x5EAC($at)
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800AB7D8
    andi        $a0, $s2, 0xFFFF
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $a0, -0x5ED7($at)
    jal         func_800393E0
    nop
    sll         $v0, $v0, 16
    beqz        $v0, .L800AB7D8
    andi        $a0, $s2, 0xFFFF
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x4852
    lhu         $v0, 0x0($v1)
    xori        $v0, $v0, 0x2000
    sh          $v0, 0x0($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lhu         $a0, -0x5EB8($at)
    jal         func_800A84E0
    addu        $a1, $s1, $zero
    jal         func_800A9F70
    nop
.L800AB7D4:
    andi        $a0, $s2, 0xFFFF
.L800AB7D8:
    sll         $v0, $a0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $s0, -0x5EE4($at)
    lui         $s1, 0x8008
    addiu       $s1, $s1, -0x5EE4
    addiu       $v0, $zero, 0x1
    beq         $s0, $v0, .L800AB93C
    slti        $v0, $s0, 0x2
    bnez        $v0, .L800AB940
    andi        $v0, $s3, 0x800
    addiu       $v0, $zero, 0x2
    beq         $s0, $v0, .L800AB820
    addiu       $v0, $zero, 0x3
    beq         $s0, $v0, .L800AB904
    xori        $v0, $s2, 0x1
    j           func_800A721C
    andi        $v0, $s3, 0x800
.L800AB820:
    beqz        $a0, .L800AB8F4
    nop
    jal         func_800A9004
    nop
    lui         $v1, 0x8007
    lh          $v1, -0x4854($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800AB878
    xori        $v0, $s2, 0x1
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s1
    lhu         $v0, 0x0($v0)
    beq         $v0, $s0, .L800AB878
    addiu       $v1, $zero, 0x1200
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x1200
    beq         $v0, $v1, .L800AB878
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x4858($at)
.L800AB878:
    lui         $v0, 0x8008
    lhu         $v0, -0x5E9C($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, -0x5E9C($at)
    sll         $v0, $v0, 16
    bgez        $v0, .L800AB940
    andi        $v0, $s3, 0x800
    xori        $v0, $s2, 0x1
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v1, -0x5EE4($at)
    lui         $a0, 0x8008
    addiu       $a0, $a0, -0x5EE4
    addiu       $v0, $zero, 0x2
    bne         $v1, $v0, .L800AB8E0
    andi        $v0, $s2, 0xFFFF
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x4858($at)
    j           func_800A721C
    andi        $v0, $s3, 0x800
.L800AB8E0:
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a0
    addiu       $v1, $zero, 0x3
    j           func_800A7218
    sh          $v1, 0x0($v0)
.L800AB8F4:
    jal         func_800A9004
    addu        $a0, $zero, $zero
    j           func_800A721C
    andi        $v0, $s3, 0x800
.L800AB904:
    andi        $v0, $v0, 0xFFFF
    sll         $v0, $v0, 1
    addu        $v0, $v0, $s1
    lhu         $v0, 0x0($v0)
    bne         $v0, $s0, .L800AB92C
    addiu       $v0, $zero, 0x4
    lui         $at, 0x8007
    sh          $v0, -0x4858($at)
    j           func_800A7374
    nop
.L800AB92C:
    jal         func_800A8CC0
    nop
    j           func_800A7374
    nop
.L800AB93C:
    andi        $v0, $s3, 0x800
.L800AB940:
    beqz        $v0, .L800AB9B0
    andi        $a1, $s2, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x5EB8
    sll         $v0, $a1, 1
    addu        $v1, $v0, $v1
    lhu         $a0, 0x0($v1)
    andi        $s0, $a0, 0xFFFF
    beqz        $s0, .L800AB974
    addiu       $a0, $a0, -0x1
    sh          $a0, 0x0($v1)
    j           func_800A7260
    andi        $a0, $a0, 0xFFFF
.L800AB974:
    lhu         $v0, 0x0($s4)
    addiu       $v0, $v0, -0x1
    andi        $a0, $v0, 0xFFFF
    sh          $v0, 0x0($v1)
    jal         func_800A84E0
    nop
    andi        $v0, $s2, 0xFFFF
    sll         $v0, $v0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, -0x5EB8($at)
    beq         $s0, $v0, .L800AB9B4
    andi        $v0, $s3, 0x400
    jal         func_800A9F48
    nop
.L800AB9B0:
    andi        $v0, $s3, 0x400
.L800AB9B4:
    beqz        $v0, .L800ABA28
    andi        $a1, $s2, 0xFFFF
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x5EB8
    sll         $v0, $a1, 1
    addu        $a2, $v0, $v1
    lhu         $a0, 0x0($a2)
    lhu         $v1, 0x0($s4)
    andi        $s0, $a0, 0xFFFF
    addiu       $v0, $s0, 0x1
    slt         $v0, $v0, $v1
    beqz        $v0, .L800AB9F4
    addiu       $a0, $a0, 0x1
    sh          $a0, 0x0($a2)
    j           func_800A72D8
    andi        $a0, $a0, 0xFFFF
.L800AB9F4:
    sh          $zero, 0x0($a2)
    addu        $a0, $zero, $zero
    jal         func_800A84E0
    nop
    andi        $v0, $s2, 0xFFFF
    sll         $v0, $v0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v0, -0x5EB8($at)
    beq         $s0, $v0, .L800ABA2C
    andi        $a0, $s2, 0xFFFF
    jal         func_800A9F48
    nop
.L800ABA28:
    andi        $a0, $s2, 0xFFFF
.L800ABA2C:
    sll         $v0, $a0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lhu         $v1, -0x5EAC($at)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800ABA80
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800ABA60
    addiu       $v0, $zero, 0x2
    beqz        $v1, .L800ABA70
    nop
    j           func_800A7374
    nop
.L800ABA60:
    beq         $v1, $v0, .L800ABA90
    nop
    j           func_800A7374
    nop
.L800ABA70:
    jal         func_800A7514
    addu        $a1, $s3, $zero
    j           func_800A7374
    nop
.L800ABA80:
    jal         func_800A7398
    addu        $a1, $s3, $zero
    j           func_800A7374
    nop
.L800ABA90:
    jal         func_800A76E8
    addu        $a1, $s3, $zero
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800AB700
