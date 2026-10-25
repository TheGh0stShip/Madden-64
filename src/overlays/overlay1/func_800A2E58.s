.text
.align 2
.set noreorder
.globl func_800A2E58
.ent func_800A2E58
func_800A2E58:
    sll         $v0, $s1, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, -0x1
    bne         $v0, $v1, .L800A2E84
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
    bnez        $v0, .L800A2E84
    nop
    jal         func_80028144
    nop
.L800A2E84:
    lui         $v0, 0x8009
    lhu         $v0, -0x7F3C($v0)
    andi        $v0, $v0, 0x6
    bnez        $v0, . + 4 + (0xC << 2)
    lui         $v1, 0x80
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    and         $v0, $v0, $v1
    beqz        $v0, . + 4 + (0x7 << 2)
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x7F50($v0)
.end func_800A2E58
