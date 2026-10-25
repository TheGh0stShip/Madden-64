.text
.align 2
.set noreorder
.globl func_8009F4D4
.ent func_8009F4D4
func_8009F4D4:
    slti        $v0, $s0, 0x80
    bnez        $v0, . + 4 + (-0x4D << 2)
    addiu       $a2, $zero, 0x10
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    lw          $s0, 0x10($v0)
    addu        $a3, $zero, $zero
    addu        $a1, $s0, $zero
.L8009F4FC:
    lw          $v0, 0x8($s1)
    sll         $v1, $a3, 3
    addu        $v0, $v1, $v0
    lhu         $v0, 0x0($v0)
    addu        $a0, $a2, $s0
    sh          $v0, 0x0($a1)
    sh          $v0, 0x0($a0)
    lw          $v0, 0x8($s1)
    addu        $v1, $v1, $v0
    lhu         $v0, 0x2($v1)
    addiu       $a2, $a2, 0x20
    addiu       $a3, $a3, 0x1
    sh          $v0, 0x2($a1)
    sh          $v0, 0x2($a0)
    slti        $v0, $a3, 0x10
    bnez        $v0, .L8009F4FC
    addiu       $a1, $a1, 0x20
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    jal         func_8000C790
    nop
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    jal         func_80009E14
    addu        $a0, $zero, $zero
    lui         $a0, 0x44
    ori         $a0, $a0, 0x2048
    lui         $a1, 0x11
    jal         func_8000A63C
    ori         $a1, $a1, 0x2048
    lui         $a0, 0xE
    jal         func_8000B008
    ori         $a0, $a0, 0x3001
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    jal         func_8000A984
    addu        $a0, $zero, $zero
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFE
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0x793C
    addu        $a0, $zero, $zero
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A270
    sw          $a1, 0x4($v1)
    jal         func_80009E58
    addu        $a0, $zero, $zero
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $zero, 0x10($sp)
    lui         $a0, 0x400
    ori         $a0, $a0, 0x81FF
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addu        $a3, $zero, $zero
    lui         $t0, 0xB100
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a0, 0x0($v1)
    sw          $s0, 0x4($v1)
.L8009F638:
    lui         $a2, 0x8008
    lw          $a2, 0x4F5C($a2)
    sll         $a0, $a3, 1
    addiu       $v0, $a3, 0x2
    addiu       $v1, $a3, 0x3
    addiu       $a1, $a3, 0x1
    addu        $a3, $v0, $zero
    andi        $a0, $a0, 0xFF
    sll         $a0, $a0, 16
    sll         $v1, $v1, 1
    andi        $v1, $v1, 0xFF
    sll         $a1, $a1, 1
    andi        $a1, $a1, 0xFF
    addiu       $v0, $a2, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v0, $a3, 9
    andi        $v0, $v0, 0xFE00
    or          $v0, $a0, $v0
    or          $v0, $v0, $v1
    or          $v0, $v0, $t0
    sll         $v1, $v1, 8
    or          $a0, $a0, $v1
    or          $a0, $a0, $a1
    sw          $v0, 0x0($a2)
    slti        $v0, $a3, 0x1E
    bnez        $v0, .L8009F638
    sw          $a0, 0x4($a2)
    lw          $ra, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_8009F4D4
