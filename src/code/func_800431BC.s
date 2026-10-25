.text
.align 2
.set noreorder
.globl func_800431BC
.ent func_800431BC
func_800431BC:
    addiu       $sp, $sp, -0x38
    sw          $s4, 0x20($sp)
    addu        $s4, $a0, $zero
    sw          $s5, 0x24($sp)
    addu        $s5, $a1, $zero
    sw          $s2, 0x18($sp)
    andi        $a2, $a2, 0xFFFF
    sw          $ra, 0x28($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    sw          $s0, 0x10($sp)
    swc1        $f21, 0x30($sp)
    swc1        $f20, 0x34($sp)
    beqz        $a2, .L800432B0
    addu        $s2, $zero, $zero
    lui         $at, 0x8000
    lwc1        $f21, 0x2FFC($at)
    lwc1        $f20, 0x3000($at)
    addu        $s3, $a2, $zero
.L80043208:
    lui         $v0, 0x8009
    lw          $v0, -0x49AC($v0)
    lhu         $v0, 0x4($v0)
    .word       0x44820000  # mtc1        $v0, $f0
    .word       0x46800021  # cvt.d.w     $f0, $f0
    .word       0x46340002  # mul.d       $f0, $f0, $f20
    andi        $s0, $s2, 0xFFFF
    sll         $s0, $s0, 4
    addu        $s1, $s0, $s4
    lw          $a1, 0x8($s1)
    .word       0x4620008D  # trunc.w.d   $f2, $f0
    .word       0x44041000  # mfc1        $a0, $f2
    jal         func_8002E7A0
    addu        $s0, $s0, $s5
    lw          $a3, 0x0($s1)
    .word       0x00470018  # mult        $v0, $a3
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v1, $t6, $t7
    sra         $v1, $v1, 16
    sw          $v1, 0x0($s0)
    lw          $s1, 0x4($s1)
    .word       0x00510018  # mult        $v0, $s1
    .word       0x00007010  # mfhi        $t6
    .word       0x00007812  # mflo        $t7
    sll         $t6, $t6, 16
    srl         $t7, $t7, 16
    or          $v0, $t6, $t7
    sra         $v0, $v0, 16
    sw          $v0, 0x4($s0)
    lw          $v0, 0x0($s0)
    lw          $v1, 0x4($s0)
    addiu       $s2, $s2, 0x1
    addiu       $v0, $v0, 0xA0
    addiu       $v1, $v1, 0x78
    sw          $v0, 0x0($s0)
    andi        $v0, $s2, 0xFFFF
    sltu        $v0, $v0, $s3
    bnez        $v0, .L80043208
    sw          $v1, 0x4($s0)
.L800432B0:
    lw          $ra, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    lwc1        $f21, 0x30($sp)
    lwc1        $f20, 0x34($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800431BC
