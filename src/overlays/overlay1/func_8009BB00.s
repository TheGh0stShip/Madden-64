.text
.align 2
.set noreorder
.globl func_8009BB00
.ent func_8009BB00
func_8009BB00:
    addiu       $v1, $v1, -0x10
    lui         $at, 0x8008
    sh          $v0, -0x7B78($at)
    sll         $v0, $v0, 2
    lui         $at, 0x8008
    sh          $v1, -0x7B74($at)
    sll         $v1, $v1, 2
    lui         $at, 0x8008
    sh          $v0, -0x7B78($at)
    lui         $at, 0x8008
    sh          $v1, -0x7B74($at)
    jal         func_8000A3C0
    lui         $a0, 0x20
    jal         func_80009E14
    lui         $a0, 0x80
    jal         func_8000A984
    addu        $a0, $zero, $zero
    jal         func_8000A8B8
    addu        $a0, $zero, $zero
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_80009E58
    addiu       $a0, $zero, 0x1
    addu        $a0, $zero, $zero
    jal         func_8000A63C
    addu        $a1, $zero, $zero
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
    lw          $a1, 0xC($s0)
    jal         func_80009310
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x2
    sw          $v0, 0x14($sp)
    sw          $v0, 0x18($sp)
    sll         $v0, $s1, 2
    sw          $zero, 0x10($sp)
    sw          $zero, 0x1C($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    sw          $zero, 0x28($sp)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $a0, -0x7BA0($at)
    addiu       $a1, $zero, 0x2
.end func_8009BB00
