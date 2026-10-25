.text
.align 2
.set noreorder
.globl func_80093540
.ent func_80093540
func_80093540:
    sra         $v0, $v0, 14
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lw          $v0, 0x78A8($at)
    sll         $v1, $v1, 2
    lui         $at, 0x8009
    addu        $at, $at, $v1
    sw          $v0, -0x4CA0($at)
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    addiu       $s0, $zero, -0x1
    bne         $v0, $s0, . + 4 + (0x99 << 2)
    nop
    lui         $a0, 0x8009
    lh          $a0, -0x7920($a0)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    lb          $v0, 0x6DDC($at)
    bnez        $v0, .L80093598
    nop
    jal         func_80091E2C
    nop
.L80093598:
    lui         $v0, 0x8009
    lhu         $v0, -0x498E($v0)
    srl         $v0, $v0, 1
.end func_80093540
