.text
.align 2
.set noreorder
.globl func_800B2498
.ent func_800B2498
func_800B2498:
    lui         $a0, 0x8008
    lhu         $a0, 0x57C8($a0)
    lui         $a1, 0x8008
    lhu         $a1, 0x57C4($a1)
    lui         $a2, 0x8008
    lhu         $a2, 0x57C6($a2)
    jal         func_800AD78C
    nop
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800B2498
