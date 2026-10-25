.text
.align 2
.set noreorder
.globl func_80097C64
.ent func_80097C64
func_80097C64:
    lui         $v0, 0x8008
    lh          $v0, 0x6CF2($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    bnez        $v0, .L80097CB4
    sw          $ra, 0x14($sp)
    jal         func_8009CA08
    nop
    beqz        $v0, .L80097CB4
    nop
    jal         func_800A365C
    addiu       $a0, $zero, 0x6
    andi        $v0, $s0, 0xFF
    lui         $at, 0x8008
    sw          $zero, 0x6D80($at)
    lui         $at, 0x8008
    sw          $v0, 0x6D84($at)
    lui         $at, 0x8008
    sw          $zero, 0x6D88($at)
.L80097CB4:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80097C64
