.text
.align 2
.set noreorder
.globl func_800B73A4
.ent func_800B73A4
func_800B73A4:
    jal         func_80011308
    addiu       $s4, $zero, 0x1
    j           func_800B2CA0
    andi        $s0, $s4, 0xFFFF
.end func_800B73A4
