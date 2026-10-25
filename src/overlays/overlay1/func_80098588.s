.text
.align 2
.set noreorder
.globl func_80098588
.ent func_80098588
func_80098588:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_80093A20
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x6A2C($v0)
    lw          $a0, 0xC0($v0)
    jal         func_8001AEA8
    nop
    addu        $v1, $zero, $zero
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x6E34
.L800985B8:
    sw          $zero, 0x0($a0)
    addiu       $v1, $v1, 0x1
    sltiu       $v0, $v1, 0x19
    bnez        $v0, .L800985B8
    addiu       $a0, $a0, 0x4
    addu        $v1, $zero, $zero
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0x7784
.L800985D8:
    sw          $zero, 0x0($a0)
    addiu       $v1, $v1, 0x1
    sltiu       $v0, $v1, 0x5
    bnez        $v0, .L800985D8
    addiu       $a0, $a0, 0x4
    addiu       $v0, $zero, 0x2
    lui         $at, 0x8009
    sb          $v0, -0x7F68($at)
    jal         func_800B0F38
    addiu       $a0, $zero, 0xFF
    lui         $a1, 0x8008
    lw          $a1, 0x6A2C($a1)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $at, 0x8008
    sw          $zero, 0x6A2C($at)
    jal         func_8008D1EC
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80098588
