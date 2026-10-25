.text
.align 2
.set noreorder
.globl func_8009B088
.ent func_8009B088
func_8009B088:
    lui         $v0, 0x8008
    lw          $v0, 0x7958($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    andi        $s0, $a0, 0xFFFF
    sll         $s0, $s0, 2
    sw          $ra, 0x14($sp)
    addu        $v0, $s0, $v0
    lw          $v0, 0x0($v0)
    lw          $a1, 0x4($v0)
    jal         func_80032F3C
    addu        $a0, $zero, $zero
    lui         $v0, 0x8008
    lw          $v0, 0x7958($v0)
    lui         $a0, 0x8009
    lw          $a0, -0x4F94($a0)
    addu        $v0, $s0, $v0
    lw          $a1, 0x0($v0)
    jal         func_800332C8
    nop
    lui         $v0, 0x8008
    lw          $v0, 0x7958($v0)
    addu        $s0, $s0, $v0
    sw          $zero, 0x0($s0)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8009B088
