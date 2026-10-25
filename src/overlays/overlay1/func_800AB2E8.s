.text
.align 2
.set noreorder
.globl func_800AB2E8
.ent func_800AB2E8
func_800AB2E8:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    andi        $a2, $s1, 0xFFFF
    negu        $v1, $a2
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    slt         $v0, $v0, $a0
    beqz        $v0, .L800AB338
    nop
    lui         $v0, 0x8008
    lw          $v0, 0xC10($v0)
    andi        $v0, $v0, 0x10
    beqz        $v0, .L800AB328
    sw          $zero, 0xA0($s0)
    jal         func_800BC98C
    nop
.L800AB328:
    jal         func_800A365C
    addu        $a0, $zero, $zero
    j           func_800A6C2C
    nop
.L800AB338:
    lui         $v0, 0x8009
    lhu         $v0, -0x5A4C($v0)
    .word       0x00460018  # mult        $v0, $a2
    .word       0x00001012  # mflo        $v0
    addu        $v0, $a0, $v0
    sw          $v0, 0xA0($s0)
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AB2E8
