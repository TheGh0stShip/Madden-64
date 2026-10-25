.text
.align 2
.set noreorder
.globl func_8009DB50
.ent func_8009DB50
func_8009DB50:
    addiu       $sp, $sp, -0x30
    sw          $s1, 0x24($sp)
    addu        $s1, $a0, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x49AC($a0)
    sw          $ra, 0x28($sp)
    sw          $s0, 0x20($sp)
    lw          $s0, 0x8($s1)
    jal         func_8000C790
    nop
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x1
    beq         $v1, $v0, .L8009DC20
    nop
    beqz        $v1, .L8009DC10
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L8009DC28
    addiu       $v0, $zero, 0x3
    bne         $v1, $v0, .L8009DC28
    addiu       $a0, $sp, 0x10
    lui         $v1, 0x8009
    lw          $v1, -0x49AC($v1)
    lhu         $v0, 0x1FC($v1)
    srl         $v0, $v0, 1
    addiu       $v0, $v0, 0x10
    negu        $v0, $v0
    sh          $v0, 0x10($sp)
    lhu         $v0, 0x1FE($v1)
    srl         $v0, $v0, 1
    addiu       $v0, $v0, 0x10
    negu        $v0, $v0
    sh          $v0, 0x12($sp)
    lhu         $v0, 0x1FC($v1)
    addiu       $s0, $sp, 0x18
    addu        $a1, $s0, $zero
    addiu       $v0, $v0, 0x20
    sh          $v0, 0x14($sp)
    lhu         $v0, 0x1FE($v1)
    lui         $a2, 0x4
    ori         $a2, $a2, 0x93E0
    addiu       $v0, $v0, 0x20
    jal         func_8009951C
    sh          $v0, 0x16($sp)
    addu        $a0, $s1, $zero
    jal         func_80098980
    addu        $a1, $s0, $zero
    j           func_80099504
    nop
.L8009DC10:
    jal         func_800984F4
    addu        $a0, $s1, $zero
    j           func_80099504
    nop
.L8009DC20:
    jal         func_80099BD4
    addu        $a0, $s0, $zero
.L8009DC28:
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009DB50
