.text
.align 2
.set noreorder
.globl func_800AF304
.ent func_800AF304
func_800AF304:
    addu        $a1, $a1, $a2
    jal         func_800167FC
    addu        $a1, $a1, $s3
    addiu       $a0, $zero, 0x10
    jal         func_8001EAA8
    nop
    addiu       $v0, $s1, 0x1
    addu        $s1, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x8
    bnez        $v0, . + 4 + (-0x11F << 2)
    sll         $v0, $s1, 16
    lw          $ra, 0x4C($sp)
    lw          $s6, 0x48($sp)
    lw          $s5, 0x44($sp)
    lw          $s4, 0x40($sp)
    lw          $s3, 0x3C($sp)
    lw          $s2, 0x38($sp)
    lw          $s1, 0x34($sp)
    lw          $s0, 0x30($sp)
    addiu       $sp, $sp, 0x50
    jr          $ra
    nop
.end func_800AF304
