.text
.align 2
.set noreorder
.globl func_800AEAD0
.ent func_800AEAD0
func_800AEAD0:
    beqz        $v0, .L800AEB10
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0x57CA($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    subu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, 0x57CA($at)
    sll         $v0, $v0, 16
    bgez        $v0, .L800AEB10
    nop
    jal         func_800AD404
    nop
    jal         func_800AF104
    nop
.L800AEB10:
    lui         $v1, 0x8007
    lh          $v1, -0x463A($v1)
    addiu       $v0, $zero, -0x1
    beq         $v1, $v0, . + 4 + (0xDA << 2)
    addu        $s1, $zero, $zero
    lui         $v0, 0x8008
    lh          $v0, 0x580C($v0)
.end func_800AEAD0
