.text
.align 2
.set noreorder
.globl func_80093110
.ent func_80093110
func_80093110:
    sh          $v1, 0x0($v0)
    lui         $s5, 0x8008
    lb          $s5, 0x5026($s5)
    bne         $s5, $t1, . + 4 + (0x9C << 2)
    addu        $s3, $zero, $zero
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, . + 4 + (0x95 << 2)
    addu        $s4, $zero, $zero
    jal         func_8003BF54
    andi        $a0, $t0, 0xFFFF
    lui         $a1, 0x8009
    lh          $a1, -0x7920($a1)
    addiu       $a0, $zero, 0x140
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $a1, 5
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a1
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $s0, 0xCF7($at)
    sll         $v1, $v0, 4
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 1
    jal         func_80031A1C
    addu        $s0, $s0, $v1
    andi        $v0, $v0, 0xFFFF
    slt         $v0, $v0, $s0
    bnez        $v0, .L800931EC
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    sll         $v0, $v1, 5
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lh          $v1, 0x2DC0($at)
    addiu       $v0, $zero, 0xF
    bne         $v1, $v0, . + 4 + (0x68 << 2)
    nop
.L800931EC:
    jal         func_800DD524
    addu        $a0, $zero, $zero
    addu        $s1, $v0, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x6A24($v0)
    andi        $v1, $s1, 0x1FFF
    sll         $s3, $v1, 2
    addu        $v0, $s3, $v0
    lw          $v0, 0x4($v0)
    lui         $v1, 0x8009
    lh          $v1, -0x7920($v1)
    lbu         $a0, 0x0($v0)
.end func_80093110
