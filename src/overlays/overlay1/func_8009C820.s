.text
.align 2
.set noreorder
.globl func_8009C820
.ent func_8009C820
func_8009C820:
    addiu       $sp, $sp, -0x20
    sw          $s1, 0x14($sp)
    addu        $s1, $a1, $zero
    sw          $ra, 0x18($sp)
    sw          $s0, 0x10($sp)
    lw          $s0, 0x8($a0)
    addu        $a0, $zero, $zero
    jal         func_80032E00
    addiu       $a1, $zero, 0x20
    addu        $a1, $s1, $zero
    sw          $v0, 0x8($s0)
    lw          $v0, 0xC($s0)
    lw          $a0, 0x8($s0)
    addiu       $a2, $zero, 0x20
    ori         $v0, $v0, 0x1
    jal         func_8002E17C
    sw          $v0, 0xC($s0)
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_8009C820
