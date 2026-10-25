.text
.align 2
.set noreorder
.globl func_800B6538
.ent func_800B6538
func_800B6538:
    lui         $v0, 0x8009
    lw          $v0, -0x6D64($v0)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    bnez        $v0, .L800B6588
    sw          $ra, 0x14($sp)
    jal         func_800AEA9C
    addu        $a0, $zero, $zero
    jal         func_8002FF70
    addu        $a0, $s0, $zero
    lui         $v0, 0xFFF7
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    ori         $v0, $v0, 0xFFFF
    lui         $a0, 0x2000
    or          $v1, $v1, $a0
    and         $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
.L800B6588:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B6538
