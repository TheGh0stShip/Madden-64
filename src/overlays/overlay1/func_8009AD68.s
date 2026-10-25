.text
.align 2
.set noreorder
.globl func_8009AD68
.ent func_8009AD68
func_8009AD68:
    lui         $a3, 0xFCFF
    ori         $a3, $a3, 0xFFFF
    lui         $a2, 0xFFFC
    ori         $a2, $a2, 0xF279
    lui         $a0, 0x44
    ori         $a0, $a0, 0x3048
    lui         $v1, 0x8008
    lw          $v1, 0x4F5C($v1)
    lui         $a1, 0x11
    ori         $a1, $a1, 0x3048
    addiu       $v0, $v1, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    sw          $a3, 0x0($v1)
    jal         func_8000A63C
    sw          $a2, 0x4($v1)
    addiu       $a0, $zero, 0x1
    jal         func_80009E58
    nop
    lui         $a2, 0x400
    sh          $zero, 0x28($s1)
    sh          $zero, 0x8($s1)
    sh          $zero, 0x1A($s1)
    sh          $zero, 0xA($s1)
    lhu         $v0, 0x5C($s2)
    ori         $a2, $a2, 0x103F
    lui         $a0, 0x8008
    lw          $a0, 0x4F5C($a0)
    lui         $a1, 0xB100
    sll         $v0, $v0, 6
    sh          $v0, 0x38($s1)
    sh          $v0, 0x18($s1)
    lhu         $v1, 0x5E($s2)
    ori         $a1, $a1, 0x206
    addiu       $v0, $a0, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $a0, 0x10
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    addiu       $v0, $zero, 0x604
    sll         $v1, $v1, 6
    sh          $v1, 0x3A($s1)
    sh          $v1, 0x2A($s1)
    sw          $a2, 0x0($a0)
    sw          $s1, 0x4($a0)
    sw          $a1, 0x8($a0)
    sw          $v0, 0xC($a0)
    lw          $ra, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    lwc1        $f31, 0x88($sp)
    lwc1        $f30, 0x8C($sp)
    lwc1        $f29, 0x80($sp)
    lwc1        $f28, 0x84($sp)
    lwc1        $f27, 0x78($sp)
    lwc1        $f26, 0x7C($sp)
    lwc1        $f25, 0x70($sp)
    lwc1        $f24, 0x74($sp)
    lwc1        $f23, 0x68($sp)
    lwc1        $f22, 0x6C($sp)
    lwc1        $f21, 0x60($sp)
    lwc1        $f20, 0x64($sp)
    addiu       $sp, $sp, 0x90
    jr          $ra
    nop
.end func_8009AD68
