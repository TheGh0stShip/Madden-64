.text
.align 2
.set noreorder
.globl func_800A2DB8
.ent func_800A2DB8
func_800A2DB8:
    nop
    sll         $v0, $v0, 16
    bnez        $v0, .L800A2DF8
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
    sw          $v1, 0x8($a1)
    sw          $a0, 0xC($a1)
.L800A2DF8:
    lui         $v0, 0x8008
.end func_800A2DB8
