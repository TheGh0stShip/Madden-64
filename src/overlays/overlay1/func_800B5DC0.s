.text
.align 2
.set noreorder
.globl func_800B5DC0
.ent func_800B5DC0
func_800B5DC0:
    lw          $v0, -0x6D24($v0)
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    jal         func_8000D8DC
    sw          $v0, 0x24($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8009
    sw          $a0, -0x6D14($at)
    jal         func_80016FE4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x6D20($v0)
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    jal         func_8000D8DC
    sw          $v0, 0x24($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8009
    sw          $a0, -0x6D10($at)
    jal         func_80016FE4
    nop
    lui         $v0, 0x8009
    lw          $v0, -0x6D1C($v0)
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    jal         func_8000D8DC
    sw          $v0, 0x24($sp)
    addu        $a0, $v0, $zero
    lui         $at, 0x8009
    sw          $a0, -0x6D0C($at)
.end func_800B5DC0
