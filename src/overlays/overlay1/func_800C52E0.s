.text
.align 2
.set noreorder
.globl func_800C52E0
.ent func_800C52E0
func_800C52E0:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x18($sp)
    sw          $s1, 0x14($sp)
    lw          $a0, 0x24($s0)
    lw          $v1, 0x14($a0)
    lui         $v0, 0x1
    and         $v0, $v1, $v0
    bnez        $v0, .L800C5394
    addu        $s1, $a1, $zero
    lui         $v0, 0xFFC3
    ori         $v0, $v0, 0xFFFF
    and         $v0, $v1, $v0
    sw          $v0, 0x14($a0)
    andi        $v0, $s1, 0xFF00
    sltiu       $v0, $v0, 0x201
    bnel        $v0, $zero, .L800C537C
    addu        $a1, $s1, $zero
    lw          $a0, 0x24($s0)
    jal         func_80035064
    addu        $a2, $zero, $zero
    addu        $a0, $v0, $zero
    andi        $v1, $a0, 0xFFFF
    addiu       $v0, $zero, 0x2
    beq         $v1, $v0, .L800C5374
    slti        $v0, $v1, 0x3
    bnez        $v0, .L800C5364
    addiu       $v0, $zero, 0x3
    beql        $v1, $v0, .L800C538C
    addiu       $a0, $zero, 0x3
    j           func_800C0C74
    andi        $v0, $a0, 0xFFFF
.L800C5364:
    bgezl       $v1, .L800C538C
    addiu       $a0, $zero, 0x2
    j           func_800C0C74
    andi        $v0, $a0, 0xFFFF
.L800C5374:
    j           func_800C0C64
    sw          $s1, 0x2C($s0)
.L800C537C:
    lw          $a0, 0x24($s0)
    jal         func_80034388
    sw          $a1, 0x2C($s0)
    addu        $a0, $zero, $zero
.L800C538C:
    j           func_800C0C74
    andi        $v0, $a0, 0xFFFF
.L800C5394:
    addiu       $v0, $zero, 0x1
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C52E0
