.text
.align 2
.set noreorder
.globl func_800C0C8C
.ent func_800C0C8C
func_800C0C8C:
    lui         $s0, 0x8009
    addiu       $s0, $s0, -0x7B70
.L800C0C94:
    lw          $a0, 0x0($s0)
    addiu       $s0, $s0, 0x4
    jal         func_8009562C
    addiu       $s1, $s1, 0x1
    slti        $v0, $s1, 0x5
    bnez        $v0, .L800C0C94
    nop
    lui         $a0, 0x8008
    lw          $a0, 0x794C($a0)
    jal         func_8009562C
    nop
    lw          $ra, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_800C0C8C
