.text
.align 2
.set noreorder
.globl func_80092830
.ent func_80092830
func_80092830:
    lw          $v0, 0x0($a0)
    lbu         $v0, 0x21($v0)
    and         $v0, $v0, $s4
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s5
    j           func_8008E53C
    sw          $s0, 0x0($v0)
.end func_80092830
