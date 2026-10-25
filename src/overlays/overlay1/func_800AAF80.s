.text
.align 2
.set noreorder
.globl func_800AAF80
.ent func_800AAF80
func_800AAF80:
    lhu         $v0, 0x5C($s0)
    addiu       $s1, $zero, 0x1
    addu        $v0, $v0, $a0
    j           func_800A6910
    sh          $v0, 0x5C($s0)
.end func_800AAF80
