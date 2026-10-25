.text
.align 2
.set noreorder
.globl func_800C5D2C
.ent func_800C5D2C
func_800C5D2C:
    addiu       $sp, $sp, -0x20
    sw          $ra, 0x18($sp)
    lw          $a0, 0x24($a0)
    lhu         $v1, 0x54($a0)
    addiu       $v0, $zero, 0x6
    bnel        $v1, $v0, .L800C5D58
    addiu       $v0, $zero, 0x7
    lw          $v0, 0x8($a0)
    lh          $v0, 0x12($v0)
    j           func_800C1688
    addiu       $v0, $v0, 0x100
.L800C5D58:
    bnel        $v1, $v0, .L800C5D70
    addiu       $v0, $zero, 0x8
    lw          $v0, 0x8($a0)
    lh          $v0, 0x12($v0)
    j           func_800C1688
    addiu       $v0, $v0, 0x100
.L800C5D70:
    bne         $v1, $v0, .L800C5DB4
    addu        $v0, $zero, $zero
    jal         func_8000EC6C
    addiu       $a1, $sp, 0x10
    lui         $a0, 0x8009
    lw          $a0, -0x7F70($a0)
    jal         func_8000C8EC
    nop
    beqz        $v0, .L800C5DA4
    nop
    lh          $v0, 0x14($sp)
    j           func_800C1688
    addiu       $v0, $v0, 0xD00
.L800C5DA4:
    lh          $v0, 0x14($sp)
    addiu       $v0, $v0, 0x500
    sra         $v0, $v0, 9
    andi        $v0, $v0, 0x7
.L800C5DB4:
    lw          $ra, 0x18($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800C5D2C
