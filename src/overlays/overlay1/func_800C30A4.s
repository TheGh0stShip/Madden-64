.text
.align 2
.set noreorder
.globl func_800C30A4
.ent func_800C30A4
func_800C30A4:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    andi        $v0, $v0, 0x2000
    beqz        $v0, .L800C30F4
    sw          $ra, 0x10($sp)
    j           func_800BE9B8
    nop
.L800C30C4:
    jal         func_80030110
    nop
    jal         func_80030050
    nop
    jal         func_8000BF08
    nop
    lui         $v0, 0x8008
    lhu         $v0, 0xC20($v0)
    addiu       $v0, $v0, -0x1
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L800C30C4
    nop
.L800C30F4:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C30A4
