.text
.align 2
.set noreorder
.globl func_800556A8
.ent func_800556A8
func_800556A8:
    lw          $v0, 0x4C($a0)
    bnez        $v0, .L80055778
    addu        $v0, $zero, $zero
    lw          $v0, 0x12C($a0)
    bnez        $v0, .L80055778
    addu        $v0, $zero, $zero
    lw          $v1, 0x24($a0)
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L80055778
    addu        $v0, $zero, $zero
    lw          $a1, 0x20($a0)
    bne         $a1, $v1, .L80055778
    nop
    lw          $a2, 0x28($a0)
    addiu       $v0, $zero, 0x2
    bne         $a2, $v0, .L80055778
    addu        $v0, $zero, $zero
    lw          $v0, 0x78($a0)
    bne         $v0, $a1, .L80055778
    addu        $v0, $zero, $zero
    lw          $v1, 0xD8($a0)
    lw          $v0, 0x8($v1)
    bne         $v0, $a2, .L80055778
    addu        $v0, $zero, $zero
    lw          $a1, 0x5C($v1)
    addiu       $v0, $zero, 0x1
    bne         $a1, $v0, .L80055778
    addu        $v0, $zero, $zero
    lw          $a2, 0xB0($v1)
    bne         $a2, $a1, .L80055778
    nop
    lw          $v0, 0xC($v1)
    slti        $v0, $v0, 0x3
    beqz        $v0, .L80055778
    addu        $v0, $zero, $zero
    lw          $a1, 0x60($v1)
    bne         $a1, $a2, .L80055778
    nop
    lw          $v0, 0xB4($v1)
    bne         $v0, $a1, .L80055778
    addu        $v0, $zero, $zero
    lw          $a1, 0x24($v1)
    lw          $v0, 0x138($a0)
    bne         $a1, $v0, .L80055778
    addu        $v0, $zero, $zero
    lw          $a0, 0x78($v1)
    bne         $a0, $a1, .L80055778
    nop
    lw          $v0, 0xCC($v1)
    bne         $v0, $a0, .L80055778
    addu        $v0, $zero, $zero
    addiu       $v0, $zero, 0x1
.L80055778:
    jr          $ra
    nop
.end func_800556A8
