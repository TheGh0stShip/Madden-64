.text
.align 2
.set noreorder
.globl func_800C53B0
.ent func_800C53B0
func_800C53B0:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $a0, 0x24($s0)
    lw          $v1, 0x14($a0)
    lui         $v0, 0x1
    and         $v0, $v1, $v0
    bnez        $v0, .L800C5410
    addu        $v0, $zero, $zero
    lui         $v0, 0xFFC3
    ori         $v0, $v0, 0xFFFF
    and         $v0, $v1, $v0
    sw          $v0, 0x14($a0)
    lw          $a0, 0x24($s0)
    jal         func_80034388
    sw          $a1, 0x2C($s0)
    lw          $a0, 0x24($s0)
    lui         $a1, 0xFFFD
    lw          $v1, 0x14($a0)
    ori         $a1, $a1, 0xFFFF
    addiu       $v0, $zero, 0x1
    and         $v1, $v1, $a1
    sw          $v1, 0x14($a0)
.L800C5410:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C53B0
