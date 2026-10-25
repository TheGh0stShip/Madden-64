.text
.align 2
.set noreorder
.globl func_8009F4A4
.ent func_8009F4A4
func_8009F4A4:
    blezl       $a0, .L8009F4D0
    sh          $a1, 0x2($a2)
    jal         func_80031A1C
    addiu       $a0, $zero, 0x4
    lw          $v1, 0xC($s1)
    lw          $a0, 0x8($s1)
    addu        $v1, $s0, $v1
    lhu         $v1, 0x2($v1)
    addu        $a0, $s0, $a0
    subu        $v1, $v1, $v0
    sh          $v1, 0x2($a0)
.L8009F4D0:
    addiu       $s0, $s0, 0x8
.end func_8009F4A4
