.text
.align 2
.set noreorder
.globl func_800C6330
.ent func_800C6330
func_800C6330:
    lw          $v0, 0x0($a0)
    addiu       $a1, $a1, 0x1
    sh          $zero, 0x2A($v0)
    slti        $v0, $a1, 0xB
    bnez        $v0, . + 4 + (-0x9 << 2)
    addiu       $a0, $a0, 0x4
    addiu       $a3, $a3, 0x1
    slti        $v0, $a3, 0x2
    bnez        $v0, . + 4 + (-0xF << 2)
    addiu       $a2, $a2, 0x58
    lui         $v1, 0x8888
    lui         $v0, 0x8008
    lh          $v0, 0x7758($v0)
    ori         $v1, $v1, 0x8889
    addiu       $a0, $zero, 0x28
    subu        $a0, $a0, $v0
    .word       0x00830018  # mult        $a0, $v1
    .word       0x00004010  # mfhi        $t0
    addu        $v0, $t0, $a0
    sra         $v0, $v0, 3
    sra         $a0, $a0, 31
    jal         func_800C1E4C
    subu        $a0, $v0, $a0
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    sb          $v0, 0x5D40($at)
    lw          $ra, 0x10($sp)
    addiu       $sp, $sp, 0x18
    jr          $ra
    nop
.end func_800C6330
