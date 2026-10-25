.text
.align 2
.set noreorder
.globl func_800AD54C
.ent func_800AD54C
func_800AD54C:
    lw          $a0, -0x5F04($a0)
    lw          $v1, 0x20($a0)
    addiu       $v0, $zero, -0x8C
    bne         $v1, $v0, .L800AD594
    addiu       $a1, $zero, 0x50
    jal         func_8001AFA4
    andi        $s0, $s1, 0xFFFF
    sll         $s0, $s0, 2
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $a0, -0x5EF8($at)
    jal         func_80016FF4
    nop
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $a0, -0x5EF0($at)
    jal         func_80016FF4
    nop
.L800AD594:
    lw          $ra, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AD54C
