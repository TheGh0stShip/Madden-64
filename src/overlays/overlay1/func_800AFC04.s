.text
.align 2
.set noreorder
.globl func_800AFC04
.ent func_800AFC04
func_800AFC04:
    addiu       $sp, $sp, -0x68
    addiu       $a3, $sp, 0x18
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0xEE8
    or          $v0, $a3, $a2
    andi        $v0, $v0, 0x3
    sw          $ra, 0x60($sp)
    sw          $s3, 0x5C($sp)
    sw          $s2, 0x58($sp)
    sw          $s1, 0x54($sp)
    beqz        $v0, .L800AFC8C
    sw          $s0, 0x50($sp)
    addiu       $t0, $a2, 0x20
.L800AFC38:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    lwl         $a0, 0x8($a2)
    lwr         $a0, 0xB($a2)
    lwl         $a1, 0xC($a2)
    lwr         $a1, 0xF($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a0, 0x8($a3)
    swr         $a0, 0xB($a3)
    swl         $a1, 0xC($a3)
    swr         $a1, 0xF($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L800AFC38
    addiu       $a3, $a3, 0x10
    j           func_800AB598
    nop
.L800AFC8C:
    addiu       $t0, $a2, 0x20
.L800AFC90:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L800AFC90
    addiu       $a3, $a3, 0x10
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L800B02E4
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x100
    bnez        $v0, .L800B016C
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7758($v0)
    slti        $v0, $v0, 0xB
    bnez        $v0, .L800B016C
    addiu       $v0, $zero, 0x4
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x57C0
    lh          $v1, 0x0($s0)
    bne         $v1, $v0, .L800AFD58
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    bnel        $v1, $v0, .L800AFD58
    sh          $zero, 0x0($s0)
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0xF10
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    lb          $v0, 0x4($v0)
    sltiu       $v1, $v0, 0x1
    xori        $v0, $v0, 0x15
    sltiu       $v0, $v0, 0x1
    or          $v1, $v1, $v0
    bnel        $v1, $zero, .L800AFD58
    sh          $zero, 0x0($s0)
.L800AFD58:
    lui         $v1, 0x8008
    lh          $v1, 0x57C0($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800AFDE4
    addiu       $v0, $zero, 0x2
    lui         $v1, 0x8008
    lh          $v1, 0x57C8($v1)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L800B0174
    nop
    jal         func_80031964
    nop
    andi        $v0, $v0, 0xC00
    addiu       $v1, $zero, 0xC00
    bne         $v0, $v1, .L800B0174
    addu        $s0, $zero, $zero
    addu        $s1, $zero, $zero
.L800AFD9C:
    lui         $a0, 0x8009
    lhu         $a0, -0x751C($a0)
    andi        $a1, $s1, 0xFFFF
    jal         func_800280FC
    addiu       $s1, $s1, 0x1
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $s0, $s0, $v0
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x6
    bnez        $v0, .L800AFD9C
    slti        $v0, $s0, 0x5
    bnez        $v0, .L800B0174
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, 0x57C0($at)
    j           func_800ABA50
    nop
.L800AFDE4:
    lui         $v1, 0x8009
    lh          $v1, -0x6B06($v1)
    bne         $v1, $v0, .L800AFE14
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    lui         $v0, 0x8008
    lh          $v0, 0x7748($v0)
    beq         $v1, $v0, .L800AFE14
    nop
    lui         $at, 0x8009
    sh          $zero, -0x6B06($at)
.L800AFE14:
    lui         $v0, 0x8009
    lh          $v0, -0x6B06($v0)
    bnez        $v0, .L800AFEC8
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8009
    lh          $v1, -0x5A50($v1)
    bne         $v1, $v0, .L800AFEC8
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addu        $a0, $v1, $zero
    xori        $v0, $v1, 0x2
    sltiu       $v0, $v0, 0x1
    xori        $v1, $v1, 0x4
    sltiu       $v1, $v1, 0x1
    or          $v0, $v0, $v1
    beqz        $v0, .L800AFE88
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x79
    beqz        $v0, .L800AFE88
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x6B06($at)
    lui         $at, 0x8008
    sh          $a0, 0x7748($at)
    lui         $at, 0x8008
    sh          $v0, 0x6C6C($at)
.L800AFE88:
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L800AFEC8
    addu        $a0, $v1, $zero
    lui         $v0, 0x8008
    lh          $v0, 0x7AAC($v0)
    slti        $v0, $v0, 0x79
    beqz        $v0, .L800AFEC8
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x6B06($at)
    lui         $at, 0x8008
    sh          $a0, 0x7748($at)
    lui         $at, 0x8008
    sh          $v0, 0x6C6C($at)
.L800AFEC8:
    lui         $v1, 0x8009
    lh          $v1, -0x6B06($v1)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B0174
    nop
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    lui         $v0, 0x8008
    lh          $v0, 0x7748($v0)
    beq         $v1, $v0, .L800AFF04
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8009
    sh          $v0, -0x6B06($at)
    j           func_800ABBB8
    nop
.L800AFF04:
    lui         $a0, 0x8000
    addiu       $a0, $a0, 0xF10
    jal         func_80037108
    addiu       $a1, $zero, 0x1
    addu        $a1, $zero, $zero
    addu        $s1, $zero, $zero
    addiu       $t2, $zero, 0xFF
    lui         $t0, 0x8008
    lh          $t0, 0x76DC($t0)
    addu        $a0, $v0, $zero
    lb          $v0, 0x4($a0)
    addiu       $t1, $zero, 0x3
    lui         $a3, 0x8008
    lh          $a3, 0x6C6C($a3)
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v0, $v1, 4
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    addiu       $v0, $v0, 0x42
    addu        $a2, $a0, $v0
    andi        $v0, $a1, 0xFFFF
.L800AFF5C:
    sll         $v1, $v0, 1
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    addu        $s3, $a2, $v1
    lbu         $v0, 0x0($s3)
    beql        $v0, $t2, .L800AFFD4
    addiu       $a1, $a1, 0x1
    lbu         $v0, 0x4($s3)
    andi        $v0, $v0, 0xF
    beql        $v0, $zero, .L800AFFD4
    addiu       $a1, $a1, 0x1
    lb          $v0, 0x5($s3)
    bnel        $v0, $zero, .L800AFFD4
    addiu       $a1, $a1, 0x1
    bnel        $t0, $t1, .L800AFFC4
    addiu       $s1, $s1, 0x1
    lbu         $a0, 0x2($s3)
    lbu         $v1, 0x3($s3)
    sltu        $v0, $v1, $a0
    bnez        $v0, .L800AFFB4
    subu        $v0, $a0, $v1
    subu        $v0, $v1, $a0
.L800AFFB4:
    slti        $v0, $v0, 0x4
    beqz        $v0, .L800AFFC8
    andi        $v0, $s1, 0xFFFF
    addiu       $s1, $s1, 0x1
.L800AFFC4:
    andi        $v0, $s1, 0xFFFF
.L800AFFC8:
    beq         $v0, $a3, .L800AFFEC
    andi        $v1, $s1, 0xFFFF
    addiu       $a1, $a1, 0x1
.L800AFFD4:
    andi        $v0, $a1, 0xFFFF
    sltiu       $v0, $v0, 0xF
    bnez        $v0, .L800AFF5C
    andi        $v0, $a1, 0xFFFF
    ori         $s1, $zero, 0xFFFF
    andi        $v1, $s1, 0xFFFF
.L800AFFEC:
    ori         $v0, $zero, 0xFFFF
    beq         $v1, $v0, .L800B0148
    addiu       $v0, $zero, 0x6
    lui         $s2, 0x8007
    addiu       $s2, $s2, -0x4674
    sw          $v0, 0x0($s2)
    lbu         $v1, 0x1($s3)
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x6C40
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a0
    lui         $at, 0x8007
    sw          $v0, -0x4670($at)
    lbu         $v1, 0x0($s3)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 1
    addu        $v0, $v0, $a0
    lui         $at, 0x8007
    sw          $v0, -0x466C($at)
    lbu         $a0, 0x3($s3)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x5A58
    jal         func_800167FC
    addu        $a1, $s0, $zero
    lbu         $a0, 0x2($s3)
    addiu       $s1, $s0, 0x28
    jal         func_800167FC
    addu        $a1, $s1, $zero
    lui         $at, 0x8007
    sw          $s0, -0x4668($at)
    lui         $at, 0x8007
    sw          $s1, -0x4664($at)
    lbu         $v0, 0x4($s3)
    addiu       $v1, $sp, 0x18
    andi        $v0, $v0, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lbu         $v0, 0x0($v0)
    sb          $v0, 0x50($s0)
    lbu         $v0, 0x4($s3)
    andi        $v0, $v0, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lbu         $v0, 0x1($v0)
    lui         $at, 0x8008
    sb          $v0, 0x5AA9($at)
    lbu         $v0, 0x4($s3)
    addiu       $s0, $s0, 0x50
    andi        $v0, $v0, 0xF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lbu         $a1, 0x2($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x798C($v1)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4694
    lui         $at, 0x8008
    sb          $zero, 0x5AAB($at)
    lui         $at, 0x8007
    sw          $s0, -0x4660($at)
    sw          $v1, 0x0($v0)
    lui         $at, 0x8008
    sb          $a1, 0x5AAA($at)
    jal         func_8001AEA8
    addiu       $a0, $v0, -0x4
    addiu       $a0, $zero, 0x30
    addu        $a1, $s2, $zero
    jal         func_800AACE8
    addiu       $a2, $zero, 0x3
    lui         $v1, 0x8008
    lhu         $v1, 0x6C6C($v1)
    lui         $at, 0x8007
    sh          $v0, -0x4642($at)
    addiu       $v0, $zero, 0x3
    lui         $at, 0x8008
    sh          $v0, 0x57C0($at)
    addiu       $v0, $zero, 0xB4
    lui         $at, 0x8008
    sh          $v0, 0x57CA($at)
    addiu       $v1, $v1, 0x1
    lui         $at, 0x8008
    sh          $v1, 0x6C6C($at)
    j           func_800ABBB8
    nop
.L800B0148:
    lui         $v1, 0x8008
    lhu         $v1, 0x76DC($v1)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8009
    sh          $v0, -0x6B06($at)
    lui         $at, 0x8008
    sh          $v1, 0x7748($at)
    j           func_800ABA50
    nop
.L800B016C:
    lui         $at, 0x8008
    sh          $zero, 0x57C0($at)
.L800B0174:
    lui         $v1, 0x8008
    lh          $v1, 0x57C0($v1)
    beqz        $v1, .L800B02D4
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L800B0208
    slti        $v0, $v1, 0x3
    beqz        $v0, .L800B01A4
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800B01B8
    nop
    j           func_800ABB70
    nop
.L800B01A4:
    addiu       $v0, $zero, 0x4
    beq         $v1, $v0, .L800B01E0
    nop
    j           func_800ABB70
    nop
.L800B01B8:
    lui         $a0, 0x8008
    lhu         $a0, 0x57C8($a0)
    lui         $a1, 0x8008
    lhu         $a1, 0x57C4($a1)
    lui         $a2, 0x8008
    lhu         $a2, 0x57C6($a2)
    jal         func_800AD78C
    nop
    j           func_800ABB68
    nop
.L800B01E0:
    lui         $a0, 0x8008
    lhu         $a0, 0x57C8($a0)
    lui         $a1, 0x8008
    lhu         $a1, 0x57C4($a1)
    lui         $a2, 0x8008
    lhu         $a2, 0x57C6($a2)
    jal         func_800ADA5C
    nop
    j           func_800ABB68
    nop
.L800B0208:
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x4674
    addiu       $v0, $zero, 0x6
    sw          $v0, 0x0($v1)
    addu        $s1, $zero, $zero
    addiu       $s3, $v1, 0x4
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x5A58
.L800B0228:
    lui         $a0, 0x8009
    lhu         $a0, -0x751C($a0)
    andi        $a1, $s1, 0xFFFF
    addiu       $s1, $s1, 0x1
    sll         $s0, $a1, 2
    addu        $v0, $s0, $s3
    addu        $s0, $s0, $a1
    sll         $s0, $s0, 3
    addu        $s0, $s0, $s2
    jal         func_800280FC
    sw          $s0, 0x0($v0)
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    jal         func_800167FC
    addu        $a1, $s0, $zero
    andi        $v0, $s1, 0xFFFF
    sltiu       $v0, $v0, 0x6
    bnez        $v0, .L800B0228
    addiu       $a0, $zero, 0x90
    lui         $a1, 0x8009
    lh          $a1, -0x751C($a1)
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x4674
    jal         func_800AEFF8
    addu        $a3, $zero, $zero
    lui         $at, 0x8007
    sh          $v0, -0x4642($at)
    lui         $a2, 0x8008
    lbu         $a2, 0x57CC($a2)
    addiu       $v0, $zero, 0xB4
    lui         $at, 0x8008
    sh          $v0, 0x57CA($at)
    beqz        $a2, .L800B02DC
    addiu       $a0, $zero, 0x2
    lui         $a3, 0x8008
    lh          $a3, 0x57C4($a3)
    lui         $v0, 0x8008
    lh          $v0, 0x57C6($v0)
    addiu       $a1, $zero, 0x17
    jal         func_800B7DD8
    sw          $v0, 0x10($sp)
    j           func_800ABBB8
    nop
.L800B02D4:
    jal         func_800AF104
    nop
.L800B02DC:
    jal         func_800ABBE0
    nop
.L800B02E4:
    lw          $ra, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end func_800AFC04
