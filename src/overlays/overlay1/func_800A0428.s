.text
.align 2
.set noreorder
.globl func_800A0428
.ent func_800A0428
func_800A0428:
    lui         $v0, 0x8008
    lb          $v0, 0x5BFA($v0)
    addiu       $sp, $sp, -0x18
    sltu        $v0, $v0, $a0
    beqz        $v0, .L800A0448
    sw          $ra, 0x10($sp)
    lui         $at, 0x8008
    sb          $a0, 0x5BFA($at)
.L800A0448:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, 0x1D
    lui         $at, 0x8008
    sb          $v1, 0x7AB0($at)
    addiu       $v1, $zero, -0x201
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800C5F80
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A0428
