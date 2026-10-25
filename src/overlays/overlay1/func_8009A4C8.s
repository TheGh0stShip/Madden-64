.text
.align 2
.set noreorder
.globl func_8009A4C8
.ent func_8009A4C8
func_8009A4C8:
    sw          $a2, 0x0($v1)
    jal         func_8000A984
    sw          $a1, 0x4($v1)
    jal         func_8000A8B8
    addiu       $a0, $zero, 0x2000
    jal         func_8000A874
    addu        $a0, $zero, $zero
    jal         func_8000A8FC
    addu        $a0, $zero, $zero
    jal         func_80009E58
    addiu       $a0, $zero, 0x1
    jal         func_8000A940
    ori         $a0, $zero, 0x8000
    lhu         $v0, 0x58($s0)
    beqz        $v0, . + 4 + (0x1E << 2)
    nop
    lui         $v0, 0x8008
.end func_8009A4C8
