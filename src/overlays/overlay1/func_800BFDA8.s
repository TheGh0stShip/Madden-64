.text
.align 2
.set noreorder
.globl func_800BFDA8
.ent func_800BFDA8
func_800BFDA8:
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    addiu       $sp, $sp, -0x18
    andi        $v0, $v0, 0x800
    beqz        $v0, .L800BFDF0
    sw          $ra, 0x10($sp)
    lhu         $v0, 0x28($a0)
    andi        $v0, $v0, 0x8
    beqz        $v0, .L800BFDE0
    nop
    jal         func_800BB170
    nop
    j           func_800BB6DC
    andi        $v0, $v0, 0xFFFF
.L800BFDE0:
    jal         func_800BB438
    nop
    j           func_800BB6DC
    andi        $v0, $v0, 0xFFFF
.L800BFDF0:
    lhu         $v1, 0x28($a0)
    addu        $v0, $zero, $zero
    andi        $v1, $v1, 0xFFFE
    sh          $v1, 0x28($a0)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800BFDA8
