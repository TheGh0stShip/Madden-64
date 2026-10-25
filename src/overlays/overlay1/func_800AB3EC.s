.text
.align 2
.set noreorder
.globl func_800AB3EC
.ent func_800AB3EC
func_800AB3EC:
    nop
    andi        $v0, $v0, 0x10
    bnez        $v0, .L800AB428
    addiu       $v0, $zero, 0x2
    j           func_800A6D04
    sw          $v0, 0x98($s0)
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x10
    beqz        $v0, .L800AB420
    nop
    jal         func_800BC98C
    nop
.L800AB420:
    jal         func_800A365C
    addu        $a0, $zero, $zero
.L800AB428:
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AB3EC
