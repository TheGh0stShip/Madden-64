.text
.align 2
.set noreorder
.globl func_8009F868
.ent func_8009F868
func_8009F868:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s0, 0x8($a0)
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
    lui         $a0, 0x44
    ori         $a0, $a0, 0x2048
    lui         $a1, 0x11
    jal         func_8000A63C
    ori         $a1, $a1, 0x2048
    jal         func_80009E14
    addu        $a0, $zero, $zero
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
    lui         $v0, 0x400
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    ori         $v0, $v0, 0x103F
    lui         $a0, 0xB100
    sw          $v0, 0x0($v1)
    lw          $a1, 0x0($s0)
    ori         $a0, $a0, 0x206
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0x604
    sw          $a0, 0x8($v1)
    sw          $v0, 0xC($v1)
    sw          $a1, 0x4($v1)
    lw          $ra, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
    nop
.end func_8009F868
