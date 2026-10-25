.text
.align 2
.set noreorder
.globl func_80097E9C
.ent func_80097E9C
func_80097E9C:
    addu        $s1, $zero, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8000DC7C
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a0, 0x8008
    lw          $a0, 0x5298($a0)
    jal         func_8003456C
    nop
    lui         $a1, 0x8009
    lhu         $a1, -0x5A4C($a1)
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    jal         func_8003456C
    nop
    jal         func_8000BF08
    nop
    jal         func_800B7C80
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_80093ABC
    nop
    j           func_80093850
    nop
.end func_80097E9C
