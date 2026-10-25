.text
.align 2
.set noreorder
.globl func_800C5CA0
.ent func_800C5CA0
func_800C5CA0:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    lw          $a0, 0x24($a0)
    lhu         $v1, 0x54($a0)
    addiu       $v0, $zero, 0x6
    beq         $v1, $v0, .L800C5CC8
    nop
    addiu       $v0, $zero, 0x7
    bnel        $v1, $v0, .L800C5CD8
    addiu       $v0, $zero, 0x8
.L800C5CC8:
    lw          $v0, 0x8($a0)
    lhu         $v0, 0x12($v0)
    j           func_800C15F8
    andi        $v0, $v0, 0xFFF
.L800C5CD8:
    bne         $v1, $v0, .L800C5D1C
    addu        $v0, $zero, $zero
    jal         func_8000EC6C
    addiu       $a1, $sp, 0x10
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800C5D10
    nop
    lhu         $v0, 0x14($sp)
    addiu       $v0, $v0, 0xC00
    j           func_800C15F8
    andi        $v0, $v0, 0xFFF
.L800C5D10:
    lhu         $v0, 0x14($sp)
    addiu       $v0, $v0, 0x400
    andi        $v0, $v0, 0xFFF
.L800C5D1C:
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C5CA0
