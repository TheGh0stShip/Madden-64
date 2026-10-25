.text
.align 2
.set noreorder
.globl func_8003C8E0
.ent func_8003C8E0
func_8003C8E0:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a3, $zero
    sw          $ra, 0x14($sp)
    lui         $at, 0x8008
    sw          $s0, 0x5028($at)
    jal         func_800356C4
    nop
    lui         $at, 0x8008
    sh          $v0, 0x5D42($at)
    addiu       $v0, $zero, 0x1
    bne         $s0, $v0, .L8003C938
    addiu       $a0, $zero, -0x1
    jal         func_800049F0
    addiu       $a0, $zero, 0x5622
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7B70
    addiu       $a2, $zero, 0x420
    jal         func_80033308
    addu        $a3, $zero, $zero
    addiu       $a0, $zero, -0x1
.L8003C938:
    addiu       $v1, $zero, 0x41
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x7B51
.L8003C944:
    sb          $a0, 0x0($v0)
    addiu       $v1, $v1, -0x1
    bgez        $v1, .L8003C944
    addiu       $v0, $v0, -0x1
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    addiu       $a1, $a1, 0x7B08
    addiu       $a2, $zero, 0x8
    jal         func_80033308
    addiu       $a3, $zero, 0xFF
    addu        $a0, $zero, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x4870
    addiu       $a2, $zero, 0x8
    jal         func_80033308
    addu        $a3, $zero, $zero
    lui         $a0, 0x8004
    addiu       $a0, $a0, -0x3428
    addiu       $a1, $zero, 0x5
    jal         func_8002FEA4
    addu        $a2, $zero, $zero
    lui         $a0, 0x8007
    lb          $a0, 0x34FC($a0)
    lui         $at, 0x8008
    sw          $v0, -0x5AC8($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8008
    sh          $v0, 0x7AAE($at)
    addiu       $v0, $zero, -0x1
    lui         $at, 0x8007
    sw          $v0, 0x34F8($at)
    jal         func_8003CB2C
    nop
    addu        $a0, $zero, $zero
    addiu       $a1, $zero, 0x2000
    jal         func_800337CC
    addiu       $a2, $zero, 0x10
    addu        $a0, $zero, $zero
    addu        $a1, $v0, $zero
    addiu       $a2, $zero, 0x2000
    addu        $a3, $zero, $zero
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x4CB8
    jal         func_80033308
    sw          $a1, 0x0($s0)
    lw          $v0, 0x0($s0)
    lui         $v1, 0x8009
    lw          $v1, -0x79E0($v1)
    lui         $at, 0x8008
    sh          $zero, -0x5ABC($at)
    lui         $at, 0x8008
    sh          $zero, -0x5AC0($at)
    lui         $at, 0x8008
    sh          $zero, -0x5AC4($at)
    lui         $at, 0x8008
    sw          $zero, 0x7B00($at)
    addiu       $v0, $v0, 0x1000
    lui         $at, 0x8009
    sw          $v0, -0x4CB4($at)
    lui         $at, 0x8009
    sw          $v1, -0x4C88($at)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_8003C8E0
