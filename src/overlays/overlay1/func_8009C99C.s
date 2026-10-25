.text
.align 2
.set noreorder
.globl func_8009C99C
.ent func_8009C99C
func_8009C99C:
    andi        $v0, $v0, 0x100
    beqz        $v0, .L8009C9B0
    addiu       $s4, $zero, 0x1
    addiu       $s5, $zero, 0x1
    addu        $s4, $zero, $zero
.L8009C9B0:
    lhu         $v1, 0x14($s1)
    addiu       $v0, $zero, 0x1000
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L8009C9C8
    nop
    break       7
.L8009C9C8:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L8009C9E0
    lui         $at, 0x8000
    bne         $v0, $at, .L8009C9E0
    nop
    break       6
.L8009C9E0:
    .word       0x00009812  # mflo        $s3
    lhu         $a0, 0x16($s1)
.end func_8009C99C
