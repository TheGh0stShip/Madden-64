.text
.align 2
.set noreorder
.globl func_800B6610
.ent func_800B6610
func_800B6610:
    addiu       $v1, $v1, -0x5A0C
    addiu       $a0, $v1, -0x14
    lui         $at, 0x8007
    sw          $v0, 0x18E8($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $zero, -0x5080($at)
    lui         $at, 0x8009
    sh          $v0, -0x4DEE($at)
    lui         $at, 0x8009
    sw          $zero, -0x4CC0($at)
    jal         func_800A2F10
    sw          $zero, 0x0($v1)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B6610
