.text
.align 2
.set noreorder
.globl func_800996E4
.ent func_800996E4
func_800996E4:
    lui         $v0, 0x8008
    lw          $v0, -0x7BA8($v0)
    addiu       $sp, $sp, -0x18
    bnez        $v0, .L8009970C
    sw          $ra, 0x10($sp)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x100
    lui         $at, 0x8008
    sw          $v0, -0x7BA8($at)
.L8009970C:
    jal         func_80097120
    addiu       $a0, $zero, 0x3
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8009
    sh          $v0, -0x72D8($at)
    addiu       $v0, $zero, 0x300
    lui         $at, 0x8009
    sh          $v0, -0x6A44($at)
    addiu       $v0, $zero, 0x100
    lui         $at, 0x8009
    sh          $v0, -0x6A3C($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800996E4
