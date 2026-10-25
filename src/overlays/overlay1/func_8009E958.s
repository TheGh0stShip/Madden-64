.text
.align 2
.set noreorder
.globl func_8009E958
.ent func_8009E958
func_8009E958:
    lui         $a0, 0x40
    ori         $a0, $a0, 0x41C8
    lui         $a1, 0x10
    jal         func_8000A63C
    ori         $a1, $a1, 0x41C8
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lw          $s4, 0x34($sp)
    lw          $a1, 0xC($s4)
    addu        $a0, $zero, $zero
    jal         func_80009310
    addiu       $a1, $a1, 0x528
    addiu       $v0, $zero, 0x2
    sw          $zero, 0x10($sp)
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    lw          $a0, 0xC($s4)
    addiu       $a1, $zero, 0x2
    addiu       $a2, $zero, 0x50
    jal         func_8000979C
    addiu       $a3, $zero, 0x21
    jal         func_80009E58
    addu        $a0, $zero, $zero
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    jal         func_8000B1D8
    sw          $v0, 0x10($sp)
    lui         $a1, 0xFC12
    ori         $a1, $a1, 0x1824
    lui         $a0, 0xFF33
    ori         $a0, $a0, 0xFFFF
    addu        $t7, $zero, $zero
    addu        $t6, $zero, $zero
    addu        $t2, $zero, $zero
    addiu       $t4, $zero, 0x90
    addiu       $t5, $zero, 0x23
    lui         $s0, 0x400
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $t3, 0xB100
    lui         $t1, 0x8007
    addiu       $t1, $t1, -0x7980
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a1, 0x0($v1)
    sw          $a0, 0x4($v1)
    slt         $v0, $t7, $t6
    bnel        $v0, $zero, .L8009EAB8
    sll         $a1, $t2, 1
    slti        $v0, $t4, 0x20
    beqz        $v0, .L8009EA74
    addiu       $a1, $zero, 0x20
    addu        $a1, $t4, $zero
.L8009EA74:
    subu        $t4, $t4, $a1
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    addu        $t6, $t6, $a1
    addu        $t2, $zero, $zero
    sll         $v1, $a1, 10
    addiu       $v0, $a0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sll         $v0, $a1, 4
    addiu       $v0, $v0, -0x1
    or          $v1, $v1, $v0
    andi        $v1, $v1, 0xFFFF
    or          $v1, $v1, $s0
    sw          $v1, 0x0($a0)
    sw          $t1, 0x4($a0)
    sll         $a1, $t2, 1
.L8009EAB8:
    addiu       $v1, $t2, 0x1
    addiu       $a0, $t2, 0x3
    addiu       $a2, $t2, 0x2
    addiu       $t2, $t2, 0x4
    addiu       $t1, $t1, 0x40
    addiu       $t7, $t7, 0x4
    lui         $a3, 0x8008
    lw          $a3, 0x4F5C($a3)
    addu        $t0, $t5, $zero
    addiu       $t5, $t5, -0x1
    andi        $a1, $a1, 0xFF
    sll         $a1, $a1, 16
    sll         $v1, $v1, 9
    andi        $v1, $v1, 0xFE00
    or          $v1, $a1, $v1
    sll         $a0, $a0, 1
    andi        $a0, $a0, 0xFF
    or          $v1, $v1, $a0
    or          $v1, $v1, $t3
    sll         $a0, $a0, 8
    or          $a1, $a1, $a0
    sll         $a2, $a2, 1
    andi        $a2, $a2, 0xFF
.end func_8009E958
