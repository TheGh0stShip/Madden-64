.text
.align 2
.set noreorder
.globl func_800BC4BC
.ent func_800BC4BC
func_800BC4BC:
    lui         $v0, 0x8009
    lw          $v0, -0x6D64($v0)
    addiu       $sp, $sp, -0x18
    beqz        $v0, .L800BC4EC
    sw          $ra, 0x10($sp)
    sltiu       $v0, $v0, 0x5
    beqz        $v0, .L800BC4EC
    nop
    jal         func_8003D78C
    addu        $a0, $zero, $zero
    lui         $at, 0x8009
    sw          $zero, -0x6D64($at)
.L800BC4EC:
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BC4BC
