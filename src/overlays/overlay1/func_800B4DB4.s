.text
.align 2
.set noreorder
.globl func_800B4DB4
.ent func_800B4DB4
func_800B4DB4:
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $a2, $zero, $zero
    addiu       $a3, $zero, 0x1
    addu        $a1, $v0, $zero
    sh          $zero, 0x0($a1)
    sh          $zero, 0x2($a1)
    sh          $zero, 0x4($a1)
    sh          $zero, 0x6($a1)
.L800B4DD8:
    addu        $v0, $a1, $a2
    lbu         $v1, 0xA6($v0)
    lbu         $a0, 0x98($v0)
    beql        $v1, $a3, .L800B4DEC
    negu        $a0, $a0
.L800B4DEC:
    lhu         $v0, 0x0($a1)
    lhu         $v1, 0x6($a1)
    addiu       $a2, $a2, 0x1
    addu        $v0, $v0, $a0
    subu        $v1, $v1, $a0
    sh          $v0, 0x0($a1)
    sltiu       $v0, $a2, 0x7
    bnez        $v0, .L800B4DD8
    sh          $v1, 0x6($a1)
    addu        $a2, $zero, $zero
    lui         $a1, 0x8007
    lw          $a1, -0x158C($a1)
    addiu       $a3, $zero, 0x1
.L800B4E20:
    addu        $v0, $a1, $a2
    lbu         $v1, 0xAD($v0)
    lbu         $a0, 0x9F($v0)
    beql        $v1, $a3, .L800B4E34
    negu        $a0, $a0
.L800B4E34:
    lhu         $v0, 0x4($a1)
    lhu         $v1, 0x2($a1)
    addiu       $a2, $a2, 0x1
    addu        $v0, $v0, $a0
    subu        $v1, $v1, $a0
    sh          $v0, 0x4($a1)
    sltiu       $v0, $a2, 0x7
    bnez        $v0, .L800B4E20
    sh          $v1, 0x2($a1)
    addu        $a2, $zero, $zero
    addiu       $t0, $zero, 0x1
    addiu       $a3, $zero, 0x2
.L800B4E64:
    lui         $a1, 0x8007
    lw          $a1, -0x158C($a1)
    sll         $v1, $a2, 1
    addiu       $v0, $a2, 0x1
    andi        $v0, $v0, 0x1
    sll         $v0, $v0, 1
    addu        $v1, $v1, $a1
    addu        $v0, $v0, $a1
    lhu         $v1, 0x4($v1)
    lhu         $v0, 0x4($v0)
    subu        $a0, $v1, $v0
    subu        $v1, $v0, $v1
    addiu       $v0, $a0, 0x5
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0xB
    beqz        $v0, .L800B4EB0
    addu        $v0, $a1, $a2
    j           func_800B07CC
    sb          $zero, 0xCC($v0)
.L800B4EB0:
    sll         $v0, $a0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, -0xA
    beqz        $v0, .L800B4EE0
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    negu        $v0, $v0
    slti        $v0, $v0, -0xA
    beqz        $v0, .L800B4EE0
    addu        $v0, $a1, $a2
    j           func_800B07CC
    sb          $t0, 0xCC($v0)
.L800B4EE0:
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $v0, $v0, $a2
    sb          $a3, 0xCC($v0)
    addiu       $a2, $a2, 0x1
    sltiu       $v0, $a2, 0x2
    bnez        $v0, .L800B4E64
    nop
    jr          $ra
    nop
.end func_800B4DB4
