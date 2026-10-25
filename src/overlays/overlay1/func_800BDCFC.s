.text
.align 2
.set noreorder
.globl func_800BDCFC
.ent func_800BDCFC
func_800BDCFC:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $v0, 0x14($s0)
    lui         $v1, 0x8008
    lw          $v1, 0x7940($v1)
    sw          $zero, 0x4C($s0)
    ori         $v0, $v0, 0x100
    beqz        $v1, .L800BDD2C
    sw          $v0, 0x14($s0)
    sw          $s0, 0x4C($v1)
.L800BDD2C:
    lui         $v0, 0x8008
    lw          $v0, 0x7940($v0)
    lui         $a0, 0x8007
    lw          $a0, 0x26D0($a0)
    lui         $at, 0x8008
    sw          $s0, 0x7940($at)
    jal         func_80033298
    sw          $v0, 0x50($s0)
    sw          $v0, 0x48($s0)
    sh          $zero, 0x14($v0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BDCFC
