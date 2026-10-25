.text
.align 2
.set noreorder
.globl func_80037C2C
.ent func_80037C2C
func_80037C2C:
    addu        $a1, $a0, $zero
    lbu         $v0, 0x0($a1)
    addiu       $v1, $v0, -0xA
    sltiu       $v0, $v1, 0x24
    beqz        $v0, .L80037D2C
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x2B18($at)
    jr          $v0
    nop
    lbu         $v0, 0x2($a1)
    addiu       $v0, $v0, -0x80
    negu        $v0, $v0
    j .L80037D28
    andi        $v0, $v0, 0x7F
    lbu         $v1, 0x1($a1)
    lbu         $a0, 0x2($a1)
    addiu       $v0, $zero, 0x6
    subu        $v0, $v0, $v1
    andi        $v1, $a0, 0xFF
    bnez        $v1, .L80037C90
    sb          $v0, 0x1($a1)
    j .L80037D28
    addiu       $v0, $zero, 0x1
.L80037C90:
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L80037CA4
    sltiu       $v0, $v1, 0x14
    j .L80037D2C
    sb          $zero, 0x2($a1)
.L80037CA4:
    bnez        $v0, .L80037D28
    addiu       $v0, $a0, 0xA
    j .L80037D28
    addiu       $v0, $a0, -0xA
    lbu         $v1, 0x1($a1)
    lbu         $a0, 0x2($a1)
    addiu       $v0, $zero, 0x6
    subu        $v0, $v0, $v1
    sb          $v0, 0x1($a1)
    addiu       $v0, $zero, 0x1A
    j .L80037D28
    subu        $v0, $v0, $a0
    lbu         $v0, 0x2($a1)
    addiu       $v0, $v0, -0x80
    negu        $v0, $v0
    j .L80037D28
    andi        $v0, $v0, 0x7F
    lbu         $v1, 0x1($a1)
    beqz        $v1, .L80037D2C
    addiu       $v0, $zero, 0x6
    subu        $v0, $v0, $v1
    j .L80037D2C
    sb          $v0, 0x1($a1)
    lbu         $v1, 0x2($a1)
    andi        $a0, $v1, 0xFF
    sltiu       $v0, $a0, 0x2
    bnez        $v0, .L80037D24
    addiu       $v0, $zero, 0x1
    sltiu       $v0, $a0, 0x5
    bnez        $v0, .L80037D24
    addiu       $v0, $zero, 0x6
    addiu       $v0, $zero, 0xD
.L80037D24:
    subu        $v0, $v0, $v1
.L80037D28:
    sb          $v0, 0x2($a1)
.L80037D2C:
    jr          $ra
    nop
.end func_80037C2C
