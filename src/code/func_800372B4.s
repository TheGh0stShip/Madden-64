.text
.align 2
.set noreorder
.globl func_800372B4
.ent func_800372B4
func_800372B4:
    lui         $v0, 0x8007
    lw          $v0, 0x3440($v0)
    addiu       $sp, $sp, -0x98
    sw          $s2, 0x88($sp)
    addu        $s2, $a0, $zero
    sw          $s3, 0x8C($sp)
    addu        $s3, $a1, $zero
    sw          $ra, 0x94($sp)
    sw          $s4, 0x90($sp)
    sw          $s1, 0x84($sp)
    beqz        $v0, .L80037388
    sw          $s0, 0x80($sp)
    lui         $v0, 0x8007
    lw          $v0, 0x3438($v0)
    beqz        $v0, .L80037388
    nop
    jal         func_80037258
    nop
    andi        $a0, $s2, 0xFFFF
    jal         func_80024B90
    addu        $s4, $v0, $zero
    andi        $s0, $v0, 0xFF
    addiu       $v0, $zero, 0xFF
    beq         $s0, $v0, .L80037380
    nop
    andi        $s0, $s0, 0xFFFF
    jal         func_80028A58
    addu        $a0, $s0, $zero
    addu        $a0, $s0, $zero
    andi        $s0, $v0, 0xFFFF
    jal         func_8003A8CC
    addiu       $a1, $sp, 0x10
    addu        $s1, $zero, $zero
    sll         $v0, $s0, 3
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 3
    subu        $s0, $v0, $s0
    addiu       $v1, $sp, 0x10
.L8003734C:
    lhu         $v0, 0x0($v1)
    bnel        $v0, $s2, .L80037374
    addiu       $s1, $s1, 0x1
    jal         func_8003A368
    nop
    addu        $v0, $v0, $s0
    addu        $v0, $v0, $s1
    lbu         $v0, 0x0($v0)
    j .L80037380
    sb          $v0, 0x0($s3)
.L80037374:
    sltiu       $v0, $s1, 0x37
    bnez        $v0, .L8003734C
    addiu       $v1, $v1, 0x2
.L80037380:
    jal         func_80037290
    addu        $a0, $s4, $zero
.L80037388:
    lw          $ra, 0x94($sp)
    lw          $s4, 0x90($sp)
    lw          $s3, 0x8C($sp)
    lw          $s2, 0x88($sp)
    lw          $s1, 0x84($sp)
    lw          $s0, 0x80($sp)
    addiu       $sp, $sp, 0x98
    jr          $ra
    nop
.end func_800372B4
