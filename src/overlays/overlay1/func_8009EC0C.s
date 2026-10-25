.text
.align 2
.set noreorder
.globl func_8009EC0C
.ent func_8009EC0C
func_8009EC0C:
    andi        $a1, $a1, 0x1
    sll         $v1, $v0, 24
    beqz        $a1, .L8009EC24
    sra         $v0, $v1, 24
    j           func_8009A504
    andi        $v0, $v0, 0xF
.L8009EC24:
    srl         $v0, $v1, 28
    jr          $ra
    nop
.end func_8009EC0C
