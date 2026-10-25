.text
.align 2
.set noreorder
.globl func_8009CCD4
.ent func_8009CCD4
func_8009CCD4:
    lui         $a0, 0x40
    ori         $a0, $a0, 0x4240
    lui         $a1, 0x10
    jal         func_8000A63C
    ori         $a1, $a1, 0x4240
    lui         $a0, 0xE
    jal         func_8000B008
    ori         $a0, $a0, 0x3001
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    jal         func_8000B1D8
    sw          $v0, 0x10($sp)
    lui         $a2, 0xFC12
    ori         $a2, $a2, 0x1824
    lui         $a1, 0xFF33
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0xFFFF
    ori         $a0, $zero, 0x8000
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A940
    sw          $a1, 0x4($v1)
    lw          $a1, 0x10($s4)
    jal         func_80009310
    addu        $a0, $zero, $zero
    lui         $v0, 0x8008
    lbu         $v0, 0x7A94($v0)
    beqz        $v0, .L8009CE58
    addiu       $v0, $zero, 0x3
    lui         $v1, 0x8008
    lh          $v1, 0x7A68($v1)
    bne         $v1, $v0, .L8009CE58
    lui         $a0, 0x10
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $s2, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFC
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0xF838
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A22C
    sw          $a1, 0x4($v1)
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_80009E58
    addu        $a0, $zero, $zero
    lui         $a0, 0x3
    jal         func_8000B008
    ori         $a0, $a0, 0x2205
    lui         $a0, 0x1
    jal         func_8000AFA8
    ori         $a0, $a0, 0x204
    lui         $a0, 0xC800
    lui         $a1, 0x302
    jal         func_8000A63C
    ori         $a1, $a1, 0x4000
    jal         func_80009E9C
    addu        $a0, $zero, $zero
    jal         func_80011248
    addu        $a0, $s0, $zero
    lhu         $a0, 0x0($v0)
    lhu         $a1, 0x2($v0)
    jal         func_8000AECC
    nop
    addiu       $a0, $zero, 0xFF
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0xFF
    jal         func_8000A08C
    addu        $a3, $zero, $zero
.L8009CE58:
    lw          $s2, 0x28($s4)
    addu        $s3, $zero, $zero
    addiu       $s1, $s1, -0x1
    addiu       $s7, $zero, -0x20
    addiu       $s5, $zero, 0x2
    addu        $s0, $zero, $zero
    addu        $v0, $s2, $zero
    beqz        $v0, . + 4 + (0x7E << 2)
    addiu       $s2, $s2, -0x1
    addiu       $t0, $zero, 0x2
    lw          $t1, 0x34($sp)
    lui         $fp, 0xB214
    addu        $s6, $zero, $zero
    sll         $v0, $t1, 5
    addiu       $v0, $v0, -0x10
    sll         $v0, $v0, 16
    ori         $v0, $v0, 0x10
    sw          $v0, 0x44($sp)
    bnez        $s2, .L8009CEB8
    nop
    lhu         $v0, 0x42($s4)
    beqz        $v0, .L8009CEB8
    addiu       $s1, $s1, -0x1
    addiu       $s1, $v0, 0x1
.L8009CEB8:
    lw          $a0, 0xC($s4)
    lw          $a2, 0x34($sp)
    addiu       $a1, $zero, 0x2
    addu        $a3, $s1, $zero
    sw          $zero, 0x10($sp)
    sw          $t0, 0x14($sp)
    sw          $t0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $t0, 0x48($sp)
    jal         func_8000979C
    addu        $a0, $a0, $s3
    addiu       $v0, $s7, 0x20
    slt         $v0, $s5, $v0
    lw          $t0, 0x48($sp)
    bnez        $v0, .L8009CF60
    nop
    lhu         $v0, 0x36($s4)
    addiu       $s7, $s5, -0x2
    subu        $a1, $v0, $s7
    slti        $v0, $a1, 0x21
    beql        $v0, $zero, .L8009CF1C
    addiu       $a1, $zero, 0x20
.L8009CF1C:
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    sll         $v1, $a1, 10
    addiu       $v0, $a0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v0, $a1, 4
    addiu       $v0, $v0, -0x1
    or          $v1, $v1, $v0
    andi        $v1, $v1, 0xFFFF
    lui         $v0, 0x400
    or          $v1, $v1, $v0
    sw          $v1, 0x0($a0)
    lw          $t1, 0x3C($sp)
    addu        $s0, $zero, $zero
    addu        $v0, $t1, $s6
    sw          $v0, 0x4($a0)
.L8009CF60:
    beqz        $s3, . + 4 + (0x1D << 2)
    lui         $v1, 0xFFF0
    ori         $v1, $v1, 0x10
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    sll         $v0, $s0, 1
    andi        $v0, $v0, 0xFFFF
    or          $v0, $v0, $fp
    sw          $v0, 0x0($a0)
    addiu       $v0, $s0, 0x1
    sll         $v0, $v0, 1
    andi        $v0, $v0, 0xFFFF
    or          $v0, $v0, $fp
    sw          $v1, 0x4($a0)
    sw          $v0, 0x8($a0)
    lw          $t1, 0x44($sp)
    sw          $t1, 0xC($a0)
    lhu         $v0, 0x14($s4)
    addiu       $v1, $s1, -0x2
.end func_8009CCD4
