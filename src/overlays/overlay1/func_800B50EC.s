.text
.align 2
.set noreorder
.globl func_800B50EC
.ent func_800B50EC
func_800B50EC:
.L800B50EC:
    lw          $t1, 0x3C($sp)
    andi        $a0, $s0, 0xFF
    addiu       $a0, $a0, 0x1
    .word       0x00890018  # mult        $a0, $t1
    sra         $v0, $a0, 31
    .word       0x00005010  # mfhi        $t2
    addu        $v1, $t2, $a0
    sra         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v0, $v1, 3
    subu        $v0, $v0, $v1
    subu        $s0, $a0, $v0
    andi        $v1, $s0, 0xFF
    beq         $v1, $a3, .L800B50EC
    nop
    lbu         $v0, 0x1($a2)
    beq         $v1, $v0, .L800B50EC
    nop
    lbu         $v0, 0x0($a1)
    beq         $v1, $v0, .L800B50EC
    nop
    lbu         $v0, 0x1($a1)
    beq         $v1, $v0, .L800B50EC
    andi        $a0, $s4, 0xFF
    lw          $t1, 0x44($sp)
    addu        $v0, $t1, $a0
    sb          $s0, 0x0($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $v0, $v0, $s6
    lbu         $v0, 0xCC($v0)
    lui         $v1, 0x8007
    addiu       $v1, $v1, -0x154C
    sll         $v0, $v0, 1
    addu        $v0, $v0, $v1
    addu        $v0, $v0, $a0
    lbu         $v1, 0x0($v0)
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L800B52F4
    addu        $s2, $zero, $zero
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1538($at)
    jr          $v0
    nop
    andi        $a1, $s0, 0xFF
    sll         $v1, $a1, 2
    addu        $a0, $v1, $fp
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lbu         $s5, 0x3($a0)
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $s3, -0x1565($at)
    addu        $v0, $s7, $v0
    addu        $v0, $v0, $a1
    lbu         $v1, 0xA6($v0)
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5C7C
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B52FC
    andi        $v1, $s2, 0xFF
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5C98
    j           func_800B0BD8
    nop
    andi        $a0, $s0, 0xFF
    sll         $v1, $a0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $s5, -0x1565($at)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $v1, $v1, $fp
    lbu         $s3, 0x3($v1)
    addu        $v0, $s7, $v0
    addu        $v0, $v0, $a0
    lbu         $v1, 0xA6($v0)
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5DCC
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800B52FC
    andi        $v1, $s2, 0xFF
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5DE8
    j           func_800B0BD8
    nop
    andi        $v0, $s0, 0xFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    lbu         $s3, 0x3($v0)
    addiu       $s2, $zero, 0x1
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5E04
    j           func_800B0BD0
    addu        $s5, $s3, $zero
    andi        $v0, $s0, 0xFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $fp
    lbu         $s3, 0x3($v0)
    addiu       $s2, $zero, 0x1
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5E0C
    j           func_800B0BD0
    addu        $s5, $s3, $zero
    jal         func_80031964
    nop
    andi        $v0, $v0, 0x1
    beqz        $v0, .L800B52D0
    andi        $v0, $s0, 0xFF
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5DCC
    sll         $v0, $v0, 2
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lbu         $s5, -0x1565($at)
    addu        $v0, $v0, $fp
    lbu         $s3, 0x3($v0)
    j           func_800B0BD4
    andi        $v1, $s2, 0xFF
.L800B52D0:
    lui         $s1, 0x800E
    addiu       $s1, $s1, 0x5C7C
    andi        $v1, $s0, 0xFF
    sll         $v1, $v1, 2
    addu        $v0, $v1, $fp
    lbu         $s5, 0x3($v0)
    lui         $at, 0x8007
    addu        $at, $at, $v1
    lbu         $s3, -0x1565($at)
.L800B52F4:
    andi        $v1, $s2, 0xFF
    addiu       $v0, $zero, 0x1
.L800B52FC:
    bne         $v1, $v0, .L800B533C
    andi        $s0, $s0, 0xFF
    lhu         $a0, 0x2($s1)
    jal         func_80031A1C
    nop
    lui         $a0, 0x8007
    lw          $a0, -0x158C($a0)
    andi        $a2, $v0, 0xFFFF
    lw          $t2, 0x24($sp)
    andi        $v1, $s4, 0xFF
    sll         $v0, $a2, 2
    addu        $v0, $v0, $s1
    lw          $v0, 0x4($v0)
    sll         $v1, $v1, 2
    j           func_800B0C5C
    addu        $a0, $t2, $a0
.L800B533C:
    sll         $s0, $s0, 2
    addu        $s0, $s0, $s1
    lw          $v0, 0x0($s0)
    lhu         $a0, 0x2($v0)
    jal         func_80031A1C
    nop
    lui         $a0, 0x8007
    lw          $a0, -0x158C($a0)
    andi        $a2, $v0, 0xFFFF
    lw          $t1, 0x24($sp)
    lw          $a1, 0x0($s0)
    andi        $v1, $s4, 0xFF
    sll         $v0, $a2, 2
    sll         $v1, $v1, 2
    addu        $a0, $t1, $a0
    addu        $v0, $v0, $a1
    lw          $v0, 0x4($v0)
    addiu       $a0, $a0, 0xB4
    addu        $v1, $v1, $a0
    sw          $v0, 0x0($v1)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    lw          $t2, 0x2C($sp)
    andi        $v1, $s4, 0xFF
    addu        $v0, $t2, $v0
    addiu       $v0, $v0, 0xC4
    addu        $v0, $v0, $v1
    sb          $s5, 0x0($v0)
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addiu       $s4, $s4, 0x1
    addu        $v0, $t2, $v0
    addiu       $v0, $v0, 0xC8
    addu        $v0, $v0, $v1
    sb          $s3, 0x0($v0)
    andi        $v0, $s4, 0xFF
    sltiu       $v0, $v0, 0x2
    bnez        $v0, . + 4 + (-0xD6 << 2)
    nop
    lw          $t1, 0x4C($sp)
    addiu       $s7, $s7, 0x7
    lw          $t2, 0x54($sp)
    addiu       $s6, $s6, 0x1
    sltiu       $v0, $s6, 0x2
    addiu       $t1, $t1, 0x2
    addiu       $t2, $t2, 0x4
    sw          $t1, 0x4C($sp)
    bnez        $v0, . + 4 + (-0xE8 << 2)
    sw          $t2, 0x54($sp)
    lw          $ra, 0x7C($sp)
    lw          $fp, 0x78($sp)
    lw          $s7, 0x74($sp)
    lw          $s6, 0x70($sp)
    lw          $s5, 0x6C($sp)
    lw          $s4, 0x68($sp)
    lw          $s3, 0x64($sp)
    lw          $s2, 0x60($sp)
    lw          $s1, 0x5C($sp)
    lw          $s0, 0x58($sp)
    addiu       $sp, $sp, 0x80
    jr          $ra
    nop
.end func_800B50EC
