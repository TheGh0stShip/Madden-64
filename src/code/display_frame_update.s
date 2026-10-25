.text
.align 2
.set noreorder
.globl display_frame_update
.ent display_frame_update
display_frame_update:
    addiu       $sp, $sp, -0x68
    lhu         $v0, 0x7A($sp)
    addu        $t0, $a0, $zero
    sw          $s5, 0x5C($sp)
    addu        $s5, $a1, $zero
    sw          $s4, 0x58($sp)
    addu        $s4, $a2, $zero
    sw          $ra, 0x64($sp)
    sw          $s6, 0x60($sp)
    sw          $s3, 0x54($sp)
    sw          $s2, 0x50($sp)
    sw          $s1, 0x4C($sp)
    sw          $s0, 0x48($sp)
    lui         $a2, 0x8000
    addiu       $a2, $a2, 0x300C
    lw          $v1, 0x0($a2)
    lw          $a0, 0x4($a2)
    lw          $a1, 0x8($a2)
    sw          $v1, 0x30($sp)
    sw          $a0, 0x34($sp)
    sw          $a1, 0x38($sp)
    lw          $v1, 0xC($a2)
    sw          $v1, 0x3C($sp)
    lw          $s2, 0x8($t0)
    lh          $s1, 0x12($s2)
    addu        $s3, $a3, $zero
    addiu       $s6, $sp, 0x30
    bnez        $v0, .L80043FF4
    negu        $s1, $s1
    addiu       $s1, $s1, 0x800
.L80043FF4:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    addu        $a0, $s2, $zero
    sw          $v0, 0x10($sp)
    lw          $a3, 0x18($t0)
    addiu       $a1, $sp, 0x40
    jal         func_80043114
    addiu       $a2, $sp, 0x44
    jal         func_8002CAD0
    andi        $s0, $v0, 0xFF
    jal         func_8002CD44
    addiu       $a0, $zero, 0x400
    jal         func_8002CF48
    addu        $a0, $s1, $zero
    jal         func_8002D14C
    addu        $a0, $zero, $zero
    lw          $s2, 0x3C($s2)
    addiu       $v1, $zero, 0x3555
    .word       0x02430018  # mult        $s2, $v1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $a0, $t6, $t7
    addu        $a1, $a0, $zero
    jal         func_8002D8D0
    addu        $a2, $a0, $zero
    sw          $s0, 0x10($sp)
    lw          $a1, 0x40($sp)
    lw          $a2, 0x44($sp)
    addiu       $a0, $sp, 0x18
    jal         func_80042F50
    andi        $a3, $s5, 0xFF
    lw          $v0, 0x40($sp)
    lw          $v0, 0x0($v0)
    sltu        $v0, $s5, $v0
    bnez        $v0, .L800440A8
    addu        $v0, $zero, $zero
    sw          $zero, 0x8($s4)
    sw          $zero, 0x4($s4)
    sw          $zero, 0x0($s4)
    sh          $zero, 0x4($s3)
    sh          $zero, 0x2($s3)
    j .L800440DC
    sh          $zero, 0x0($s3)
.L800440A8:
    jal         func_8002DA14
    addiu       $a0, $sp, 0x18
    addu        $a0, $s6, $zero
    jal         func_8002DBD0
    addu        $a1, $s4, $zero
    lw          $v0, 0x24($sp)
    sh          $v0, 0x0($s3)
    lw          $v0, 0x28($sp)
    sh          $v0, 0x2($s3)
    lw          $v0, 0x2C($sp)
    jal         func_8002CD28
    sh          $v0, 0x4($s3)
    addiu       $v0, $zero, 0x1
.L800440DC:
    lw          $ra, 0x64($sp)
    lw          $s6, 0x60($sp)
    lw          $s5, 0x5C($sp)
    lw          $s4, 0x58($sp)
    lw          $s3, 0x54($sp)
    lw          $s2, 0x50($sp)
    lw          $s1, 0x4C($sp)
    lw          $s0, 0x48($sp)
    addiu       $sp, $sp, 0x68
    jr          $ra
    nop
.end display_frame_update
