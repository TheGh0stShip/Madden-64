.text
.align 2
.set noreorder
.globl func_800AB074
.ent func_800AB074
func_800AB074:
    lw          $v0, 0x40($s0)
    lw          $a0, 0x3C($s0)
    addu        $v0, $v0, $a1
    beq         $a0, $v0, . + 4 + (-0x52 << 2)
    addu        $a2, $v1, $zero
    lw          $v0, 0x3C($s0)
    lw          $a0, 0x40($s0)
    addiu       $v1, $zero, -0x100
    addiu       $v0, $v0, 0x1
    sw          $v0, 0x3C($s0)
    and         $v0, $v0, $v1
    slt         $v0, $a0, $v0
    beqz        $v0, .L800AB0B0
    addiu       $v0, $a0, 0x100
    sw          $v0, 0x40($s0)
.L800AB0B0:
    lui         $v1, 0x8009
    lhu         $v1, -0x5A4C($v1)
    addiu       $s3, $s3, 0x1
    andi        $v0, $s3, 0xFFFF
    sltu        $v0, $v0, $v1
    bnez        $v0, . + 4 + (-0x6E << 2)
    nop
    lhu         $v0, 0x84($s0)
    ori         $v0, $v0, 0x10
    sh          $v0, 0x84($s0)
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800AB074
