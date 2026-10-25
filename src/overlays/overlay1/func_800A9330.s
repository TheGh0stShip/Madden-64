.text
.align 2
.set noreorder
.globl func_800A9330
.ent func_800A9330
func_800A9330:
    lw          $v1, 0x98($s0)
    addiu       $v0, $zero, 0x1
    bne         $v1, $v0, .L800A934C
    nop
    lw          $v0, 0x18($s0)
    j           func_800A4C34
    lui         $v1, 0xC0
.L800A934C:
    bnez        $v1, .L800A9360
    lui         $v1, 0xFFA0
    lw          $v0, 0x18($s0)
    addu        $v0, $v0, $v1
    sw          $v0, 0x18($s0)
.L800A9360:
    jal         func_800A6C48
    addu        $a0, $s0, $zero
    addiu       $v0, $zero, 0x564
    sh          $v0, 0x20($sp)
    j           func_800A4C88
    lui         $v0, 0x8C
.end func_800A9330
