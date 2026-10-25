.text
.align 2
.set noreorder
.globl func_8009360C
.ent func_8009360C
func_8009360C:
    andi        $v1, $a1, 0xC0
    bne         $v1, $v0, .L800937A8
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
    bne         $a2, $v0, .L80093748
    and         $v0, $a1, $s3
    sll         $v0, $v0, 2
    addu        $v1, $v0, $s6
    lw          $s0, 0x0($v1)
    addu        $v0, $v0, $s5
    sw          $s0, 0x0($v0)
    lw          $v0, 0x0($a3)
    lbu         $v0, 0x21($v0)
    and         $v0, $v0, $s3
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    lw          $v0, 0x0($v0)
    lw          $v0, 0x8($v0)
    and         $v0, $s0, $v0
    beqz        $v0, .L800937A8
    addiu       $v0, $s2, 0x1
    jal         func_8008F318
    nop
    sll         $v0, $v0, 16
    beqz        $v0, .L800937A8
    addiu       $v0, $s2, 0x1
    lui         $v0, 0x8008
    lh          $v0, 0x69D6($v0)
    bgez        $v0, .L800936C8
    nop
    jal         func_8008F624
    nop
.L800936C8:
    lui         $v0, 0x8009
    lh          $v0, -0x7920($v0)
    sll         $a1, $v0, 1
    addu        $a1, $a1, $v0
    sll         $a1, $a1, 2
    subu        $a1, $a1, $v0
    sll         $a1, $a1, 3
    addu        $a1, $a1, $s7
    addu        $a1, $s1, $a1
    lw          $v0, 0x0($a1)
    lbu         $v1, 0x21($v0)
    and         $v1, $v1, $s3
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lb          $v0, -0x4D58($at)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    lw          $v0, 0x0($v0)
    sll         $v1, $v1, 2
    lw          $a0, 0x8($v0)
    addu        $v1, $v1, $s5
    addiu       $v0, $zero, -0xF01
    or          $a0, $s0, $a0
    and         $a0, $a0, $v0
    sw          $a0, 0x0($v1)
    lw          $v0, 0x0($a1)
    lbu         $v0, 0x21($v0)
    and         $v0, $v0, $s3
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s6
    j           func_8008F080
    sw          $s0, 0x0($v0)
.L80093748:
    sll         $v1, $v0, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lb          $v0, -0x4D58($at)
    addu        $a0, $v1, $s6
    addu        $a1, $v1, $s5
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    lw          $v1, 0x0($v0)
    lw          $v0, 0x0($a1)
    lw          $a0, 0x0($a0)
    lw          $v1, 0x8($v1)
    nor         $v0, $zero, $v0
    and         $s0, $a0, $v0
    and         $v0, $s0, $v1
    beqz        $v0, .L800937A8
    addiu       $v0, $s2, 0x1
    or          $v0, $s0, $v1
    sw          $v0, 0x0($a1)
    lw          $a0, 0x0($a3)
    lbu         $a1, 0x21($a0)
    jal         func_800BDD70
    andi        $a1, $a1, 0x3F
    addiu       $v0, $s2, 0x1
.L800937A8:
    addu        $s2, $v0, $zero
    lui         $v1, 0x8009
    lhu         $v1, -0x498E($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    srl         $v1, $v1, 1
    slt         $v0, $v0, $v1
    beqz        $v0, . + 4 + (0x91 << 2)
    nop
    j           func_8008EEAC
    nop
.end func_8009360C
