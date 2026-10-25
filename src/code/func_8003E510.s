.text
.align 2
.set noreorder
.globl func_8003E510
.ent func_8003E510
func_8003E510:
    addiu       $sp, $sp, -0x38
    sw          $s4, 0x20($sp)
    addu        $s4, $a2, $zero
    sw          $s0, 0x10($sp)
    lui         $s0, 0x8008
    addiu       $s0, $s0, 0xC90
    andi        $v0, $s4, 0xFFFF
    sw          $ra, 0x30($sp)
    sw          $s7, 0x2C($sp)
    sw          $s6, 0x28($sp)
    sw          $s5, 0x24($sp)
    sw          $s3, 0x1C($sp)
    sw          $s2, 0x18($sp)
    sw          $s1, 0x14($sp)
    sb          $a0, 0x0($s0)
    lui         $at, 0x8008
    sb          $a1, 0x2DDC($at)
    beqz        $v0, .L8003E564
    nop
    jal         func_80039674
    nop
.L8003E564:
    jal         func_80024694
    addu        $s2, $zero, $zero
    addu        $s3, $s0, $zero
    addiu       $s7, $s3, 0x6C
    addiu       $s6, $s3, 0xDA
    addiu       $s5, $zero, 0x3
    andi        $v0, $s2, 0xFFFF
.L8003E580:
    sll         $s0, $v0, 5
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $a0, 0xC90($at)
    addu        $a1, $s0, $s3
    jal         func_8003A7DC
    addiu       $s2, $s2, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $a0, 0xC90($at)
    addu        $s1, $s0, $s7
    jal         func_8003A8CC
    addu        $a1, $s1, $zero
    addu        $a0, $s1, $zero
    jal         func_8003AE80
    addu        $a1, $s0, $s6
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $s5, 0x2D96($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $zero, 0x2D94($at)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    sh          $zero, 0x2DB0($at)
    bnez        $v0, .L8003E580
    andi        $v0, $s2, 0xFFFF
    jal         func_80024E9C
    nop
    jal         func_8003E9B0
    nop
    andi        $v0, $s4, 0xFFFF
    beqz        $v0, .L8003E638
    nop
    jal         func_800396E0
    addiu       $a0, $zero, 0x1
.L8003E638:
    lw          $ra, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_8003E510
