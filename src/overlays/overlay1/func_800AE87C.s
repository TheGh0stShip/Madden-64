.text
.align 2
.set noreorder
.globl func_800AE87C
.ent func_800AE87C
func_800AE87C:
    sb          $zero, 0x6DCC($at)
    sw          $zero, 0x1C($sp)
    sh          $zero, 0x18($sp)
    sh          $zero, 0x16($sp)
    sw          $zero, 0x20($sp)
    jal         func_8000D8DC
    sw          $v0, 0x10($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8007
    sw          $a0, -0x4678($at)
    lui         $at, 0x8007
    sw          $a0, 0x2770($at)
    jal         func_80016FE4
    nop
    addiu       $a0, $zero, 0x140
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x4718
    jal         func_800AACE8
    addiu       $a2, $zero, 0x3
    sll         $v1, $v0, 16
    sra         $v1, $v1, 13
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lw          $a0, 0x6DEC($at)
    lw          $v1, 0x14($a0)
    lui         $at, 0x8009
.end func_800AE87C
