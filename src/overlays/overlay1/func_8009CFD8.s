.text
.align 2
.set noreorder
.globl func_8009CFD8
.ent func_8009CFD8
func_8009CFD8:
    lhu         $v1, 0x14($s4)
    addiu       $v0, $s1, -0x2
    .word       0x00430018  # mult        $v0, $v1
    .word       0x00001012  # mflo        $v0
    addiu       $s1, $s1, 0x1
    sra         $s3, $v0, 1
    addiu       $s6, $s6, 0x20
    addiu       $s5, $s5, 0x2
    sll         $a1, $s0, 1
    addiu       $v1, $s0, 0x1
    addiu       $a0, $s0, 0x3
    addiu       $v0, $s0, 0x2
    addu        $s0, $v0, $zero
    lui         $a2, 0x8008
    lw          $a2, 0x4F5C($a2)
    addu        $a3, $s2, $zero
    addiu       $s2, $s2, -0x1
    andi        $a1, $a1, 0xFF
    sll         $a1, $a1, 16
    sll         $v1, $v1, 9
    andi        $v1, $v1, 0xFE00
    or          $v1, $a1, $v1
    sll         $a0, $a0, 1
    andi        $a0, $a0, 0xFF
    or          $v1, $v1, $a0
    sll         $a0, $a0, 8
    or          $a1, $a1, $a0
    addiu       $v0, $a2, 0x8
    lui         $at, 0x8008
    sw          $v0, 0x4F5C($at)
    lui         $v0, 0xB100
    or          $v1, $v1, $v0
    sll         $v0, $s0, 1
    andi        $v0, $v0, 0xFF
    or          $a1, $a1, $v0
    sw          $v1, 0x0($a2)
    bnez        $a3, . + 4 + (-0x73 << 2)
    sw          $a1, 0x4($a2)
    lw          $ra, 0x74($sp)
    lw          $fp, 0x70($sp)
    lw          $s7, 0x6C($sp)
    lw          $s6, 0x68($sp)
    lw          $s5, 0x64($sp)
    lw          $s4, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
    nop
.end func_8009CFD8
