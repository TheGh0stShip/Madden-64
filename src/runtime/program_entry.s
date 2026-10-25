.set noreorder
.set noat
.text

.globl program_entry
.ent program_entry
program_entry:
    lui     $sp, 0x803F
    ori     $sp, $sp, 0xFFF0
    lui     $t0, 0x8007
    addiu   $t0, $t0, 0x76C0
    lui     $t1, 0x8009
    addiu   $t1, $t1, -0x4720
    beq     $t0, $t1, 2f
     nop
1:
    addiu   $t0, $t0, 4
    sltu    $at, $t0, $t1
    bnez    $at, 1b
     sw     $zero, -4($t0)
2:
    .word   0x0C00B9B2
     nop
    .word   0x0001008D
.end program_entry
