.text
.align 2
.set noreorder
.globl func_8002E890
.ent func_8002E890
func_8002E890:
    bnez        $a0, .L8002E8A4
    sra         $v0, $a1, 31
    andi        $v0, $v0, 0xC00
    j .L8002E994
    ori         $v0, $v0, 0x400
.L8002E8A4:
    bnez        $a1, .L8002E8B4
    sra         $v0, $a0, 31
    j .L8002E994
    andi        $v0, $v0, 0x800
.L8002E8B4:
    bgez        $a0, .L8002E8C4
    addu        $a2, $zero, $zero
    negu        $a0, $a0
    addiu       $a2, $zero, 0x1
.L8002E8C4:
    bgez        $a1, .L8002E8D8
    slt         $v0, $a1, $a0
    negu        $a1, $a1
    addiu       $a2, $a2, 0x2
    slt         $v0, $a1, $a0
.L8002E8D8:
    bnez        $v0, .L8002E8F0
    nop
    xor         $a0, $a0, $a1
    xor         $a1, $a1, $a0
    xor         $a0, $a0, $a1
    addiu       $a2, $a2, 0x4
.L8002E8F0:
    .word       0x44841000  # mtc1        $a0, $f2
    .word       0x468010A1  # cvt.d.w     $f2, $f2
    .word       0x44850000  # mtc1        $a1, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46220003  # div.d       $f0, $f0, $f2
    lui         $at, 0x8000
    lwc1        $f3, 0x1564($at)
    lwc1        $f2, 0x1568($at)
    .word       0x46220002  # mul.d       $f0, $f0, $f2
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44021000  # mfc1        $v0, $f2
    andi        $v0, $v0, 0xFFF
    sll         $v0, $v0, 1
    lui         $at, 0x8007
    addu        $at, $at, $v0
    lh          $v1, -0xD40($at)
    sltiu       $v0, $a2, 0x8
    beqz        $v0, .L8002E990
    sll         $v0, $a2, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0x1570($at)
    jr          $v0
    nop
    j .L8002E98C
    lui         $v0, 0x1
    j .L8002E98C
    ori         $v0, $zero, 0x8000
    ori         $v0, $zero, 0x8000
    j .L8002E990
    addu        $v1, $v1, $v0
    j .L8002E98C
    addiu       $v0, $zero, 0x4000
    ori         $v0, $zero, 0xC000
    j .L8002E990
    addu        $v1, $v1, $v0
    j .L8002E990
    addiu       $v1, $v1, 0x4000
    ori         $v0, $zero, 0xC000
.L8002E98C:
    subu        $v1, $v0, $v1
.L8002E990:
    sra         $v0, $v1, 4
.L8002E994:
    jr          $ra
    nop
.end func_8002E890
