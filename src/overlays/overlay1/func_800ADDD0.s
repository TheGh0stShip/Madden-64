.text
.align 2
.set noreorder
.globl func_800ADDD0
.ent func_800ADDD0
func_800ADDD0:
    addu        $a2, $s2, $zero
    addiu       $v0, $zero, 0xA
    jal         func_8000D740
    sw          $v0, -0x18($s0)
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    sw          $a0, -0x47A8($at)
    jal         func_80016FE4
    addiu       $s7, $zero, 0x4
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    addu        $a1, $zero, $zero
    lui         $v1, 0x8007
    lw          $v1, -0x47A8($v1)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, -0x5F28($at)
    addiu       $v0, $zero, 0x1010
    lui         $at, 0x8008
    sw          $v0, -0x5F20($at)
    sw          $s1, -0x18($s0)
    lui         $at, 0x8007
    sw          $v1, -0x47A4($at)
    jal         func_8000D740
    addu        $a2, $s2, $zero
    addu        $a0, $v0, $zero
    lui         $at, 0x8008
    sw          $a0, -0x5F44($at)
    lui         $at, 0x8007
    sw          $a0, -0x47C0($at)
    jal         func_80016FE4
    addiu       $s4, $s4, -0x64
    jal         func_8000BE80
    nop
    jal         func_800334B8
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    addu        $a1, $zero, $zero
    addu        $a2, $s2, $zero
    jal         func_8000D740
    sw          $s1, -0x18($s0)
    lui         $at, 0x8008
    sw          $v0, -0x5F40($at)
    lui         $at, 0x8007
    sw          $v0, -0x47BC($at)
    jal         func_8000BE80
    addiu       $s1, $s2, 0xC
    jal         func_800334B8
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5F40($a0)
    jal         func_80016FE4
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    addu        $a1, $zero, $zero
    addu        $a2, $s2, $zero
    addiu       $v0, $zero, 0x8
    lui         $at, 0x8008
    sh          $s3, -0x5F28($at)
    sw          $zero, 0x0($s0)
    lui         $at, 0x8008
    sw          $s5, -0x5F20($at)
    jal         func_8000D740
    sw          $v0, -0x18($s0)
    addiu       $v1, $zero, 0x18
    lui         $at, 0x8007
    sw          $v0, -0x4808($at)
    lui         $at, 0x8008
    sw          $v1, -0x5F20($at)
    lw          $v0, 0x8($v0)
    addiu       $s3, $zero, 0x18
    sw          $v0, 0x0($s0)
    addiu       $t1, $zero, 0x3
.L800ADEFC:
    bne         $s6, $t1, .L800ADF10
    nop
    addiu       $t1, $zero, 0x9
    sw          $t1, 0x0($s2)
    sw          $fp, 0xC($s2)
.L800ADF10:
    bne         $s6, $s7, .L800ADF2C
    nop
    lui         $v0, 0x8007
    lw          $v0, -0x47FC($v0)
    sw          $s3, 0x0($s1)
    lw          $v0, 0x8($v0)
    sw          $v0, 0xC($s1)
.L800ADF2C:
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    addu        $a1, $zero, $zero
    lui         $a2, 0x8008
    addiu       $a2, $a2, -0x5F2C
    jal         func_8000D740
    addiu       $s6, $s6, 0x1
    jal         func_8000BE80
    sw          $v0, 0x0($s4)
    jal         func_800334B8
    addiu       $s4, $s4, 0x4
    sltiu       $v0, $s6, 0x9
    bnez        $v0, .L800ADEFC
    addiu       $t1, $zero, 0x3
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    addu        $a1, $zero, $zero
    lui         $s0, 0x8008
    addiu       $s0, $s0, -0x5F14
    addiu       $a2, $s0, -0x18
    addiu       $s6, $zero, 0x1
    addu        $s3, $a2, $zero
    addiu       $fp, $zero, 0x9
    addiu       $s7, $zero, 0x10
    addiu       $s5, $zero, 0x4
    addiu       $v0, $zero, 0x10
    sw          $zero, 0x0($s0)
    lui         $at, 0x8008
    sw          $v0, -0x5F20($at)
    addiu       $v0, $zero, 0x8
    jal         func_8000D740
    sw          $v0, -0x18($s0)
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x47E4
    sw          $v0, 0x0($a0)
    lui         $v1, 0x8007
    lw          $v1, -0x47E4($v1)
    addiu       $s2, $s0, -0xC
    addiu       $v0, $zero, 0x18
    lui         $at, 0x8008
    sw          $v0, -0x5F20($at)
    lw          $v0, 0x8($v1)
    addiu       $s4, $zero, 0x18
    addiu       $s1, $a0, 0x4
    sw          $v0, 0x0($s0)
    addiu       $t1, $zero, 0x3
