.text
.align 2
.set noreorder
.globl func_8009D298
.ent func_8009D298
func_8009D298:
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
    lui         $a1, 0x11
    jal         func_8000A63C
    ori         $a1, $a1, 0x2048
    jal         func_80009E9C
    addu        $a0, $zero, $zero
    jal         func_80011248
    addu        $a0, $s2, $zero
    lhu         $a0, 0x0($v0)
    lhu         $a1, 0x2($v0)
    jal         func_8000AECC
    nop
    addiu       $a0, $zero, 0xFF
    addiu       $a1, $zero, 0xFF
    addiu       $a2, $zero, 0xFF
    jal         func_8000A08C
    addu        $a3, $zero, $zero
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lw          $a1, 0x10($s0)
    lui         $v0, 0x8008
    lw          $v0, -0x7B58($v0)
    beq         $a1, $v0, .L8009D35C
    nop
    jal         func_80009310
    addu        $a0, $zero, $zero
    lw          $v0, 0x10($s0)
    lui         $at, 0x8008
    sw          $v0, -0x7B58($at)
.L8009D35C:
    lw          $v1, 0xC($s0)
    lui         $v0, 0x8008
    lw          $v0, -0x7B54($v0)
    beq         $v1, $v0, .L8009D45C
    lui         $a0, 0x400
    lhu         $a2, 0x14($s0)
    lhu         $a3, 0x16($s0)
    sw          $zero, 0x10($sp)
    sw          $s5, 0x14($sp)
    sw          $s4, 0x18($sp)
    lhu         $v0, 0x3C($s0)
    sw          $v0, 0x1C($sp)
    lhu         $v0, 0x3E($s0)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    sw          $v0, 0x20($sp)
    lw          $a0, 0xC($s0)
    jal         func_8000979C
    addiu       $a1, $zero, 0x2
    j           func_80098D28
    nop
    ori         $a3, $a3, 0xFFFF
    lui         $a2, 0xFFFC
    ori         $a2, $a2, 0xF279
    lui         $a0, 0xC08
    ori         $a0, $a0, 0x4000
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a1, 0x302
    ori         $a1, $a1, 0x4000
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a3, 0x0($v1)
    jal         func_8000A63C
    sw          $a2, 0x4($v1)
    jal         func_80009E58
    addu        $a0, $zero, $zero
    jal         func_8000A940
    addu        $a0, $zero, $zero
    lw          $v1, 0xC($s0)
    lui         $v0, 0x8008
    lw          $v0, -0x7B54($v0)
    beq         $v1, $v0, .L8009D458
    addu        $a1, $zero, $zero
    lhu         $a3, 0x14($s0)
    lhu         $v0, 0x16($s0)
    sw          $zero, 0x14($sp)
    sw          $s5, 0x18($sp)
    sw          $s4, 0x1C($sp)
    sw          $v0, 0x10($sp)
    lhu         $v0, 0x3C($s0)
    sw          $v0, 0x20($sp)
    lhu         $v0, 0x3E($s0)
    sw          $zero, 0x28($sp)
    sw          $zero, 0x2C($sp)
    sw          $v0, 0x24($sp)
    lw          $a0, 0xC($s0)
    jal         func_800094D0
    addiu       $a2, $zero, 0x2
    lw          $v0, 0xC($s0)
    lui         $at, 0x8008
    sw          $v0, -0x7B54($at)
.L8009D458:
    lui         $a0, 0x400
.L8009D45C:
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $v0, 0x8009
    lhu         $v0, -0x502C($v0)
    ori         $a0, $a0, 0x103F
    lui         $a1, 0xB100
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sw          $a0, 0x0($v1)
    lw          $a0, 0x4($v0)
    ori         $a1, $a1, 0x204
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $v1, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0x406
    sw          $a1, 0x8($v1)
    sw          $v0, 0xC($v1)
    sw          $a0, 0x4($v1)
    lw          $ra, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_8009D298
