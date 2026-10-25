.text
.align 2
.set noreorder
.globl func_800911B0
.ent func_800911B0
func_800911B0:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x593C($v1)
    addiu       $sp, $sp, -0x38
    sw          $ra, 0x34($sp)
    sw          $s0, 0x30($sp)
    addu        $v0, $v0, $v1
    lui         $at, 0x8009
    sw          $v0, -0x593C($at)
    jal         func_80094030
    nop
    jal         func_800B7C80
    nop
    jal         func_800BAA80
    nop
    jal         func_800A6F2C
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x6D6C($v0)
    andi        $v0, $v0, 0x4
    bnez        $v0, .L80091234
    nop
    jal         func_800B0D10
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x751C($a0)
    jal         func_8008CEA4
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7920($a0)
    jal         func_8008CEA4
    nop
.L80091234:
    jal         func_800D52D4
    nop
    jal         func_80041A40
    nop
    jal         func_800B7C80
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    beqz        $v0, .L8009146C
    addu        $v1, $v0, $zero
    lui         $v0, 0x8007
    lhu         $v0, -0x4858($v0)
    bnez        $v0, .L8009146C
    nop
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    subu        $v0, $v1, $v0
    lui         $at, 0x8009
    sh          $v0, -0x6B04($at)
    sll         $v0, $v0, 16
    bgtz        $v0, .L80091434
    nop
    jal         func_8002098C
    nop
    sll         $v0, $v0, 16
    sra         $s0, $v0, 16
    addiu       $v0, $zero, 0x1
    bne         $s0, $v0, .L800912D8
    nop
    jal         func_8002099C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    beq         $v0, $s0, .L800912D8
    addiu       $a0, $zero, 0x2D
    lui         $at, 0x8009
    sh          $zero, -0x6B04($at)
    jal         func_8009CA5C
    addiu       $a1, $zero, 0xD2
    j           func_8008CD48
    nop
.L800912D8:
    jal         func_800AEAAC
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80091394
    nop
    jal         func_800AE9A4
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L80091394
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lb          $v1, 0x4F70($v1)
    beq         $v1, $v0, .L80091320
    nop
    jal         func_8009CA08
    nop
    beqz        $v0, .L80091328
    nop
.L80091320:
    jal         func_8009C99C
    nop
.L80091328:
    jal         func_800905F4
    nop
    lui         $v1, 0x8009
    lh          $v1, -0x6CE0($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, .L8009146C
    addiu       $v0, $zero, 0x1
    lui         $v1, 0x8008
    lh          $v1, 0x57C0($v1)
    bne         $v1, $v0, .L8009146C
    nop
    lui         $a0, 0x8008
    lhu         $a0, 0x57C4($a0)
    sltiu       $v0, $a0, 0x2
    beqz        $v0, .L8009146C
    nop
    lui         $a1, 0x8008
    lhu         $a1, 0x57C6($a1)
    sltiu       $v0, $a1, 0x37
    beqz        $v0, .L8009146C
    nop
    jal         func_800397C8
    nop
    jal         func_800AE5C4
    andi        $a0, $v0, 0xFFFF
    j           func_8008CD48
    nop
.L80091394:
    jal         func_800AEAAC
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800913B0
    nop
    jal         func_800AEA48
    nop
.L800913B0:
    lui         $v1, 0x8009
    lh          $v1, -0x498C($v1)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x6B04($at)
    blez        $v1, .L8009146C
    addu        $a0, $v1, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    subu        $v0, $a0, $v0
    lui         $at, 0x8009
    sh          $v0, -0x498C($at)
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x10
    beqz        $v0, .L80091414
    nop
    jal         func_800AD404
    nop
    jal         func_800AD4F8
    nop
    jal         func_800AD460
    nop
    jal         func_800AD49C
    nop
.L80091414:
    lui         $v0, 0x8009
    lh          $v0, -0x498C($v0)
    bgtz        $v0, .L8009146C
    nop
    jal         func_800AEA9C
    addu        $a0, $zero, $zero
    j           func_8008CD48
    nop
.L80091434:
    lui         $v0, 0x8009
    lh          $v0, -0x498C($v0)
    blez        $v0, .L8009146C
    addu        $v1, $v0, $zero
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    subu        $v0, $v1, $v0
    lui         $at, 0x8009
    sh          $v0, -0x498C($at)
    sll         $v0, $v0, 16
    bgtz        $v0, .L8009146C
    addiu       $v0, $zero, 0xF
    lui         $at, 0x8009
    sh          $v0, -0x498C($at)
.L8009146C:
    jal         func_800B7C80
    nop
    jal         func_80094168
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6D38($v0)
    beqz        $v0, .L800914DC
    addu        $v1, $v0, $zero
    lui         $v0, 0x8007
    lhu         $v0, -0x4858($v0)
    bnez        $v0, .L800914D4
    addiu       $v0, $v1, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x6D38($at)
    sll         $v0, $v0, 16
    bnez        $v0, .L800914D4
    nop
    jal         func_8002098C
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800914D4
    nop
    jal         func_8009198C
    nop
    jal         func_800AB4E0
    nop
.L800914D4:
    jal         func_80092FDC
    nop
.L800914DC:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    bnez        $v0, .L800914F8
    nop
    jal         func_8008D654
    nop
.L800914F8:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x800
    beqz        $v0, .L80091514
    nop
    jal         func_80092FDC
    nop
.L80091514:
    jal         func_800B7C80
    nop
    jal         func_800AA370
    nop
    jal         func_800B20C0
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000DC7C
    nop
    jal         func_8009BBE4
    nop
    jal         func_800BE9E0
    nop
    jal         func_800CA6F8
    nop
    jal         func_800CD13C
    nop
    jal         func_800C1FA8
    nop
    jal         func_80030110
    nop
    jal         func_800BCFBC
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a0, 0x8008
    lw          $a0, 0x5298($a0)
    jal         func_8003456C
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8003456C
    nop
    jal         func_8000BF08
    nop
    jal         func_80094288
    nop
    lw          $ra, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800911B0
