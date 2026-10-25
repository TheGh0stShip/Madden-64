.text
.align 2
.set noreorder
.globl func_800AB650
.ent func_800AB650
func_800AB650:
    lui         $v1, 0x8007
    lhu         $v1, -0x4858($v1)
    addiu       $sp, $sp, -0x18
    sltiu       $v0, $v1, 0x5
    beqz        $v0, .L800AB6D8
    sw          $ra, 0x10($sp)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xE48($at)
    jr          $v0
    nop
    jal         func_800A7AB0
    nop
    j           func_800A6FB4
    nop
    lui         $a1, 0x8008
    lhu         $a1, 0x5280($a1)
    jal         func_800A6FDC
    addu        $a0, $zero, $zero
    lui         $a1, 0x8008
    lhu         $a1, 0x57B2($a1)
    jal         func_800A6FDC
    addiu       $a0, $zero, 0x1
    jal         func_800A8F88
    nop
    j           func_800A6FB4
    nop
    jal         func_800A8020
    nop
    j           func_800A6FB4
    nop
    jal         func_800A80E4
    nop
.L800AB6D8:
    jal         func_800A82E8
    nop
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800AB650
