.text
.align 2
.set noreorder
.globl func_8009C9E8
.ent func_8009C9E8
func_8009C9E8:
    addiu       $v1, $s3, -0x2
    .word       0x0083001A  # div         $zero, $a0, $v1
    bnez        $v1, .L8009C9FC
    nop
    break       7
.L8009C9FC:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, . + 4 + (0x4 << 2)
    lui         $at, 0x8000
.end func_8009C9E8
