.text
.align 2
.set noreorder
.globl func_800BDD70
.ent func_800BDD70
func_800BDD70:
    sw          $ra, 0x10($sp)
    lw          $a0, 0x14($v1)
    andi        $v0, $a0, 0x100
    beqz        $v0, .L800BDDD4
    addiu       $v0, $zero, -0x101
    lw          $a1, 0x4C($v1)
    and         $v0, $a0, $v0
    beqz        $a1, .L800BDDA0
    sw          $v0, 0x14($v1)
    lw          $v0, 0x50($v1)
    j           func_800B9688
    sw          $v0, 0x50($a1)
.L800BDDA0:
    lw          $v0, 0x50($v1)
    lui         $at, 0x8008
    sw          $v0, 0x7940($at)
    lw          $a0, 0x50($v1)
    beqz        $a0, .L800BDDC0
    nop
    lw          $v0, 0x4C($v1)
    sw          $v0, 0x4C($a0)
.L800BDDC0:
    lui         $a0, 0x8007
    lw          $a0, 0x26D0($a0)
    lw          $a1, 0x48($v1)
    jal         func_800332C8
    nop
.L800BDDD4:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BDD70
