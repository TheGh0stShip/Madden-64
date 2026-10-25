.text
.align 2
.set noreorder
.globl ui_layout_render
.ent ui_layout_render
ui_layout_render:
    addiu       $sp, $sp, -0x38
    sw          $s6, 0x28($sp)
    addu        $s6, $a1, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $zero, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $zero, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $zero, $zero
    sw          $s4, 0x20($sp)
    addu        $s4, $zero, $zero
    sw          $fp, 0x30($sp)
    addu        $fp, $zero, $zero
    addiu       $v0, $a0, 0x4
    sw          $ra, 0x34($sp)
    sw          $s7, 0x2C($sp)
    sw          $s5, 0x24($sp)
    sw          $s0, 0x10($sp)
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    lbu         $v0, 0x4($a0)
    addu        $s7, $zero, $zero
    j .L8001C9E8
    addu        $s5, $zero, $zero
.L8001C718:
    lui         $a0, 0x8008
    lw          $a0, -0x6B88($a0)
    lbu         $v1, 0x0($a0)
    andi        $v0, $v1, 0x80
    beqz        $v0, .L8001C7E4
    addiu       $s7, $s7, 0x1
    addu        $s0, $v1, $zero
    andi        $v0, $s0, 0x10
    beqz        $v0, .L8001C748
    addiu       $fp, $fp, 0x1
    j .L8001C74C
    addiu       $v0, $a0, 0x2
.L8001C748:
    addiu       $v0, $a0, 0x1
.L8001C74C:
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    jal         func_8001C670
    nop
    lui         $at, 0x8008
    sh          $v0, -0x6AEC($at)
    jal         func_8001CA44
    nop
    andi        $v1, $s0, 0xC
    lui         $at, 0x8008
    sh          $v0, -0x6AE8($at)
    addiu       $v0, $zero, 0x4
    beq         $v1, $v0, .L8001C7D4
    nop
    slti        $v0, $v1, 0x5
    beql        $v0, $zero, .L8001C7A0
    addiu       $v0, $zero, 0x8
    beqz        $v1, .L8001C7B0
    nop
    j .L8001C9DC
    nop
.L8001C7A0:
    beq         $v1, $v0, .L8001C7D4
    nop
    j .L8001C9DC
    nop
.L8001C7B0:
    lui         $v1, 0x8008
    lw          $v1, -0x6B88($v1)
    lbu         $v0, 0x0($v1)
    addiu       $v0, $v0, 0x1
    addu        $v1, $v1, $v0
    lui         $at, 0x8008
    sw          $v1, -0x6B88($at)
    j .L8001C9DC
    nop
.L8001C7D4:
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    j .L8001C9D4
    addiu       $v0, $v0, 0x1
.L8001C7E4:
    addiu       $v0, $a0, 0x1
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
    lbu         $a0, 0x0($a0)
    andi        $v1, $a0, 0x1F
    sltiu       $v0, $v1, 0x1F
    beqz        $v0, .L8001C9DC
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xAD0($at)
    jr          $v0
    nop
    jal         func_8001C444
    addiu       $s3, $s3, 0x1
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    j .L8001C9D4
    addiu       $v0, $v0, 0x10
    jal         func_8001C444
    addiu       $s3, $s3, 0x1
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    j .L8001C9D4
    addiu       $v0, $v0, 0x8
    andi        $s0, $a0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    jal         func_8001C4E4
    addu        $a0, $s0, $zero
    jal         func_8001C534
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s1, $s1, 0x1
    j .L8001C9D4
    addiu       $v0, $v0, 0x10
    andi        $s0, $a0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s1, $s1, 0x1
    j .L8001C9D4
    addiu       $v0, $v0, 0x10
    andi        $s0, $a0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s2, $s2, 0x1
    j .L8001C9D4
    addiu       $v0, $v0, 0x10
    andi        $s0, $a0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s2, $s2, 0x1
    j .L8001C9D4
    addiu       $v0, $v0, 0x8
    andi        $s0, $a0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s1, $s1, 0x1
    j .L8001C9D4
    addiu       $v0, $v0, 0x8
    andi        $s0, $a0, 0xFF
    jal         func_8001C444
    addu        $a0, $s0, $zero
    jal         func_8001C494
    addu        $a0, $s0, $zero
    jal         func_8001C4E4
    addu        $a0, $s0, $zero
    jal         func_8001C534
    addu        $a0, $s0, $zero
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s1, $s1, 0x1
    j .L8001C9D4
    addiu       $v0, $v0, 0x8
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s4, $s4, 0x1
    j .L8001C9D4
    addiu       $v0, $v0, 0x5
    andi        $v0, $s5, 0xFFFF
    sll         $s0, $v0, 5
    subu        $s0, $s0, $v0
    sll         $s0, $s0, 3
    addu        $s0, $s0, $v0
    sll         $s0, $s0, 3
    lui         $t0, 0x8008
    addiu       $t0, $t0, -0x7B04
    addu        $a0, $s0, $t0
    addiu       $v0, $zero, -0x1
    lui         $a1, 0x8009
    lw          $a1, -0x79D0($a1)
    lui         $a2, 0x6
    lui         $at, 0x8007
    sh          $v0, -0x6D4C($at)
    jal         func_800344E8
    addu        $a3, $zero, $zero
    lui         $t0, 0x8008
    addiu       $t0, $t0, -0x7AAC
    jal         func_80044C48
    addu        $a0, $s0, $t0
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    addiu       $s4, $s4, 0x1
    addiu       $s5, $s5, 0x1
    addiu       $v0, $v0, 0x9
.L8001C9D4:
    lui         $at, 0x8008
    sw          $v0, -0x6B88($at)
.L8001C9DC:
    lui         $v0, 0x8008
    lw          $v0, -0x6B88($v0)
    lbu         $v0, 0x0($v0)
.L8001C9E8:
    nor         $v0, $zero, $v0
    andi        $v0, $v0, 0xFF
    bnez        $v0, .L8001C718
    nop
    sh          $s2, 0x0($s6)
    sh          $s1, 0x2($s6)
    sh          $s3, 0x4($s6)
    sh          $s4, 0x6($s6)
    sh          $fp, 0x8($s6)
    sh          $s7, 0xA($s6)
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
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
.end ui_layout_render
