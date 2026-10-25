.text
.align 2
.set noreorder
.globl func_80092664
.ent func_80092664
func_80092664:
    bne         $v1, $v0, . + 4 + (0x17F << 2)
    addiu       $v0, $s2, 0x1
    sll         $v0, $a0, 5
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x2DB4($at)
    lh          $v0, 0x2($v0)
    bne         $s1, $v0, .L800926BC
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8007
    lh          $v1, -0x4844($v1)
    bne         $v1, $v0, .L800926E4
    addu        $v0, $fp, $zero
    addiu       $v0, $zero, 0x1
.L800926BC:
    bne         $s1, $v0, .L800926D4
    nop
    lui         $v0, 0x8007
    lh          $v0, -0x4844($v0)
    beq         $v0, $s1, .L800926E4
    addu        $v0, $fp, $zero
.L800926D4:
    lui         $v0, 0x8009
    lbu         $v0, -0x503A($v0)
    beqz        $v0, . + 4 + (0x108 << 2)
    addu        $v0, $fp, $zero
.L800926E4:
    bnez        $v0, . + 4 + (0xFE << 2)
    sll         $v0, $s2, 16
    lui         $a1, 0x8009
    lh          $a1, -0x751C($a1)
    sra         $s1, $v0, 14
    lui         $a2, 0x8009
    addiu       $a2, $a2, -0x4CA0
    sll         $v1, $a1, 1
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 3
    addu        $v1, $v1, $s6
    addu        $v1, $s1, $v1
    lw          $v0, 0x0($v1)
    sll         $a1, $a1, 2
    addu        $a1, $a1, $a2
    lbu         $a0, 0x21($v0)
    lw          $a2, 0x0($a1)
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    and         $a0, $a0, $s4
    sll         $a0, $a0, 2
    addu        $a0, $a0, $s5
    and         $v0, $v0, $s4
    sll         $v0, $v0, 16
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s5
    lw          $v0, 0x0($v0)
    lw          $a0, 0x0($a0)
    sw          $v0, 0x0($a1)
    lw          $v0, 0x0($v1)
    lbu         $v0, 0x21($v0)
    and         $v0, $v0, $s4
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v1, 0x0($v0)
    lw          $v0, 0x8($v1)
    nor         $a2, $zero, $a2
    and         $s0, $a0, $a2
    and         $v0, $s0, $v0
    beqz        $v0, . + 4 + (0x2D << 2)
    nop
    jal         func_8008F318
    nop
    sll         $v0, $v0, 16
    beqz        $v0, . + 4 + (0xCD << 2)
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x69D6($v0)
    bgez        $v0, .L800927C8
    nop
    jal         func_8008F624
    nop
.L800927C8:
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sll         $a0, $v0, 1
    addu        $a0, $a0, $v0
    sll         $a0, $a0, 2
    subu        $a0, $a0, $v0
    sll         $a0, $a0, 3
    addu        $a0, $a0, $s6
    addu        $a0, $s1, $a0
    lw          $v0, 0x0($a0)
    lbu         $a1, 0x21($v0)
    and         $a1, $a1, $s4
    lui         $at, 0x8009
    addu        $at, $at, $a1
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s7
    lw          $v0, 0x0($v0)
    lw          $v1, 0x8($v0)
    sll         $a1, $a1, 2
    addiu       $v0, $zero, -0xF01
    or          $v1, $s0, $v1
    and         $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a1
    sw          $v1, -0x6C80($at)
.end func_80092664
