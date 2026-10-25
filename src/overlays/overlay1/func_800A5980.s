.text
.align 2
.set noreorder
.globl func_800A5980
.ent func_800A5980
func_800A5980:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    jal         func_800C0BBC
    addiu       $a1, $zero, 0x42
    lw          $a1, 0x24($s0)
    sw          $zero, 0x94($s0)
    lw          $v1, 0x14($a1)
    addu        $v0, $zero, $zero
    addiu       $a0, $zero, -0x201
    and         $v1, $v1, $a0
    sw          $v1, 0x14($a1)
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800A5980
