.text
.align 2
.set noreorder
.globl func_800A0308
.ent func_800A0308
func_800A0308:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_8009BD60
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x4000
    beqz        $v0, .L800A0354
    nop
    lui         $v0, 0x8009
    lh          $v0, -0x6B04($v0)
    bnez        $v0, .L800A0354
    nop
    lui         $v0, 0x8008
    lh          $v0, 0x57F0($v0)
    bnez        $v0, .L800A0354
    nop
    jal         func_800A0970
    nop
.L800A0354:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A0308
