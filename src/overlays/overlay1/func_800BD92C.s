.text
.align 2
.set noreorder
.globl func_800BD92C
.ent func_800BD92C
func_800BD92C:
    addiu       $sp, $sp, -0x18
    sw          $ra, 0x10($sp)
    lw          $v1, 0x0($a0)
    addiu       $v0, $v1, 0xFE
    sltiu       $v0, $v0, 0x1FD
    beqz        $v0, .L800BD958
    nop
    lw          $v0, 0x4($a0)
    sra         $v0, $v0, 31
    j           func_800B9264
    andi        $v0, $v0, 0x800
.L800BD958:
    lw          $a1, 0x4($a0)
    jal         func_8002E890
    addu        $a0, $v1, $zero
    addiu       $v1, $zero, 0x400
    subu        $v1, $v1, $v0
    bltzl       $v1, .L800BD974
    addiu       $v1, $v1, 0x1000
.L800BD974:
    slti        $v0, $v1, 0x1001
    beql        $v0, $zero, .L800BD980
    addiu       $v1, $v1, -0x1000
.L800BD980:
    sll         $v0, $v1, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BD92C
