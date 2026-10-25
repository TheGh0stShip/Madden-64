.text
.align 2
.set noreorder
.globl func_800BC004
.ent func_800BC004
func_800BC004:
    lui         $v0, 0x8009
    lh          $v0, -0x5080($v0)
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s4
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
    bne         $fp, $s3, . + 4 + (0x6 << 2)
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x50A4($v0)
    lw          $a0, 0x24($v0)
    jal         func_8000DC18
.end func_800BC004
