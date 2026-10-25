.text
.align 2
.set noreorder
.globl func_800C284C
.ent func_800C284C
func_800C284C:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    jal         func_800BDF68
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $v1, $zero, -0x2001
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_80016FD4
    nop
    andi        $a0, $v0, 0xFFFF
    jal         func_80035EF0
    addiu       $a1, $zero, 0x1B
    jal         func_80016FD4
    nop
    andi        $a0, $v0, 0xFFFF
    jal         func_80035EF0
    addiu       $a1, $zero, 0x1D
    jal         func_80016FD4
    nop
    andi        $a0, $v0, 0xFFFF
    jal         func_80035EF0
    addiu       $a1, $zero, 0x1C
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8009
    sh          $v0, -0x4CC4($at)
    lui         $at, 0x8008
    sh          $zero, 0xC20($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C284C
