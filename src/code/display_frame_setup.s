.text
.align 2
.set noreorder
.globl display_frame_setup
.ent display_frame_setup
display_frame_setup:
    addiu       $sp, $sp, -0x20
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    sw          $ra, 0x1C($sp)
    jal         func_8000B184
    sw          $s0, 0x18($sp)
    jal         func_8000A3C0
    addu        $a0, $zero, $zero
    jal         func_80009E14
    addu        $a0, $zero, $zero
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    addu        $a0, $zero, $zero
    lhu         $a1, 0x1F8($v0)
    lhu         $a2, 0x1FA($v0)
    lhu         $a3, 0xA($v0)
    lhu         $v0, 0xC($v0)
    lui         $s0, 0x1FFF
    ori         $s0, $s0, 0xFFFF
    jal         func_8000A6A0
    sw          $v0, 0x10($sp)
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_8000A940
    addu        $a0, $zero, $zero
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A984
    lui         $a0, 0x8
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
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
    lui         $a0, 0xC08
    ori         $a0, $a0, 0x4000
    lui         $a1, 0x302
    jal         func_8000A63C
    ori         $a1, $a1, 0x4000
    jal         func_8000A22C
    addiu       $a0, $zero, 0xC0
    lui         $a2, 0x380
    ori         $a2, $a2, 0x10
    lui         $a0, 0x1F
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a1, 0x8009
    lw          $a1, -0x49AC($a1)
    ori         $a0, $a0, 0x3204
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    addiu       $v0, $v1, 0x10
    addiu       $a1, $a1, 0x218
    and         $a1, $a1, $s0
    sw          $zero, 0x4($v1)
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x8($v1)
    jal         func_8000B008
    sw          $a1, 0xC($v1)
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8000B1D8
    sw          $zero, 0x10($sp)
    jal         func_8000AFA8
    addiu       $a0, $zero, 0x204
    lui         $v0, 0x8009
    lh          $v0, -0x79CC($v0)
    lui         $a2, 0x8008
    lw          $a2, 0x4F5C($a2)
    lui         $a1, 0x8008
    lw          $a1, 0x5294($a1)
    lui         $v1, 0xFF10
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    addiu       $v0, $v0, -0x1
    andi        $v0, $v0, 0xFFF
    or          $v0, $v0, $v1
    sll         $a1, $a1, 2
    sw          $v0, 0x0($a2)
    lui         $at, 0x8009
    addu        $at, $at, $a1
    lw          $a1, -0x5F98($at)
    lui         $v1, 0x8009
    lw          $v1, -0x7910($v1)
    addiu       $v0, $a2, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a2, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xFE00
    sw          $v0, 0x8($a2)
    addiu       $v0, $zero, 0x2
    and         $v1, $v1, $s0
    and         $a1, $a1, $s0
    sw          $v1, 0xC($a2)
    sw          $a1, 0x4($a2)
    jal         func_8000C790
    sh          $v0, 0x1EA($a0)
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    lhu         $a0, 0x1E8($v0)
    jal         func_8000B140
    nop
    jal         func_8000ADC0
    addiu       $a0, $zero, 0x2
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end display_frame_setup
