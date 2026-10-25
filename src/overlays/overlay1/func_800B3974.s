.text
.align 2
.set noreorder
.globl func_800B3974
.ent func_800B3974
func_800B3974:
    addiu       $sp, $sp, -0x48
    addiu       $v0, $zero, 0x1
    sw          $ra, 0x40($sp)
    sw          $s1, 0x3C($sp)
    sw          $s0, 0x38($sp)
    lui         $at, 0x8007
    sb          $v0, -0x158F($at)
    jal         func_80016FD4
    nop
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    jal         func_80016FC4
    addu        $s1, $v0, $zero
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x2000
    addiu       $v0, $zero, 0x2
    sh          $v0, 0x14($sp)
    addiu       $v0, $zero, 0x2000
    sh          $zero, 0x18($sp)
    sh          $zero, 0x16($sp)
    jal         func_80032E00
    sw          $v0, 0x1C($sp)
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    addiu       $a1, $zero, 0x1
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0x4FB0
    addu        $a2, $v0, $zero
    jal         func_800363F4
    sw          $v0, 0x0($s0)
    lw          $v0, 0x0($s0)
    addu        $a0, $zero, $zero
    addiu       $a1, $sp, 0x10
    jal         func_8000D8DC
    sw          $v0, 0x10($sp)
    lui         $at, 0x8009
    sw          $v0, -0x5058($at)
    jal         func_80016FC4
    andi        $a0, $s1, 0xFFFF
    lw          $ra, 0x40($sp)
    lw          $s1, 0x3C($sp)
    lw          $s0, 0x38($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800B3974
