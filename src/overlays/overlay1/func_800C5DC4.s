.text
.align 2
.set noreorder
.globl func_800C5DC4
.ent func_800C5DC4
func_800C5DC4:
    addiu       $sp, $sp, -0x28
    sw          $s1, 0x1C($sp)
    addu        $s1, $a0, $zero
    sw          $ra, 0x20($sp)
    sw          $s0, 0x18($sp)
    lw          $a0, 0x24($s1)
    lhu         $v1, 0x54($a0)
    addiu       $v0, $zero, 0x6
    beq         $v1, $v0, .L800C5DF8
    addu        $s0, $a1, $zero
    addiu       $v0, $zero, 0x7
    bne         $v1, $v0, .L800C5E08
    addiu       $v0, $zero, 0x8
.L800C5DF8:
    lw          $v1, 0x8($a0)
    andi        $v0, $s0, 0xFFF
    j           func_800C172C
    sh          $v0, 0x12($v1)
.L800C5E08:
    bne         $v1, $v0, .L800C5E50
    nop
    jal         func_8000EC6C
    addiu       $a1, $sp, 0x10
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    addiu       $v0, $s0, -0x400
    andi        $v0, $v0, 0xFFF
    jal         func_8000C8EC
    sh          $v0, 0x14($sp)
    beqz        $v0, .L800C5E44
    nop
    lhu         $v0, 0x14($sp)
    xori        $v0, $v0, 0x800
    sh          $v0, 0x14($sp)
.L800C5E44:
    lw          $a0, 0x24($s1)
    jal         func_8000EC8C
    addiu       $a1, $sp, 0x10
.L800C5E50:
    lw          $ra, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800C5DC4
