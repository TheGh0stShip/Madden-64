.text
.align 2
.set noreorder
.globl image_plane_transform
.ent image_plane_transform
image_plane_transform:
    addiu       $sp, $sp, -0x38
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x34($sp)
    sw          $s6, 0x30($sp)
    sw          $s5, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    lw          $v0, 0x4($s0)
    lw          $v0, 0x0($v0)
    addiu       $a1, $zero, 0x1
    jalr        $v0
    addiu       $a2, $zero, 0xA0
    addu        $s5, $v0, $zero
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x1178
    sw          $s5, 0x1C0($s0)
    sw          $v0, 0x0($s5)
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0x1160
    sw          $v0, 0x4($s5)
    sw          $zero, 0x8($s5)
    lw          $v0, 0x12C($s0)
    beqz        $v0, .L8005F5A0
    addiu       $v0, $zero, 0x17
    lw          $v1, 0x0($s0)
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L8005F5A0:
    lw          $v0, 0x4C($s0)
    beqz        $v0, .L8005F5B8
    addu        $s6, $zero, $zero
    lw          $v0, 0x138($s0)
    slti        $v0, $v0, 0x2
    xori        $s6, $v0, 0x1
.L8005F5B8:
    lw          $v0, 0x20($s0)
    lw          $v1, 0xD8($s0)
    blez        $v0, .L8005F838
    addu        $s4, $zero, $zero
    addiu       $s2, $v1, 0x28
    addu        $s1, $s5, $zero
.L8005F5D0:
    lw          $a0, -0x4($s2)
    lw          $v0, -0x1C($s2)
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00001012  # mflo        $v0
    lw          $v1, 0x138($s0)
    nop
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L8005F5F8
    nop
    break       7
.L8005F5F8:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L8005F610
    lui         $at, 0x8000
    bne         $v0, $at, .L8005F610
    nop
    break       6
.L8005F610:
    .word       0x00003812  # mflo        $a3
    lw          $v0, -0x20($s2)
    nop
    .word       0x00440018  # mult        $v0, $a0
    .word       0x00001012  # mflo        $v0
    lw          $a2, 0x130($s0)
    lw          $t0, 0x134($s0)
    sw          $a3, 0x64($s1)
    lw          $a0, 0x8($s2)
    .word       0x0043001A  # div         $zero, $v0, $v1
    bnez        $v1, .L8005F644
    nop
    break       7
.L8005F644:
    addiu       $at, $zero, -0x1
    bne         $v1, $at, .L8005F65C
    lui         $at, 0x8000
    bne         $v0, $at, .L8005F65C
    nop
    break       6
.L8005F65C:
    .word       0x00002812  # mflo        $a1
    bnez        $a0, .L8005F678
    addiu       $s3, $zero, 0x1
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0xFC8
    j .L8005F6A0
    sw          $v0, 0x34($s1)
.L8005F678:
    xor         $v1, $a1, $a2
    sltiu       $v1, $v1, 0x1
    xor         $v0, $a3, $t0
    sltiu       $a0, $v0, 0x1
    and         $v1, $v1, $a0
    beqz        $v1, .L8005F6A8
    sll         $v1, $a1, 1
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0xFD0
    sw          $v0, 0x34($s1)
.L8005F6A0:
    j .L8005F7E8
    addu        $s3, $zero, $zero
.L8005F6A8:
    xor         $v0, $v1, $a2
    sltiu       $v0, $v0, 0x1
    and         $v0, $v0, $a0
    beqz        $v0, .L8005F6F4
    nop
    beqz        $s6, .L8005F6E4
    nop
    lw          $v0, 0x0($s2)
    sltiu       $v0, $v0, 0x3
    bnez        $v0, .L8005F6E4
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0xD54
    j .L8005F7E8
    sw          $v0, 0x34($s1)
.L8005F6E4:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0xEA4
    j .L8005F7E8
    sw          $v0, 0x34($s1)
.L8005F6F4:
    bne         $v1, $a2, .L8005F740
    sll         $v0, $a3, 1
    bne         $v0, $t0, .L8005F740
    nop
    beqz        $s6, .L8005F730
    nop
    lw          $v0, 0x0($s2)
    sltiu       $v0, $v0, 0x3
    bnez        $v0, .L8005F730
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0xC68
    sw          $v0, 0x34($s1)
    j .L8005F7E8
    sw          $s3, 0x8($s5)
.L8005F730:
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0xE30
    j .L8005F7E8
    sw          $v0, 0x34($s1)
.L8005F740:
    .word       0x00C5001A  # div         $zero, $a2, $a1
    bnez        $a1, .L8005F750
    nop
    break       7
.L8005F750:
    addiu       $at, $zero, -0x1
    bne         $a1, $at, .L8005F768
    lui         $at, 0x8000
    bne         $a2, $at, .L8005F768
    nop
    break       6
.L8005F768:
    .word       0x00002012  # mflo        $a0
    .word       0x00001010  # mfhi        $v0
    bnez        $v0, .L8005F7CC
    nop
    .word       0x0107001A  # div         $zero, $t0, $a3
    bnez        $a3, .L8005F788
    nop
    break       7
.L8005F788:
    addiu       $at, $zero, -0x1
    bne         $a3, $at, .L8005F7A0
    lui         $at, 0x8000
    bne         $t0, $at, .L8005F7A0
    nop
    break       6
.L8005F7A0:
    .word       0x00001812  # mflo        $v1
    .word       0x00001010  # mfhi        $v0
    bnez        $v0, .L8005F7CC
    nop
    lui         $v0, 0x8006
    addiu       $v0, $v0, -0xFC0
    sw          $v0, 0x34($s1)
    addu        $v0, $s5, $s4
    sb          $a0, 0x8C($v0)
    j .L8005F7E8
    sb          $v1, 0x96($v0)
.L8005F7CC:
    lw          $v1, 0x0($s0)
    addiu       $v0, $zero, 0x25
    sw          $v0, 0x14($v1)
    lw          $v0, 0x0($s0)
    lw          $v0, 0x0($v0)
    jalr        $v0
    addu        $a0, $s0, $zero
.L8005F7E8:
    beql        $s3, $zero, .L8005F824
    addiu       $s1, $s1, 0x4
    lw          $a0, 0x70($s0)
    lw          $a1, 0x130($s0)
    jal         func_80063214
    nop
    lw          $v1, 0x4($s0)
    addu        $a0, $s0, $zero
    lw          $a3, 0x134($s0)
    lw          $v1, 0x8($v1)
    addiu       $a1, $zero, 0x1
    jalr        $v1
    addu        $a2, $v0, $zero
    sw          $v0, 0xC($s1)
    addiu       $s1, $s1, 0x4
.L8005F824:
    lw          $v0, 0x20($s0)
    addiu       $s4, $s4, 0x1
    slt         $v0, $s4, $v0
    bnez        $v0, .L8005F5D0
    addiu       $s2, $s2, 0x54
.L8005F838:
    lw          $ra, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end image_plane_transform
