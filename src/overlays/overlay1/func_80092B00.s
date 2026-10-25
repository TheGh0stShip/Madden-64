.text
.align 2
.set noreorder
.globl func_80092B00
.ent func_80092B00
func_80092B00:
    and         $v0, $a1, $s4
    sll         $a0, $v0, 2
    addu        $a1, $a0, $s5
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v1, -0x4D58($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6C80
    addu        $a0, $a0, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s7
    lw          $v0, 0x0($v1)
    lw          $a2, 0x0($a0)
    lw          $v1, 0x0($a1)
    lw          $a1, 0x8($v0)
    nor         $v0, $zero, $a2
    and         $s0, $v1, $v0
    and         $v0, $s0, $a1
    beqz        $v0, .L80092B64
    or          $v0, $a2, $a1
    sw          $v0, 0x0($a0)
    lw          $a0, 0x0($a3)
    lbu         $a1, 0x21($a0)
    jal         func_800BDD70
    andi        $a1, $a1, 0x3F
.L80092B64:
    lui         $v0, 0x8009
    lh          $v0, -0x6AE8($v0)
    bne         $s1, $v0, .L80092C64
    addiu       $v0, $s2, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s6
    addu        $v0, $s3, $v0
    lw          $a0, 0x0($v0)
    lbu         $v0, 0x64($a0)
    sltiu       $v1, $v0, 0x1
    xori        $v0, $v0, 0x2
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    beqz        $v1, .L80092C64
    addiu       $v0, $s2, 0x1
    jal         func_800BBA64
    addu        $s0, $a0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addiu       $v0, $v0, 0xFF
    sra         $v0, $v0, 9
    addiu       $v1, $zero, 0x6
    bne         $v0, $v1, .L80092C18
    addu        $a1, $v0, $zero
    lw          $v0, 0x24($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x76EC($v1)
    lw          $a0, 0x1C($v0)
    lui         $v0, 0x3
    addu        $v1, $v1, $v0
    slt         $v1, $v1, $a0
    beqz        $v1, .L80092C1C
    sll         $v0, $a1, 16
    jal         func_800E1C98
    addu        $a0, $s0, $zero
    jal         func_800C9FB4
    addu        $a0, $s0, $zero
    j           func_8008E540
    addiu       $v0, $s2, 0x1
.L80092C18:
    sll         $v0, $a1, 16
.L80092C1C:
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x2
    bne         $v0, $v1, .L80092C64
    addiu       $v0, $s2, 0x1
    lw          $v0, 0x24($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x76F0($v1)
    lw          $a0, 0x1C($v0)
    lui         $v0, 0xFFFD
    addu        $v1, $v1, $v0
    slt         $a0, $a0, $v1
    beqz        $a0, .L80092C64
    addiu       $v0, $s2, 0x1
    jal         func_800E1C98
    addu        $a0, $s0, $zero
    jal         func_800CA120
    addu        $a0, $s0, $zero
    addiu       $v0, $s2, 0x1
.L80092C64:
    addu        $s2, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srl         $v1, $v1, 1
    slt         $v0, $v0, $v1
    beqz        $v0, .L80092E2C
    nop
    j           func_8008DF00
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x751C($a0)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lb          $v0, 0x6DDC($at)
    bnez        $v0, .L80092CB4
    nop
    jal         func_80091E2C
    nop
.L80092CB4:
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x78A8
    andi        $v0, $v0, 0xFF3F
    sll         $v0, $v0, 16
    sra         $a1, $v0, 14
    addu        $a0, $a1, $a2
    lw          $v0, 0x0($a0)
    sll         $v1, $v1, 2
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sw          $v0, -0x4CA0($at)
    addu        $v0, $fp, $zero
    beqz        $v0, .L80092D0C
    nop
    lw          $v0, 0x0($a0)
    lui         $at, 0x8009
    addu        $at, $at, $a1
    sw          $v0, -0x6C80($at)
.L80092D0C:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $v0, $v0, 1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $v1, 0x69D0($at)
    bnez        $v1, .L80092E2C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
    slt         $v0, $v1, $v0
    beqz        $v0, .L80092E2C
    addu        $s2, $zero, $zero
    lui         $s4, 0x8008
    addiu       $s4, $s4, 0x5040
    addu        $s3, $a2, $zero
    lui         $s1, 0x8007
    addiu       $s1, $s1, 0x2720
.L80092D58:
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s4
    sll         $v1, $s2, 16
    sra         $v1, $v1, 14
    addu        $a3, $v1, $v0
    lw          $v0, 0x0($a3)
    lbu         $a0, 0x21($v0)
    addiu       $v0, $zero, 0x40
    andi        $v1, $a0, 0xC0
    bne         $v1, $v0, .L80092E08
    addiu       $v0, $s2, 0x1
    andi        $v0, $a0, 0x3F
    sll         $a0, $v0, 2
    addu        $a1, $a0, $s3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v1, -0x4D58($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x6C80
    addu        $a0, $a0, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s1
    lw          $v0, 0x0($v1)
    lw          $a2, 0x0($a0)
    lw          $v1, 0x0($a1)
    lw          $a1, 0x8($v0)
    nor         $v0, $zero, $a2
    and         $s0, $v1, $v0
    and         $v0, $s0, $a1
    beqz        $v0, .L80092E08
    addiu       $v0, $s2, 0x1
    or          $v0, $a2, $a1
    sw          $v0, 0x0($a0)
    lw          $a0, 0x0($a3)
    lbu         $a1, 0x21($a0)
    jal         func_800BDD70
    andi        $a1, $a1, 0x3F
    addiu       $v0, $s2, 0x1
.L80092E08:
    addu        $s2, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srl         $v1, $v1, 1
    slt         $v0, $v0, $v1
    bnez        $v0, .L80092D58
    nop
.L80092E2C:
    lw          $ra, 0x64($sp)
    lw          $fp, 0x60($sp)
    lw          $s7, 0x5C($sp)
    lw          $s6, 0x58($sp)
    lw          $s5, 0x54($sp)
    lw          $s4, 0x50($sp)
    lw          $s3, 0x4C($sp)
    lw          $s2, 0x48($sp)
    lw          $s1, 0x44($sp)
    lw          $s0, 0x40($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end func_80092B00
