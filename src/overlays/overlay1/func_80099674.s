.text
.align 2
.set noreorder
.globl func_80099674
.ent func_80099674
func_80099674:
    bne         $a0, $v0, .L80099694
    addu        $a0, $zero, $zero
    addiu       $v0, $zero, 0x1F
    sb          $v0, 0x10($sp)
    sb          $v0, 0x11($sp)
    sb          $v0, 0x12($sp)
    jal         func_80011228
    sb          $zero, 0x13($sp)
.L80099694:
    lui         $a0, 0x8008
    lw          $a0, 0xC24($a0)
    addiu       $a1, $zero, 0x3DE
    addiu       $a2, $zero, 0x3E5
    jal         func_8000EB68
    addiu       $a3, $sp, 0x10
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x7A94($at)
    j           func_80094FAC
    nop
.end func_80099674
