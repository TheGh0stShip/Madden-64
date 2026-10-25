.text
.align 2
.set noreorder
.globl func_8009CA5C
.ent func_8009CA5C
func_8009CA5C:
    bnez        $a2, .L8009CA68
    nop
    break       7
.L8009CA68:
    addiu       $at, $zero, -0x1
    bne         $a2, $at, .L8009CA80
    lui         $at, 0x8000
    bne         $a1, $at, .L8009CA80
    nop
    break       6
.L8009CA80:
    .word       0x0000B012  # mflo        $s6
    bnez        $a3, .L8009CA9C
    sh          $v1, 0x36($s1)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addu        $a1, $s0, $zero
    sw          $v0, 0x4($s1)
.L8009CA9C:
    addu        $a0, $zero, $zero
    lw          $a1, 0x4($s1)
    addu        $a2, $s0, $zero
    jal         func_80033308
    addu        $a3, $zero, $zero
    lhu         $v0, 0x36($s1)
    lw          $a3, 0x4($s1)
    srl         $s0, $v0, 1
    addu        $v0, $s0, $zero
    beqz        $v0, .L8009CB34
    addiu       $s0, $s0, -0x1
    sll         $t0, $s4, 1
    addiu       $t1, $zero, -0x20
    addiu       $a2, $zero, -0x1
    addiu       $a0, $a3, 0x1C
    sll         $v0, $s5, 1
    addu        $a1, $a3, $v0
.L8009CAE0:
    lhu         $v0, 0x2C($s1)
    sh          $v0, 0x0($a1)
    addu        $v0, $t0, $a3
    sh          $t1, 0x8($v0)
    lw          $v1, 0x1C($s1)
    lhu         $v0, 0x2C($s1)
    addiu       $a3, $a3, 0x20
    addu        $v0, $v0, $v1
    sh          $v0, 0x10($a1)
    lhu         $v0, 0x14($s1)
    addu        $v1, $s0, $zero
    addiu       $s0, $s0, -0x1
    addiu       $a1, $a1, 0x20
    sw          $a2, -0x10($a0)
    sw          $a2, 0x0($a0)
    sll         $v0, $v0, 6
    addiu       $v0, $v0, -0x20
    sh          $v0, -0x4($a0)
    bnez        $v1, .L8009CAE0
    addiu       $a0, $a0, 0x20
    lw          $a3, 0x4($s1)
.L8009CB34:
    sll         $a1, $s3, 6
    addiu       $a0, $a1, -0xA0
    lhu         $v1, 0x2E($s1)
    sll         $v0, $s4, 1
    addu        $t0, $v0, $a3
    addiu       $v0, $zero, -0x20
    sh          $v1, 0x10($t0)
    sh          $v1, 0x0($t0)
    sh          $v0, 0x1A($a3)
    sh          $v0, 0xA($a3)
    sh          $a0, 0x3A($a3)
    sh          $a0, 0x2A($a3)
    lhu         $v0, 0x36($s1)
    addiu       $a1, $a1, -0x60
    addiu       $v0, $v0, -0x4
    sra         $s0, $v0, 1
    addu        $v0, $s0, $zero
    beqz        $v0, . + 4 + (0xF << 2)
    addiu       $s0, $s0, -0x1
    addiu       $a2, $a3, 0x2A
    addu        $a0, $t0, $zero
.L8009CB88:
    addiu       $a2, $a2, 0x20
    addiu       $a3, $a3, 0x20
    lhu         $v0, 0x0($a0)
    addu        $v1, $s0, $zero
    addiu       $s0, $s0, -0x1
    addu        $v0, $v0, $s6
    sh          $v0, 0x30($a0)
    sh          $v0, 0x20($a0)
    addiu       $a0, $a0, 0x20
    sh          $a1, 0x10($a2)
    bnez        $v1, .L8009CB88
    sh          $a1, 0x0($a2)
.end func_8009CA5C
