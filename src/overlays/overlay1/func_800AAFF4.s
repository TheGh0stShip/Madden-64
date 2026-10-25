.text
.align 2
.set noreorder
.globl func_800AAFF4
.ent func_800AAFF4
func_800AAFF4:
    addiu       $s1, $zero, 0x1
    lw          $v1, 0x24($s0)
    sll         $v0, $a0, 16
    sra         $v0, $v0, 9
    addu        $v1, $v1, $v0
    j           func_800A6910
    sw          $v1, 0x24($s0)
.end func_800AAFF4
