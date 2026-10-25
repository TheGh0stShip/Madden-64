.text
.align 2
.set noreorder
.globl func_800C38EC
.ent func_800C38EC
func_800C38EC:
    addiu       $sp, $sp, -0x20
    sw          $s0, 0x10($sp)
    addu        $s0, $zero, $zero
    sw          $s2, 0x18($sp)
    lui         $s2, 0x8008
    addiu       $s2, $s2, 0x5D48
    sw          $s1, 0x14($sp)
    ori         $s1, $zero, 0xFFFF
    sw          $ra, 0x1C($sp)
    sll         $v0, $s0, 16
.L800C3914:
    sra         $v0, $v0, 14
    addu        $v0, $v0, $s2
    lw          $v1, 0x0($v0)
    sh          $s1, 0x3C($v1)
    lw          $a0, 0x0($v0)
    addu        $a1, $zero, $zero
    jal         func_80097D28
    addu        $a2, $zero, $zero
    addiu       $v0, $s0, 0x1
    addu        $s0, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0xE
    bnez        $v0, .L800C3914
    sll         $v0, $s0, 16
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C38EC
