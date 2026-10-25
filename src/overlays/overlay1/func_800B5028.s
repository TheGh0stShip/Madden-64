.text
.align 2
.set noreorder
.globl func_800B5028
.ent func_800B5028
func_800B5028:
    addiu       $fp, $fp, -0x1584
    sw          $t1, 0x34($sp)
    addiu       $t1, $sp, 0x10
    sw          $t2, 0x3C($sp)
    sw          $t1, 0x4C($sp)
    lw          $t2, 0x4C($sp)
    addu        $s7, $zero, $zero
    addiu       $v0, $zero, 0xFF
    sb          $v0, 0x1B($sp)
    sb          $v0, 0x1A($sp)
    sb          $v0, 0x19($sp)
    sb          $v0, 0x18($sp)
    sw          $t2, 0x54($sp)
    sll         $t1, $s6, 3
    sw          $t1, 0x24($sp)
    lw          $t1, 0x4C($sp)
    addu        $s4, $zero, $zero
    sll         $t2, $s6, 1
    sw          $t2, 0x2C($sp)
    addiu       $t1, $t1, 0x8
    sw          $t1, 0x44($sp)
    lw          $t2, 0x54($sp)
    lhu         $a0, 0x2($t2)
    jal         func_80031A1C
    addu        $s0, $zero, $zero
    andi        $a2, $v0, 0xFFFF
    blez        $a2, .L800B50C8
    nop
    lui         $v0, 0x8007
    lw          $v0, -0x158C($v0)
    addu        $v0, $s7, $v0
    addiu       $v1, $v0, 0x98
    andi        $v0, $s0, 0xFF
    addu        $v0, $v1, $v0
    lbu         $v0, 0x0($v0)
    subu        $a2, $a2, $v0
    blez        $a2, .L800B50C8
    nop
    j           func_800B0984
    addiu       $s0, $s0, 0x1
.L800B50C8:
    lw          $t1, 0x34($sp)
    lw          $t2, 0x2C($sp)
    xori        $v0, $s6, 0x1
    sll         $v0, $v0, 1
    addu        $a2, $t1, $t2
    lbu         $a3, 0x0($a2)
    andi        $v1, $s0, 0xFF
    j           func_800B09FC
    addu        $a1, $t1, $v0
.end func_800B5028
