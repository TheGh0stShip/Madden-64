.text
.align 2
.set noreorder
.globl func_80035428
.ent func_80035428
func_80035428:
    lui         $v0, 0x8007
    lw          $v0, 0x24EC($v0)
    addiu       $sp, $sp, -0x20
    sw          $s2, 0x18($sp)
    sw          $ra, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8007
    sb          $zero, 0x12F8($at)
    lui         $at, 0x8009
    sw          $zero, -0x6A20($at)
    bnez        $v0, .L80035498
    addu        $s2, $a0, $zero
    addu        $a0, $zero, $zero
    lui         $a1, 0x8009
    addiu       $a1, $a1, -0x4F88
    addiu       $a2, $zero, 0x180
    lui         $at, 0x8007
    sw          $zero, 0x1304($at)
    lui         $at, 0x8007
    sw          $zero, 0x1308($at)
    lui         $at, 0x8008
    sw          $zero, -0x5B00($at)
    jal         func_80033308
    addu        $a3, $zero, $zero
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8007
    sw          $v0, 0x24EC($at)
.L80035498:
    addu        $s0, $zero, $zero
    addiu       $s1, $zero, -0x1
    andi        $a0, $s0, 0xFFFF
.L800354A4:
    sll         $v0, $a0, 1
    addu        $v0, $v0, $a0
    sll         $v1, $v0, 3
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x4F88($at)
    bne         $v0, $s1, .L800354CC
    nop
    j .L800354E4
    ori         $a0, $s0, 0x4000
.L800354CC:
    lui         $at, 0x8009
    addu        $at, $at, $v1
    lw          $v0, -0x4F84($at)
    bne         $v0, $s1, .L800354E8
    nop
    ori         $a0, $s0, 0x8000
.L800354E4:
    andi        $a0, $a0, 0xFFFF
.L800354E8:
    jal         func_80035A7C
    addiu       $s0, $s0, 0x1
    andi        $v0, $s0, 0xFFFF
    sltiu       $v0, $v0, 0x10
    bnez        $v0, .L800354A4
    andi        $a0, $s0, 0xFFFF
    lui         $a0, 0x8007
    lw          $a0, 0x24E0($a0)
    beql        $a0, $zero, .L80035524
    addu        $a0, $zero, $zero
    jal         func_80033258
    nop
    lui         $at, 0x8007
    sw          $zero, 0x24E0($at)
    addu        $a0, $zero, $zero
.L80035524:
    andi        $a1, $s2, 0xFFFF
    jal         func_80033174
    addiu       $a2, $zero, 0x18
    lui         $at, 0x8007
    sw          $v0, 0x24E0($at)
    lui         $at, 0x8007
    sw          $zero, 0x34E8($at)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_80035428
