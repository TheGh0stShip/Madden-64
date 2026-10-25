.text
.align 2
.set noreorder
.globl func_80097BD4
.ent func_80097BD4
func_80097BD4:
    lui         $v0, 0x8008
    lhu         $v0, 0x7A90($v0)
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    sw          $ra, 0x14($sp)
    addu        $v0, $v0, $v1
    lui         $at, 0x8008
    sh          $v0, 0x7A90($at)
    andi        $v0, $v0, 0xFFFF
    sltiu       $v0, $v0, 0x835
    beqz        $v0, .L80097C30
    addu        $s0, $a0, $zero
    jal         func_80030DF0
    nop
    andi        $v0, $v0, 0x1000
    bnez        $v0, .L80097C30
    addiu       $v0, $zero, 0x5
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    bne         $v1, $v0, .L80097C50
    nop
.L80097C30:
    jal         func_8002FF70
    addu        $a0, $s0, $zero
    jal         func_80041658
    nop
    jal         func_800AF8E0
    nop
    jal         func_8008F924
    nop
.L80097C50:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80097BD4
