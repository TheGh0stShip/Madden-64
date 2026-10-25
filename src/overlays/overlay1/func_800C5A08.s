.text
.align 2
.set noreorder
.globl func_800C5A08
.ent func_800C5A08
func_800C5A08:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8008
    lw          $s0, 0x55F8($s0)
    sw          $ra, 0x1C($sp)
    sw          $s2, 0x18($sp)
    beqz        $s0, .L800C5A70
    sw          $s1, 0x14($sp)
    addiu       $s2, $zero, 0x25
    addiu       $s1, $zero, 0x8
.L800C5A30:
    lw          $v0, 0x24($s0)
    lw          $v1, 0x14($v0)
    ori         $v1, $v1, 0x200
    sw          $v1, 0x14($v0)
    lw          $a0, 0x24($s0)
    lui         $a1, 0x8007
    addiu       $a1, $a1, 0x4824
    sh          $s2, 0x34($s0)
    jal         func_800B96C0
    sh          $s1, 0x36($s0)
    lw          $v0, 0x24($s0)
    sh          $zero, 0x3E($v0)
    sh          $zero, 0x30($s0)
    lw          $s0, 0x0($s0)
    bnez        $s0, .L800C5A30
    nop
.L800C5A70:
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C5A08
