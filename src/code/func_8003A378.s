.text
.align 2
.set noreorder
.globl func_8003A378
.ent func_8003A378
func_8003A378:
    addu        $a1, $a0, $zero
    addu        $t1, $zero, $zero
    addiu       $a2, $zero, 0xFF
    andi        $v1, $t1, 0xFFFF
.L8003A388:
    lui         $a0, 0x8007
    lw          $a0, 0x343C($a0)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v1, $v0, $a0
    lbu         $v0, 0xD($v1)
    bnel        $v0, $a2, .L8003A470
    addiu       $t1, $t1, 0x1
    addu        $a3, $v1, $zero
    addu        $a2, $a1, $zero
    or          $v0, $a2, $a3
    andi        $v0, $v0, 0x3
    beqz        $v0, .L8003A418
    addiu       $t0, $a2, 0x20
.L8003A3C4:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    lwl         $a0, 0x8($a2)
    lwr         $a0, 0xB($a2)
    lwl         $a1, 0xC($a2)
    lwr         $a1, 0xF($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a0, 0x8($a3)
    swr         $a0, 0xB($a3)
    swl         $a1, 0xC($a3)
    swr         $a1, 0xF($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8003A3C4
    addiu       $a3, $a3, 0x10
    j .L8003A444
    nop
.L8003A418:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8003A418
    addiu       $a3, $a3, 0x10
.L8003A444:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    ori         $v0, $t1, 0x8000
    j .L8003A484
    andi        $v0, $v0, 0xFFFF
.L8003A470:
    andi        $v0, $t1, 0xFFFF
    sltiu       $v0, $v0, 0x18
    bnez        $v0, .L8003A388
    andi        $v1, $t1, 0xFFFF
    addu        $v0, $zero, $zero
.L8003A484:
    jr          $ra
    nop
.end func_8003A378
