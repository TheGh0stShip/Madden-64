.text
.align 2
.set noreorder
.globl func_80054AEC
.ent func_80054AEC
func_80054AEC:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a1, $zero
    sw          $ra, 0x20($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $v1, 0x10($s0)
    addiu       $v0, $zero, 0xCE
    beq         $v1, $v0, .L80054B44
    addu        $s2, $a2, $zero
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x12
    sw          $v0, 0x14($v1)
    lw          $v1, 0x0($s0)
    lw          $v0, 0x10($s0)
    sw          $v0, 0x18($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    nop
.L80054B44:
    lw          $v1, 0x8C($s0)
    lw          $v0, 0x74($s0)
    sltu        $v0, $v1, $v0
    bnez        $v0, .L80054B7C
    addiu       $v0, $zero, 0x77
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x4($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $zero, -0x1
    j .L80054C0C
    addu        $v0, $zero, $zero
.L80054B7C:
    lw          $v0, 0x8($s0)
    beqz        $v0, .L80054BA8
    nop
    sw          $v1, 0x4($v0)
    lw          $v1, 0x8($s0)
    lw          $v0, 0x74($s0)
    sw          $v0, 0x8($v1)
    lw          $v0, 0x8($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80054BA8:
    lw          $v1, 0x134($s0)
    lw          $v0, 0x138($s0)
    .word       0x00620018  # mult        $v1, $v0
    .word       0x00008812  # mflo        $s1
    sltu        $v0, $s2, $s1
    beqz        $v0, .L80054BDC
    addiu       $v0, $zero, 0x15
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80054BDC:
    lw          $v0, 0x1A8($s0)
    lw          $v0, 0xC($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addu        $a1, $s3, $zero
    beqz        $v0, .L80054C08
    addu        $v0, $s1, $zero
    lw          $v1, 0x8C($s0)
    addu        $v1, $v1, $v0
    j .L80054C0C
    sw          $v1, 0x8C($s0)
.L80054C08:
    addu        $v0, $zero, $zero
.L80054C0C:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80054AEC
