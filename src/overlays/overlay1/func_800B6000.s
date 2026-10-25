.text
.align 2
.set noreorder
.globl func_800B6000
.ent func_800B6000
func_800B6000:
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addiu       $sp, $sp, -0x30
    addiu       $v0, $zero, 0x688
    sh          $v0, 0x10($sp)
    addiu       $v0, $zero, 0x8
    sw          $ra, 0x28($sp)
    sw          $zero, 0x14($sp)
    sw          $zero, 0x18($sp)
    jal         func_8000C8A0
    sh          $v0, 0x20($sp)
    addu        $a0, $v0, $zero
    addiu       $a1, $zero, 0x1
    jal         func_8000D740
    addiu       $a2, $sp, 0x10
    lui         $a2, 0x8008
    lw          $a2, 0x6178($a2)
    lw          $v1, 0x1C($a2)
    lui         $at, 0x8008
    sw          $v1, -0x5E4C($at)
    lw          $v1, 0x20($a2)
    lui         $a3, 0x15F
    ori         $a3, $a3, 0xFF00
    lui         $at, 0x8008
    sw          $v1, -0x5E48($at)
    lw          $v1, 0x24($a2)
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0xC0
    lui         $at, 0x8008
    sw          $v0, -0x5E54($at)
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8009
    sh          $v0, -0x4DEE($at)
    lui         $v0, 0xC0
    lui         $at, 0x8008
    sw          $v1, -0x5E44($at)
    sw          $v0, 0x1C($a2)
    lui         $v0, 0x140
    sw          $a3, 0x20($a2)
    jal         func_80032E00
    sw          $v0, 0x24($a2)
    addu        $a3, $v0, $zero
    lui         $a2, 0x8008
    addiu       $a2, $a2, 0x6CE8
    addiu       $t0, $a2, 0xC0
    lui         $at, 0x8008
    sw          $a3, -0x5E50($at)
.L800B60BC:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L800B60BC
    addiu       $a3, $a3, 0x10
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $a2, 0x8008
    lw          $a2, -0x5E50($a2)
    lui         $v1, 0x8008
    lw          $v1, 0x6178($v1)
    lui         $a1, 0x800A
    addiu       $a1, $a1, 0x3164
    addiu       $v0, $zero, 0xC
    sw          $a0, 0x14($a2)
    sh          $v0, 0x2($a2)
    sh          $v0, 0x4($a2)
    sh          $zero, 0x0($a2)
    sw          $v1, 0xC($a2)
    jal         func_8000CB78
    sw          $v1, 0x10($a2)
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6CE8
    jal         func_800A2DB8
    nop
    lui         $a0, 0x8008
    lw          $a0, -0x5E50($a0)
    jal         func_800A2CD0
    nop
    jal         func_800A365C
    addiu       $a0, $zero, 0x2
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    bnez        $v0, .L800B617C
    addu        $a1, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, -0x5E50($a0)
    addiu       $a2, $zero, 0xC
    j           func_800B1A68
    addiu       $a3, $zero, 0xBFF
.L800B617C:
    lui         $a0, 0x8008
    lw          $a0, -0x5E50($a0)
    addiu       $a2, $zero, 0xC
    addiu       $a3, $zero, 0x3FF
    jal         func_800A3004
    nop
    lw          $ra, 0x28($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800B6000
