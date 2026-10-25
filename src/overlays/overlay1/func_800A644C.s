.text
.align 2
.set noreorder
.globl func_800A644C
.ent func_800A644C
func_800A644C:
    addiu       $sp, $sp, -0x38
    sw          $s1, 0x2C($sp)
    addu        $s1, $a0, $zero
    addiu       $a1, $zero, 0xD0
    addiu       $a2, $zero, 0xEF
    addiu       $a3, $zero, 0x1
    sw          $ra, 0x34($sp)
    sw          $s2, 0x30($sp)
    jal         func_8000F3BC
    sw          $s0, 0x28($sp)
    lui         $v1, 0x8008
    lw          $v1, 0x7FA4($v1)
    lw          $s2, 0x10($s1)
    sltiu       $v0, $v1, 0x9
    beqz        $v0, . + 4 + (0x15F << 2)
    sll         $v0, $v1, 2
    lui         $at, 0x8000
    addu        $at, $at, $v0
    lw          $v0, 0xCB8($at)
    jr          $v0
    nop
.end func_800A644C
