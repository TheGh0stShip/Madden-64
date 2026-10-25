.text
.align 2
.set noreorder
.globl func_800A61E4
.ent func_800A61E4
func_800A61E4:
    addiu       $s0, $s0, 0x7138
    addu        $s1, $zero, $zero
.L800A61EC:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $v0, 0x719C($at)
    bnel        $v0, $s5, .L800A622C
    addiu       $s0, $s0, 0xB0
    addu        $a0, $s0, $zero
    jal         func_800C0BBC
    addu        $a1, $s3, $zero
    andi        $v0, $v0, 0xFFFF
    bnel        $v0, $zero, .L800A622C
    addiu       $s0, $s0, 0xB0
    sb          $s4, 0x10($sp)
    addu        $a0, $s0, $zero
    jal         func_800E1BCC
    addiu       $a1, $sp, 0x10
    addiu       $s0, $s0, 0xB0
.L800A622C:
    addiu       $s2, $s2, 0x1
    sltiu       $v0, $s2, 0x4
    bnez        $v0, .L800A61EC
    addiu       $s1, $s1, 0xB0
    lw          $ra, 0x30($sp)
    lw          $s5, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800A61E4
