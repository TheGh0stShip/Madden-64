.text
.align 2
.set noreorder
.globl func_800C0D00
.ent func_800C0D00
func_800C0D00:
    sw          $ra, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s4, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    blez        $v0, .L800C0F44
    sw          $s0, 0x10($sp)
    addiu       $s4, $zero, 0x1
    lui         $s3, 0x8007
    addiu       $s3, $s3, 0x26F8
    lui         $s5, 0x8008
    addiu       $s5, $s5, 0x5040
    sll         $v1, $s2, 16
.L800C0D34:
    sra         $v1, $v1, 16
    lui         $a0, 0x8009
    addiu       $a0, $a0, -0x7B70
    sll         $v0, $v1, 2
    addu        $a1, $v0, $a0
    lw          $a0, 0x0($a1)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lb          $v0, 0x79A4($at)
    sw          $v0, 0x10($a0)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lb          $v0, 0x7FE4($at)
    bnez        $v0, .L800C0D84
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x800
    beqz        $v0, .L800C0DA0
    nop
.L800C0D84:
    lw          $v1, 0x0($a1)
    lw          $v0, 0x14($v1)
    ori         $v0, $v0, 0x1
    sw          $v0, 0x14($v1)
    lw          $a0, 0x0($a1)
    jal         func_800BCB04
    nop
.L800C0DA0:
    lui         $v1, 0x8008
    lh          $v1, 0x6CF2($v1)
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800C0F24
    addiu       $v0, $s2, 0x1
    lui         $v0, 0x8007
    lbu         $v0, 0x4808($v0)
    bne         $v0, $s4, .L800C0F24
    addiu       $v0, $s2, 0x1
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    addiu       $a1, $zero, 0x5
    jal         func_8000D740
    addu        $a2, $zero, $zero
    addu        $a1, $v0, $zero
    sll         $v1, $s2, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s3
    bnez        $v1, .L800C0E10
    sw          $a1, 0x0($v0)
    lui         $a1, 0x8008
    lw          $a1, 0x69C8($a1)
    lw          $a0, 0x0($s3)
    jal         func_800980FC
    addiu       $a1, $a1, 0x20
    j           func_800BC6F8
    sll         $s0, $s2, 16
.L800C0E10:
    lw          $a0, 0x0($s3)
    jal         func_80098164
    sll         $s0, $s2, 16
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sra         $s0, $s0, 16
    sll         $a0, $s0, 2
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $v1, 0x79A4($at)
    sll         $v0, $v0, 3
    addu        $v0, $v0, $s5
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    lw          $v0, 0x0($v1)
    addu        $s1, $a0, $s3
    lw          $a0, 0x0($s1)
    lw          $a1, 0x24($v0)
    jal         func_80098158
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x751C($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lb          $a0, 0x79A4($at)
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x1860
    sll         $a0, $a0, 1
    addu        $v0, $v1, $v0
    addu        $a0, $a0, $v0
    lh          $a0, 0x0($a0)
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lbu         $v1, 0x1602($at)
    addiu       $v0, $zero, 0x64
    subu        $a0, $v0, $v1
    sltiu       $v0, $a0, 0x32
    bnel        $v0, $zero, .L800C0EEC
    addiu       $a0, $zero, 0x32
.L800C0EEC:
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00820019  # multu       $a0, $v0
    .word       0x00003810  # mfhi        $a3
    srl         $a0, $a3, 2
    jal         func_80098088
    addiu       $a0, $a0, -0xA
    lw          $a0, 0x0($s1)
    addu        $a1, $v0, $zero
    jal         func_80097D28
    addiu       $a2, $zero, 0x6
    lui         $at, 0x8009
    sb          $s4, -0x5C02($at)
    addiu       $v0, $s2, 0x1
.L800C0F24:
    addu        $s2, $v0, $zero
    lui         $v1, 0x8008
    lh          $v1, 0x5024($v1)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slt         $v0, $v0, $v1
    bnez        $v0, .L800C0D34
    sll         $v1, $s2, 16
.L800C0F44:
    lui         $v1, 0x8008
    lh          $v1, 0x6CF2($v1)
    addiu       $v0, $zero, 0x6
    bne         $v1, $v0, .L800C1074
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8007
    lbu         $v1, 0x4808($v1)
    bne         $v1, $v0, .L800C1074
    nop
    lui         $s0, 0x8007
    addiu       $s0, $s0, 0x26F8
    lw          $v0, 0x0($s0)
    beqz        $v0, .L800C1074
    addiu       $a1, $zero, 0x5
    lui         $a0, 0x8008
    lw          $a0, 0x775C($a0)
    jal         func_8000D740
    addu        $a2, $zero, $zero
    lw          $a0, 0x0($s0)
    addu        $a1, $v0, $zero
    lui         $at, 0x8007
    sw          $a1, 0x270C($at)
    jal         func_80098164
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x5040($at)
    lui         $a0, 0x8007
    lw          $a0, 0x270C($a0)
    lw          $a1, 0x24($v0)
    jal         func_80098158
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x751C($v1)
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
    lh          $a0, 0x1860($at)
    sll         $v1, $a0, 1
    addu        $v1, $v1, $a0
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lbu         $v1, 0x1602($at)
    addiu       $v0, $zero, 0x64
    subu        $a0, $v0, $v1
    sltiu       $v0, $a0, 0x32
    bnel        $v0, $zero, .L800C1044
    addiu       $a0, $zero, 0x32
.L800C1044:
    lui         $v0, 0xCCCC
    ori         $v0, $v0, 0xCCCD
    .word       0x00820019  # multu       $a0, $v0
    .word       0x00003810  # mfhi        $a3
    srl         $a0, $a3, 2
    jal         func_80098088
    addiu       $a0, $a0, -0xA
    lui         $a0, 0x8007
    lw          $a0, 0x270C($a0)
    addu        $a1, $v0, $zero
    jal         func_80097D28
    addiu       $a2, $zero, 0x6
.L800C1074:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v0, $v0, 0x10
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800C0D00
