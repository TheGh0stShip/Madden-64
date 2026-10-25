.text
.align 2
.set noreorder
.globl func_800B38F4
.ent func_800B38F4
func_800B38F4:
    addiu       $sp, $sp, -0x18
    addiu       $v0, $zero, 0x1
    addu        $a0, $zero, $zero
    sw          $ra, 0x10($sp)
    lui         $at, 0x8007
    sb          $v0, -0x1590($at)
    jal         func_80032E00
    addiu       $a1, $zero, 0x48C
    lui         $at, 0x8007
    sw          $v0, -0x158C($at)
    lui         $at, 0x8007
    sw          $zero, -0x1588($at)
    jal         func_800AFA30
    nop
    addu        $a2, $zero, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x5058
.L800B3938:
    addu        $a0, $zero, $zero
    addu        $v1, $a1, $zero
.L800B3940:
    sw          $zero, 0x0($v1)
    addiu       $a0, $a0, 0x1
    sltiu       $v0, $a0, 0x2
    bnez        $v0, .L800B3940
    addiu       $v1, $v1, 0x4
    addiu       $a2, $a2, 0x1
    sltiu       $v0, $a2, 0x2
    bnez        $v0, .L800B3938
    addiu       $a1, $a1, 0x8
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B38F4
