.text
.align 2
.set noreorder
.globl func_80097D30
.ent func_80097D30
func_80097D30:
    addiu       $sp, $sp, -0x48
    sw          $ra, 0x40($sp)
    addiu       $a3, $sp, 0x10
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0x5E8
    addiu       $t0, $a2, 0x30
.L80097D48:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L80097D48
    addiu       $a3, $a3, 0x10
    jal         func_800418F8
    nop
    jal         func_800B7C80
    nop
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0xC8
    addu        $a3, $zero, $zero
    addiu       $v1, $zero, 0x2
    lui         $at, 0x8008
    sw          $v0, 0x6A2C($at)
    sb          $v1, 0x0($v0)
    lui         $v1, 0x8008
    lw          $v1, 0x6A2C($v1)
    addiu       $t0, $sp, 0x10
    addiu       $v0, $zero, 0x3
    sh          $v0, 0xA4($v1)
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x3E64
    sh          $zero, 0xA8($v1)
    sh          $zero, 0xA6($v1)
    sw          $v0, 0xAC($v1)
.L80097DCC:
    lui         $v1, 0x8008
    lw          $v1, 0x6A2C($v1)
    sll         $v0, $a3, 4
    addiu       $a3, $a3, 0x1
    addu        $v0, $v0, $v1
    lw          $v1, 0x0($t0)
    lw          $a0, 0x4($t0)
    lw          $a1, 0x8($t0)
    lw          $a2, 0xC($t0)
    sw          $v1, 0x4($v0)
    sw          $a0, 0x8($v0)
    sw          $a1, 0xC($v0)
    sw          $a2, 0x10($v0)
    sltiu       $v0, $a3, 0x3
    bnez        $v0, .L80097DCC
    addiu       $t0, $t0, 0x10
    jal         func_800B7C80
    nop
    jal         func_800BCFAC
    nop
    jal         func_8009386C
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    lui         $v1, 0x8008
    lw          $v1, 0x6A2C($v1)
    lui         $v0, 0x8009
    lw          $v0, -0x6B70($v0)
    addu        $a1, $zero, $zero
    addu        $a2, $zero, $zero
    jal         func_8000CB78
    sw          $v0, 0xB0($v1)
    lui         $v0, 0x8009
    addiu       $v0, $v0, 0x3750
    lui         $at, 0x8008
    sw          $v0, 0x6DD8($at)
    jal         func_80041BB4
    addiu       $a0, $zero, 0x7
    lw          $ra, 0x40($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_80097D30
