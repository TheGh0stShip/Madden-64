.text
.align 2
.set noreorder
.globl func_800A2CD0
.ent func_800A2CD0
func_800A2CD0:
    beqz        $v0, . + 4 + (0x25 << 2)
    nop
    jal         func_8009E958
    nop
    jal         func_8009C9E8
    nop
    addiu       $a0, $zero, 0x19
    jal         func_8009C900
    addiu       $a1, $zero, 0x2
    jal         func_8002098C
    nop
    sll         $v0, $v0, 16
    beqz        $v0, . + 4 + (0x12 << 2)
    nop
    jal         func_8002099C
    nop
    sll         $v0, $v0, 16
    bnez        $v0, . + 4 + (0xD << 2)
    nop
    jal         func_800209AC
    nop
    addu        $a1, $v0, $zero
    lhu         $v0, 0x10($a1)
    lw          $v1, 0x8($a1)
    lw          $a0, 0xC($a1)
    xori        $v0, $v0, 0x1
    negu        $v1, $v1
    negu        $a0, $a0
    sh          $v0, 0x10($a1)
.end func_800A2CD0
