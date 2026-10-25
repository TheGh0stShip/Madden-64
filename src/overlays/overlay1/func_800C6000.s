.text
.align 2
.set noreorder
.globl func_800C6000
.ent func_800C6000
func_800C6000:
    addu        $s0, $zero, $zero
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    lui         $a0, 0x8008
.end func_800C6000
