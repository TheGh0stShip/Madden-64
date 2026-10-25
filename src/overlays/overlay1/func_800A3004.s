.text
.align 2
.set noreorder
.globl func_800A3004
.ent func_800A3004
func_800A3004:
    beqz        $v0, .L800A3014
    lui         $v0, 0xFF7F
    lui         $at, 0x8008
    sh          $zero, 0x57C0($at)
.L800A3014:
    lui         $v1, 0x8008
    lw          $v1, 0xC10($v1)
    lui         $a0, 0x8009
    lh          $a0, -0x6CE0($a0)
    ori         $v0, $v0, 0xFFF6
    and         $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, 0xC10($at)
    bnez        $a0, .L800A3050
    lui         $v0, 0x320
    lui         $at, 0x8008
    sw          $v0, 0x793C($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sh          $v0, -0x4856($at)
.L800A3050:
    lui         $at, 0x8009
    sh          $zero, -0x7F8C($at)
    jal         func_80092FDC
    nop
    lw          $ra, 0x6C($sp)
    lw          $s2, 0x68($sp)
    lw          $s1, 0x64($sp)
    lw          $s0, 0x60($sp)
    addiu       $sp, $sp, 0x70
    jr          $ra
    nop
.end func_800A3004