.L800ADFE4:
    bne         $s6, $t1, .L800ADFF4
    nop
    sw          $fp, 0x0($s3)
    sw          $s7, 0xC($s3)
.L800ADFF4:
    bne         $s6, $s5, .L800AE010
    nop
    lui         $v0, 0x8007
    lw          $v0, -0x47D8($v0)
    sw          $s4, 0x0($s2)
    lw          $v0, 0x8($v0)
    sw          $v0, 0xC($s2)
.L800AE010:
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    addu        $a1, $zero, $zero
    lui         $a2, 0x8008
    addiu       $a2, $a2, -0x5F2C
    jal         func_8000D740
    addiu       $s6, $s6, 0x1
    jal         func_8000BE80
    sw          $v0, 0x0($s1)
    jal         func_800334B8
    addiu       $s1, $s1, 0x4
    sltiu       $v0, $s6, 0x9
    bnez        $v0, .L800ADFE4
    addiu       $t1, $zero, 0x3
    addu        $s6, $zero, $zero
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4808
    addiu       $s1, $v0, 0x24
    addu        $s0, $v0, $zero
.L800AE05C:
    lw          $a0, 0x0($s0)
    jal         func_80016FE4
    addiu       $s0, $s0, 0x4
    lw          $a0, 0x0($s1)
    addiu       $s6, $s6, 0x1
    jal         func_80016FE4
    addiu       $s1, $s1, 0x4
    sltiu       $v0, $s6, 0x9
    bnez        $v0, .L800AE05C
    addu        $a1, $zero, $zero
    lui         $a0, 0x8007
    lw          $a0, -0x4778($a0)
    lui         $s3, 0x8008
    addiu       $s3, $s3, -0x5F24
    addiu       $s6, $s3, -0x8
    lui         $v1, 0x8009
    lw          $v1, -0x6CBC($v1)
    ori         $v0, $zero, 0xFF10
    sh          $v0, 0x0($s3)
    addiu       $v0, $zero, 0x90
    addiu       $s1, $zero, 0x5
    lui         $at, 0x8008
    sw          $zero, -0x5F14($at)
    lui         $at, 0x8008
    sw          $v0, -0x5F20($at)
    sw          $s1, -0x8($s3)
    lui         $at, 0x8008
    sw          $zero, -0x5F18($at)
    lui         $at, 0x8008
    sw          $v1, -0x5F08($at)
    jal         func_8000D740
    addu        $a2, $s6, $zero
    lui         $s5, 0x8008
    addiu       $s5, $s5, -0x5EF8
    lui         $at, 0x8007
    sw          $v0, -0x47B8($at)
    jal         func_8000BE80
    sw          $v0, 0x0($s5)
    jal         func_800334B8
    addiu       $s7, $zero, 0x10
    lui         $a0, 0x8007
    lw          $a0, -0x4778($a0)
    addu        $a1, $zero, $zero
    addiu       $s2, $zero, 0x6
    lui         $at, 0x8008
    sw          $s7, -0x5F20($at)
    sw          $s2, -0x8($s3)
    lui         $at, 0x8008
    sw          $zero, -0x5F08($at)
    jal         func_8000D740
    addu        $a2, $s6, $zero
    lui         $s4, 0x8008
    addiu       $s4, $s4, -0x5EEC
    lui         $at, 0x8007
    sw          $v0, -0x4794($at)
    jal         func_8000BE80
    sw          $v0, 0x0($s4)
    jal         func_800334B8
    addiu       $s0, $zero, 0x28
    lui         $a0, 0x8007
    lw          $a0, -0x4778($a0)
    lw          $v0, 0x0($s5)
    lui         $v1, 0x8007
    lw          $v1, -0x4794($v1)
    lui         $at, 0x8008
    sw          $s0, -0x5F20($at)
    sw          $s1, -0x8($s3)
    lui         $at, 0x8008
    sw          $v0, -0x5F18($at)
    lw          $v0, 0x8($v1)
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, -0x5F14($at)
    jal         func_8000D740
    addu        $a2, $s6, $zero
    lui         $a0, 0x8007
    lw          $a0, -0x4778($a0)
    lui         $v1, 0x8007
    lw          $v1, -0x47B8($v1)
    lui         $at, 0x8007
    sw          $v0, -0x4798($at)
    sw          $v0, 0x4($s5)
    lw          $v0, 0x0($s4)
    lw          $v1, 0x8($v1)
    addu        $a1, $zero, $zero
    lui         $at, 0x8008
    sw          $s0, -0x5F20($at)
    sw          $s2, -0x8($s3)
    lui         $at, 0x8008
    sw          $v0, -0x5F18($at)
    lui         $at, 0x8008
    sw          $v1, -0x5F14($at)
    jal         func_8000D740
    addu        $a2, $s6, $zero
    lui         $v1, 0x8008
    lhu         $v1, 0x5280($v1)
    addiu       $s0, $zero, 0x40
    lui         $at, 0x8007
    sw          $v0, -0x47B4($at)
    sw          $v0, -0x4($s4)
    andi        $v1, $v1, 0xC0
    bne         $v1, $s0, .L800AE210
    sh          $zero, 0x0($s3)
    lw          $a0, 0x0($s5)
    jal         func_80016FE4
    nop
    lw          $a0, -0x4($s4)
    jal         func_80016FE4
    nop
