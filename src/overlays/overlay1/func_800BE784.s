.text
.align 2
.set noreorder
.globl func_800BE784
.ent func_800BE784
func_800BE784:
    sll         $v0, $s5, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x10
    bnez        $v0, .L800BE7B8
    addiu       $v0, $zero, 0x1
    lw          $a0, 0x10($s3)
    lui         $v0, 0x8009
    lw          $v0, -0x5FA8($v0)
    beq         $a0, $v0, .L800BE7B8
    addiu       $v0, $zero, 0x1
    jal         func_800C1178
    nop
    addiu       $v0, $zero, 0x1
.L800BE7B8:
    lw          $ra, 0x3C($sp)
    lw          $fp, 0x38($sp)
    lw          $s7, 0x34($sp)
    lw          $s6, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x40
    jr          $ra
    nop
.end func_800BE784
