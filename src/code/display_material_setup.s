.text
.align 2
.set noreorder
.globl display_material_setup
.ent display_material_setup
display_material_setup:
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x18($sp)
    addu        $s0, $a1, $zero
    addu        $a0, $zero, $zero
    sw          $ra, 0x1C($sp)
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xE700
    sw          $v0, 0x0($v1)
    jal         func_8000A3C0
    sw          $zero, 0x4($v1)
    ori         $a0, $zero, 0x8000
    ori         $a1, $zero, 0x8000
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    jal         func_8000B1D8
    sw          $v0, 0x10($sp)
    lui         $a0, 0x44
    ori         $a0, $a0, 0x3048
    lui         $a1, 0x11
    jal         func_8000A63C
    ori         $a1, $a1, 0x3048
    addu        $a0, $zero, $zero
    addu        $a1, $zero, $zero
    addiu       $a2, $zero, 0xFF
    addiu       $a3, $zero, 0xFF
    addiu       $v0, $zero, 0x33
    sw          $v0, 0x10($sp)
    addiu       $v0, $zero, 0xFF
    jal         func_80009EE0
    sw          $v0, 0x14($sp)
    jal         func_80009E58
    addu        $a0, $zero, $zero
    jal         func_8000A984
    addu        $a0, $zero, $zero
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A830
    addiu       $a0, $zero, 0xC00
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    lui         $a2, 0xFCFF
    ori         $a2, $a2, 0xFFFF
    lui         $a1, 0xFFFC
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $a1, $a1, 0xF279
    ori         $a0, $zero, 0x8000
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a2, 0x0($v1)
    jal         func_8000A940
    sw          $a1, 0x4($v1)
    addu        $a0, $zero, $zero
    jal         func_80009310
    addu        $a1, $s0, $zero
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end display_material_setup
