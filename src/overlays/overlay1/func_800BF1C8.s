.text
.align 2
.set noreorder
.globl func_800BF1C8
.ent func_800BF1C8
func_800BF1C8:
    sw          $s0, 0x18($sp)
    lw          $v1, 0x0($a0)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, . + 4 + (0x37 << 2)
    addu        $s2, $zero, $zero
    addiu       $s3, $zero, 0x10
    addu        $s4, $a0, $zero
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x78A8
    sll         $v0, $s2, 16
    sra         $v0, $v0, 14
    addu        $s1, $v0, $a0
    lh          $a0, 0x2($s1)
    jal         func_80030B54
    nop
    lh          $a0, 0x2($s1)
    jal         func_80030E84
    addu        $s0, $v0, $zero
    addiu       $v1, $zero, 0x1
    bne         $v0, $v1, . + 4 + (0x18 << 2)
    sll         $v0, $s2, 16
    lh          $a0, 0x2($s1)
    addiu       $a1, $sp, 0x10
    jal         func_80030EF4
    addiu       $a2, $sp, 0x11
    lbu         $v1, 0x10($sp)
    bne         $v1, $s3, .L800BF244
    addiu       $v0, $zero, -0xF01
    lbu         $v0, 0x11($sp)
    beq         $v0, $s3, .L800BF274
    addiu       $v0, $zero, -0xF01
.L800BF244:
    beq         $v1, $s3, .L800BF25C
    and         $s0, $s0, $v0
    sltiu       $v0, $v1, 0x11
    bnel        $v0, $zero, .L800BF25C
    ori         $s0, $s0, 0x200
    ori         $s0, $s0, 0x100
.L800BF25C:
    lbu         $v0, 0x11($sp)
    beq         $v0, $s3, .L800BF274
    sltiu       $v0, $v0, 0x11
    bnel        $v0, $zero, .L800BF274
    ori         $s0, $s0, 0x400
    ori         $s0, $s0, 0x800
.L800BF274:
    sll         $v0, $s2, 16
.end func_800BF1C8
