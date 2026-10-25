.text
.align 2
.set noreorder
.globl func_80094288
.ent func_80094288
func_80094288:
    addiu       $a0, $v1, -0xC
    lui         $v1, 0xFFFE
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    ori         $v1, $v1, 0xFFFF
    and         $v0, $v0, $v1
    lui         $at, 0x8008
    sw          $v0, 0xC10($at)
    jal         func_800AEA9C
    addu        $a0, $zero, $zero
    lw          $ra, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80094288
