.text
.align 2
.set noreorder
.globl func_8000F344
.ent func_8000F344
func_8000F344:
    addiu       $sp, $sp, -0x78
    lwc1        $f0, 0x88($sp)
    lwc1        $f2, 0x8C($sp)
    lwc1        $f4, 0x90($sp)
    .word       0x44854000  # mtc1        $a1, $f8
    sw          $ra, 0x70($sp)
    lw          $a1, 0x8($a0)
    lui         $at, 0x8000
    lwc1        $f6, 0x6D0($at)
    .word       0x44865000  # mtc1        $a2, $f10
    addiu       $a0, $sp, 0x30
    sw          $a3, 0x10($sp)
    sw          $zero, 0x20($sp)
    sw          $zero, 0x24($sp)
    .word       0x46000007  # neg.s       $f0, $f0
    addiu       $a1, $a1, 0xD8
    .word       0x46001087  # neg.s       $f2, $f2
    swc1        $f0, 0x14($sp)
    .word       0x46005007  # neg.s       $f0, $f10
    .word       0x44064000  # mfc1        $a2, $f8
    .word       0x44070000  # mfc1        $a3, $f0
    .word       0x46002107  # neg.s       $f4, $f4
    swc1        $f6, 0x28($sp)
    swc1        $f2, 0x18($sp)
    jal         func_800480D8
    swc1        $f4, 0x1C($sp)
    lw          $ra, 0x70($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
    nop
.end func_8000F344
