.text
.align 2
.set noreorder
.globl func_800B2394
.ent func_800B2394
func_800B2394:
    jal         func_8002C760
    andi        $a1, $s4, 0xFFFF
    addu        $a0, $s1, $s0
    sll         $a0, $a0, 3
    addu        $a0, $a0, $s5
    sll         $v0, $v0, 16
    jal         func_800AB48C
    sra         $a1, $v0, 16
    j           func_800ADCB8
    sll         $v1, $s2, 16
.end func_800B2394
