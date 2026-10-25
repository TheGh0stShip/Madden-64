.text
.align 2
.set noreorder
.globl object_animation_apply
.ent object_animation_apply
object_animation_apply:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $s1, 0x1A0($s0)
    lw          $v0, 0x8($s1)
    beqz        $v0, .L80055EEC
    nop
    sw          $zero, 0x8($s1)
    lw          $v0, 0x1C8($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a1, $zero, $zero
    lw          $v0, 0x1AC($s0)
    lw          $v0, 0x0($v0)
    addu        $a0, $s0, $zero
    jalr        $v0
    addiu       $a1, $zero, 0x2
    lw          $v0, 0x1A4($s0)
    lw          $v0, 0x0($v0)
    addu        $a0, $s0, $zero
    j .L80056008
    addiu       $a1, $zero, 0x2
.L80055EEC:
    lw          $v0, 0x54($s0)
    beqz        $v0, .L80055F60
    nop
    lw          $v0, 0x88($s0)
    bnez        $v0, .L80055F60
    nop
    lw          $v0, 0x5C($s0)
    beqz        $v0, .L80055F30
    nop
    lw          $v0, 0x6C($s0)
    beqz        $v0, .L80055F30
    nop
    lw          $v0, 0x18($s1)
    sw          $v0, 0x1C8($s0)
    addiu       $v0, $zero, 0x1
    j .L80055F60
    sw          $v0, 0x8($s1)
.L80055F30:
    lw          $v0, 0x64($s0)
    beqz        $v0, .L80055F48
    addiu       $v0, $zero, 0x2D
    lw          $v0, 0x14($s1)
    j .L80055F60
    sw          $v0, 0x1C8($s0)
.L80055F48:
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80055F60:
    lw          $v0, 0x1BC($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    lw          $v0, 0x1A8($s0)
    lw          $v0, 0x8($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    lw          $v0, 0x44($s0)
    bnez        $v0, .L80056010
    nop
    lw          $v0, 0x10($s1)
    bnez        $v0, .L80055FA8
    nop
    lw          $v0, 0x1C4($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80055FA8:
    lw          $v0, 0x1C0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
    lw          $v0, 0x54($s0)
    beqz        $v0, .L80055FD8
    nop
    lw          $v0, 0x1C8($s0)
    lw          $a1, 0x8($s1)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L80055FD8:
    lw          $a1, 0x8($s1)
    lw          $v0, 0x1AC($s0)
    addu        $a0, $s0, $zero
    sltu        $a1, $zero, $a1
    lw          $v0, 0x0($v0)
    negu        $a1, $a1
    jalr        $v0
    andi        $a1, $a1, 0x3
    lw          $v0, 0x1A4($s0)
    lw          $v0, 0x0($v0)
    addu        $a0, $s0, $zero
    addu        $a1, $zero, $zero
.L80056008:
    jalr        $v0
    nop
.L80056010:
    lw          $v1, 0x8($s0)
    beqz        $v1, .L80056078
    nop
    lw          $v0, 0xC($s1)
    sw          $v0, 0xC($v1)
    lw          $v0, 0x8($s1)
    lw          $a0, 0x8($s0)
    lw          $v1, 0xC($s1)
    bnez        $v0, .L8005603C
    addiu       $v0, $v1, 0x2
    addiu       $v0, $v1, 0x1
.L8005603C:
    sw          $v0, 0x10($a0)
    lw          $v0, 0x40($s0)
    beqz        $v0, .L80056078
    nop
    lw          $v0, 0x1B0($s0)
    lw          $v0, 0x14($v0)
    bnez        $v0, .L80056078
    nop
    lw          $a0, 0x8($s0)
    lw          $v0, 0x6C($s0)
    lw          $v1, 0x10($a0)
    bnez        $v0, .L80056074
    addiu       $v0, $v1, 0x2
    addiu       $v0, $v1, 0x1
.L80056074:
    sw          $v0, 0x10($a0)
.L80056078:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end object_animation_apply
