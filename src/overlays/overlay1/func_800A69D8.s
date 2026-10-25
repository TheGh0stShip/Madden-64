.text
.align 2
.set noreorder
.globl func_800A69D8
.ent func_800A69D8
func_800A69D8:
    addu        $a1, $s1, $zero
    lui         $a0, 0x8007
    lhu         $a0, -0x6458($a0)
    lui         $a1, 0x8007
    lhu         $a1, -0x6456($a1)
    jal         func_80035F88
    nop
    addiu       $v0, $zero, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x7FA4($at)
    sw          $zero, 0x0($s0)
    lw          $ra, 0x34($sp)
    lw          $s2, 0x30($sp)
    lw          $s1, 0x2C($sp)
    lw          $s0, 0x28($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800A69D8
