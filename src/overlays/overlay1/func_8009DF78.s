.text
.align 2
.set noreorder
.globl func_8009DF78
.ent func_8009DF78
func_8009DF78:
    sw          $v0, 0x10($sp)
    lw          $v0, 0x4($s1)
    lw          $v1, 0x14($sp)
    addiu       $a0, $sp, 0x10
    sll         $v0, $v0, 16
    subu        $v0, $v0, $v1
    sw          $v0, 0x14($sp)
    lw          $v0, 0x8($s1)
    lw          $v1, 0x18($sp)
    addu        $a1, $s0, $zero
    sll         $v0, $v0, 16
    subu        $v0, $v0, $v1
    jal         func_8002DBD0
    sw          $v0, 0x18($sp)
    jal         func_8002D884
    addiu       $a0, $sp, 0x10
    lw          $v0, 0x0($s0)
    lw          $v1, 0x10($sp)
    subu        $v0, $v0, $v1
    sw          $v0, 0x0($s0)
    lw          $v0, 0x4($s0)
    lw          $v1, 0x14($sp)
    subu        $v0, $v0, $v1
    sw          $v0, 0x4($s0)
    lw          $v0, 0x8($s0)
    lw          $v1, 0x18($sp)
    subu        $v0, $v0, $v1
    sw          $v0, 0x8($s0)
    lh          $v0, 0x0($s0)
    lh          $v1, 0x4($s0)
    lh          $a0, 0x8($s0)
    sw          $v0, 0x0($s0)
    sw          $v1, 0x4($s0)
    jal         func_8002CD28
    sw          $a0, 0x8($s0)
    lw          $ra, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009DF78
