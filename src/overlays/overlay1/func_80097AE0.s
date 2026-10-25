.text
.align 2
.set noreorder
.globl func_80097AE0
.ent func_80097AE0
func_80097AE0:
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
    sltiu       $v0, $v0, 0x4B1
    beqz        $v0, .L80097B4C
    addu        $s0, $a0, $zero
    jal         func_80030DF0
    nop
    andi        $v0, $v0, 0x1000
    bnez        $v0, .L80097B4C
    addiu       $v0, $zero, -0x1
    lui         $v1, 0x8008
    lw          $v1, 0x6D24($v1)
    beq         $v1, $v0, .L80097B4C
    addiu       $v0, $zero, 0x5
    lui         $v1, 0x8008
    lh          $v1, 0x76DC($v1)
    bne         $v1, $v0, .L80097BC0
    nop
.L80097B4C:
    lui         $at, 0x8008
    sh          $zero, 0x7A90($at)
    jal         func_800B7D98
    nop
    jal         func_8002FF70
    addu        $a0, $s0, $zero
    lui         $a0, 0x8008
    lw          $a0, 0x7A64($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7990($a1)
    jal         func_8000D874
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lui         $a1, 0x8008
    lw          $a1, 0x7990($a1)
    jal         func_8000D834
    nop
    lui         $a0, 0x8009
    lw          $a0, -0x6D3C($a0)
    jal         func_8001AEA8
    nop
    jal         func_800AF858
    nop
    lui         $a0, 0x8009
    addiu       $a0, $a0, 0x34B0
    addiu       $a1, $zero, 0xA
    jal         func_8002FEA4
    addu        $a2, $zero, $zero
.L80097BC0:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_80097AE0
