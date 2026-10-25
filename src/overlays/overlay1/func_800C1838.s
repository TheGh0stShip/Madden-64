.text
.align 2
.set noreorder
.globl func_800C1838
.ent func_800C1838
func_800C1838:
    beq         $v1, $v0, .L800C1A5C
    addiu       $v0, $s3, 0x1
    addu        $s4, $zero, $zero
    slti        $v0, $v1, 0xB
    bnez        $v0, .L800C1858
    addu        $s2, $v1, $zero
    addiu       $s2, $s2, -0xB
    addiu       $s4, $zero, 0x1
.L800C1858:
    lbu         $v1, 0x3D($s1)
    ori         $v0, $a1, 0x1
    sw          $v0, 0x14($s1)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lbu         $v0, 0x5E50($at)
    beq         $v1, $v0, .L800C1A5C
    addiu       $v0, $s3, 0x1
    addu        $s0, $s4, $zero
    sll         $v1, $s0, 1
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s0
    sll         $v1, $v1, 3
    addu        $v1, $v1, $fp
    sll         $v0, $s2, 16
    sra         $s2, $v0, 16
    sll         $v0, $s2, 2
    addu        $v0, $v0, $v1
    lw          $v0, 0x0($v0)
    lw          $a1, 0x24($v0)
    jal         func_80098158
    addu        $a0, $s1, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x7AC2($v1)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L800C1948
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800C18E0
    addiu       $v0, $zero, 0x3
    beqz        $v1, .L800C18F0
    addu        $a0, $s1, $zero
    j           func_800BD308
    nop
.L800C18E0:
    beq         $v1, $v0, .L800C19B8
    sll         $v1, $s0, 5
    j           func_800BD308
    nop
.L800C18F0:
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    sll         $v1, $s2, 1
    addu        $a1, $v0, $s5
    addu        $v1, $v1, $a1
    lh          $v1, 0x0($v1)
    addu        $a2, $zero, $zero
    addu        $v0, $v0, $s7
    sll         $a1, $v1, 2
    addu        $a1, $a1, $v1
    sll         $a1, $a1, 3
    jal         func_80097D28
    addu        $a1, $v0, $a1
    j           func_800BD318
    sll         $v0, $s3, 16
.L800C1948:
    sll         $v1, $s0, 5
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    sll         $v0, $s2, 1
    addu        $a0, $v1, $s5
    addu        $v0, $v0, $a0
    lh          $a0, 0x0($v0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $a0, 0xD77($at)
    jal         func_800167FC
    addiu       $a1, $sp, 0x10
    addu        $a0, $s1, $zero
    addiu       $a1, $sp, 0x10
    jal         func_80097D28
    addu        $a2, $zero, $zero
    j           func_800BD318
    sll         $v0, $s3, 16
.L800C19B8:
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $s0
    sll         $v1, $v1, 2
    sll         $v0, $s2, 1
    addu        $a0, $v1, $s5
    addu        $v0, $v0, $a0
    lh          $a0, 0x0($v0)
    sll         $v0, $a0, 2
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0xD78($at)
    andi        $v0, $v0, 0x3F
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lw          $a1, -0x2AA0($at)
    addu        $a2, $zero, $zero
    jal         func_80097D28
    addu        $a0, $s1, $zero
    j           func_800BD318
    sll         $v0, $s3, 16
    lw          $v0, 0x14($s1)
    and         $v0, $v0, $s6
    sw          $v0, 0x14($s1)
    sll         $v0, $s3, 16
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v0, 0x5E50($at)
    sll         $v0, $v0, 24
    sra         $v0, $v0, 24
    sh          $v0, 0x3C($s1)
    addiu       $v0, $s3, 0x1
.L800C1A5C:
    addu        $s3, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v1, $v0, 16
    slti        $v0, $v1, 0x9
    bnez        $v0, . + 4 + (-0x9A << 2)
    sll         $v0, $s3, 16
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    sltu        $v0, $zero, $v0
    negu        $v0, $v0
    andi        $s4, $v0, 0xB
    slti        $v0, $v1, 0xE
    beqz        $v0, . + 4 + (0xBD << 2)
    addiu       $s7, $zero, -0x2
    lui         $s6, 0x8009
    addiu       $s6, $s6, -0x7B94
    lui         $fp, 0x8008
    addiu       $fp, $fp, 0xD6A
    addiu       $s5, $fp, 0xAF6
    sll         $v0, $s3, 16
    sra         $v0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $s1, 0x5D48($at)
    lw          $v1, 0x14($s1)
    addu        $v0, $v0, $s6
    and         $v1, $v1, $s7
    sw          $v1, 0x14($s1)
    lw          $v1, 0x0($v0)
    lw          $v0, 0x14($v1)
    andi        $v0, $v0, 0x1
    beqz        $v0, . + 4 + (0xA4 << 2)
    addiu       $v0, $s3, 0x1
    lw          $v0, 0x10($v1)
    addu        $a1, $zero, $zero
    addu        $v1, $zero, $zero
    addu        $v0, $s4, $v0
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    sll         $v0, $v1, 16
.L800C1B00:
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lb          $v0, 0x5E50($at)
    beql        $a0, $v0, .L800C1B18
    addiu       $a1, $zero, 0x1
.L800C1B18:
    addiu       $v0, $v1, 0x1
    addu        $v1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x9
    bnez        $v0, .L800C1B00
    sll         $v0, $v1, 16
    addu        $v0, $a1, $zero
    bnez        $v0, . + 4 + (0x8C << 2)
    addiu       $v0, $s3, 0x1
    lw          $v0, 0x14($s1)
    lbu         $v1, 0x3D($s1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($s1)
    andi        $v0, $s2, 0xFF
    beq         $v1, $v0, . + 4 + (0x85 << 2)
    addiu       $v0, $s3, 0x1
    lui         $a0, 0x8009
    lh          $a0, -0x751C($a0)
    sll         $v0, $s3, 16
    sra         $v0, $v0, 14
    addu        $s0, $v0, $s6
    lw          $v0, 0x0($s0)
    lui         $t0, 0x8008
    addiu       $t0, $t0, 0x5040
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    lw          $v0, 0x10($v0)
    sll         $v1, $v1, 3
    addu        $v1, $v1, $t0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $v0, 0x0($v0)
    lw          $a1, 0x24($v0)
    jal         func_80098158
    addu        $a0, $s1, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x7AC2($v1)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, . + 4 + (0x25 << 2)
    slti        $v0, $v1, 0x2
    beql        $v0, $zero, .L800C1BDC
    addiu       $v0, $zero, 0x3
    beqz        $v1, . + 4 + (0x7 << 2)
    addu        $a0, $s1, $zero
    j           func_800BD634
    nop
.L800C1BDC:
    beq         $v1, $v0, . + 4 + (0x3D << 2)
.end func_800C1838