.L800AE210:
    lui         $v0, 0x8008
    lhu         $v0, 0x57B2($v0)
    andi        $v0, $v0, 0xC0
    bne         $v0, $s0, .L800AE23C
    nop
    lw          $a0, 0x4($s5)
    jal         func_80016FE4
    nop
    lw          $a0, 0x0($s4)
    jal         func_80016FE4
    nop
.L800AE23C:
    lui         $a0, 0x8007
    lw          $a0, -0x4778($a0)
    addiu       $a1, $zero, 0x2
    lui         $s0, 0x8007
    addiu       $s0, $s0, -0x4744
    addiu       $s1, $s0, -0x4
    lw          $v1, 0x0($s5)
    addu        $a2, $s1, $zero
    addiu       $v0, $zero, 0x8
    sh          $v0, 0x0($s0)
    lui         $at, 0x8007
    sh          $v0, -0x4742($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4770
    lui         $at, 0x8007
    sw          $v0, -0x4740($at)
    jal         func_8000D740
    sw          $v1, -0x4($s0)
    lui         $a0, 0x8007
    lw          $a0, -0x4778($a0)
    addiu       $a1, $zero, 0x2
    lw          $v1, 0x0($s4)
    addu        $a2, $s1, $zero
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4760
    lui         $at, 0x8007
    sw          $v0, -0x4740($at)
    jal         func_8000D740
    sw          $v1, -0x4($s0)
    jal         func_800A8408
    addu        $a0, $zero, $zero
    jal         func_800A8408
    addiu       $a0, $zero, 0x1
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    addiu       $a1, $zero, 0x2
    jal         func_8000D740
    addu        $a2, $s1, $zero
    lui         $a0, 0x8008
    lw          $a0, -0x5F34($a0)
    lw          $v1, 0x8($v0)
    addu        $a1, $zero, $zero
    addiu       $s1, $zero, 0x1
    addiu       $s0, $zero, 0x3
    lui         $at, 0x8008
    sw          $v0, -0x5E94($at)
    lui         $at, 0x8008
    sh          $s1, -0x5F28($at)
    sw          $s0, -0x8($s3)
    lui         $at, 0x8008
    sw          $s7, -0x5F20($at)
    lui         $at, 0x8008
    sw          $v1, -0x5E90($at)
    jal         func_8000D740
    addu        $a2, $s6, $zero
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    sw          $a0, -0x47AC($at)
    jal         func_80016FE4
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7AF8($a0)
    jal         func_8003E4B4
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CA0($a0)
    lui         $at, 0x8008
    sw          $v0, 0xC8C($at)
    jal         func_8003E4B4
    nop
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, 0x61C0($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x1B00
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, 0x5BF0($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x1B00
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $v0, 0x5BF4($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x480
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x6D70($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x480
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x6D6C($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x480
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    sw          $v0, -0x7928($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x480
    lui         $v1, 0x8007
    lhu         $v1, -0x4858($v1)
    lui         $at, 0x8009
    sw          $v0, -0x7924($at)
    beq         $v1, $s0, . + 4 + (0x68 << 2)
    nop
    lui         $v1, 0x8008
    addiu       $v1, $v1, -0x5EBC
    lhu         $a0, 0x0($v1)
    lui         $a1, 0x8008
    lhu         $a1, -0x5EA8($a1)
    lui         $a2, 0x8008
    lhu         $a2, -0x5EA6($a2)
    lui         $a3, 0x8009
    lh          $a3, -0x6CE0($a3)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4AA8
    lui         $t0, 0x8008
    addiu       $t0, $t0, -0x5EE0
    lui         $at, 0x8008
    sw          $zero, -0x5EC8($at)
    lui         $at, 0x8008
    sw          $zero, -0x5ECC($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EAE($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EB0($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EE6($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EE8($at)
    lui         $at, 0x8008
    sw          $v0, -0x5EC4($at)
    sw          $v0, 0x0($t0)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4AC8
    lui         $at, 0x8008
    sw          $v0, -0x5EC0($at)
    lui         $at, 0x8008
    sw          $v0, -0x5EDC($at)
    addiu       $v0, $zero, 0x35
    lui         $at, 0x8007
    sb          $v0, -0x483C($at)
    addiu       $v0, $zero, 0x5A
    lui         $at, 0x8008
    sh          $v0, -0x5EA0($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sh          $zero, -0x5EB6($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EB8($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EAA($at)
    lui         $at, 0x8008
    sh          $zero, -0x5EAC($at)
    lui         $at, 0x8007
    sh          $zero, -0x4852($at)
    lui         $at, 0x8007
    sh          $zero, -0x4850($at)
    lui         $at, 0x8007
    sh          $zero, -0x484E($at)
    lui         $at, 0x8007
    sh          $zero, -0x484C($at)
    lui         $at, 0x8007
    sh          $s1, -0x484A($at)
    lui         $at, 0x8007
    sh          $zero, -0x483E($at)
    sh          $a0, 0x0($v1)
    lui         $at, 0x8008
    sh          $a1, -0x5EE4($at)
    lui         $at, 0x8008
    sh          $a2, -0x5EE2($at)
    bnel        $a3, $v0, . + 4 + (0x3E << 2)
    addiu       $s6, $zero, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    lui         $v1, 0x1000
    lui         $at, 0x8007
    sh          $zero, -0x484A($at)
    and         $v0, $v0, $v1
    bnez        $v0, .L800AE524
    nop
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4B40
    j           func_800A9E0C
    sw          $v0, 0x0($t0)
.L800AE524:
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4B30
    sw          $v0, 0x0($t0)
    addiu       $v0, $zero, 0x6
    addiu       $v1, $zero, 0x2
    lui         $at, 0x8008
    sh          $v0, -0x5ED8($at)
    addiu       $v0, $zero, 0x9
    lui         $at, 0x8008
    sh          $v0, -0x5ED6($at)
    lui         $v0, 0x8007
    addiu       $v0, $v0, -0x4B28
    lui         $at, 0x8008
    sw          $v0, -0x5EDC($at)
    addiu       $v0, $zero, 0x2D
.end func_800ADDD0
