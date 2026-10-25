.text
.align 2
.set noreorder
.globl func_800A03D4
.ent func_800A03D4
func_800A03D4:
    lui         $v0, 0x8009
    lh          $v0, -0x6CE0($v0)
    addiu       $sp, $sp, -0x18
    beqz        $v0, .L800A0410
    sw          $ra, 0x10($sp)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, 0x1C
    lui         $at, 0x8008
    sb          $v1, 0x7AB0($at)
    ori         $v0, $v0, 0x200
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800C5F80
    nop
.L800A0410:
    lui         $at, 0x8008
    sb          $zero, 0x5BFA($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A03D4
