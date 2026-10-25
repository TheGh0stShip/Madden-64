.text
.align 2
.set noreorder
.globl func_800B6974
.ent func_800B6974
func_800B6974:
    addiu       $sp, $sp, -0x18
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $ra, 0x14($sp)
    lw          $a0, 0x0($s0)
    jal         func_80016FF4
    nop
    lw          $a0, 0x4($s0)
    jal         func_80016FF4
    nop
    lw          $a0, 0x8($s0)
    jal         func_80016FF4
    nop
    lw          $a0, 0xC($s0)
    jal         func_80016FF4
    nop
    lw          $ra, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800B6974
