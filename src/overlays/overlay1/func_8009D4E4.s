.text
.align 2
.set noreorder
.globl func_8009D4E4
.ent func_8009D4E4
func_8009D4E4:
    lw          $t0, 0x8($a0)
    lw          $v1, 0x0($t0)
    beqz        $v1, .L8009D538
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L8009D574
    addiu       $a3, $zero, 0x1
    addiu       $a2, $t0, 0x4
.L8009D500:
    lw          $v1, 0x4($a2)
    addiu       $a0, $zero, 0x3
    addiu       $v1, $v1, 0x30
.L8009D50C:
    sb          $a1, 0xF($v1)
    addiu       $v1, $v1, -0x10
    addu        $v0, $a0, $zero
    bnez        $v0, .L8009D50C
    addiu       $a0, $a0, -0x1
    addiu       $a2, $a2, -0x4
    addu        $v0, $a3, $zero
    bnez        $v0, .L8009D500
    addiu       $a3, $a3, -0x1
    j           func_80098E44
    nop
.L8009D538:
    lhu         $a0, 0x36($t0)
    lw          $v1, 0x4($t0)
    addu        $v0, $a0, $zero
    beqz        $v0, .L8009D568
    addiu       $a0, $a0, -0x1
    sll         $v0, $a0, 4
    addu        $v1, $v0, $v1
.L8009D554:
    sb          $a1, 0xF($v1)
    addiu       $v1, $v1, -0x10
    addu        $v0, $a0, $zero
    bnez        $v0, .L8009D554
    addiu       $a0, $a0, -0x1
.L8009D568:
    lhu         $v0, 0x3A($t0)
    ori         $v0, $v0, 0x80
    sh          $v0, 0x3A($t0)
.L8009D574:
    jr          $ra
    nop
.end func_8009D4E4
