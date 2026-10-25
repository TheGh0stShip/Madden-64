.text
.align 2
.set noreorder
.globl func_800AF614
.ent func_800AF614
func_800AF614:
    addiu       $sp, $sp, -0x20
    lui         $v0, 0x8888
    ori         $v0, $v0, 0x8889
    sll         $a0, $a0, 16
    sw          $s2, 0x18($sp)
    sra         $s2, $a0, 16
    .word       0x02420018  # mult        $s2, $v0
    sw          $s0, 0x10($sp)
    addu        $s0, $a1, $zero
    sra         $a0, $a0, 31
    sw          $ra, 0x1C($sp)
    sw          $s1, 0x14($sp)
    .word       0x00001810  # mfhi        $v1
    addu        $v0, $v1, $s2
    sra         $v0, $v0, 5
    subu        $s1, $v0, $a0
    sll         $v0, $s1, 16
    sra         $a0, $v0, 16
    beqz        $a0, .L800AF66C
    sb          $zero, 0x0($s0)
    jal         func_800167FC
    nop
.L800AF66C:
    jal         func_8004DF94
    addu        $a0, $s0, $zero
    addu        $s0, $s0, $v0
    addiu       $v0, $zero, 0x3A
    sb          $v0, 0x0($s0)
    sll         $v0, $s1, 4
    subu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    subu        $v0, $s2, $v0
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    slti        $v0, $a0, 0xA
    beqz        $v0, .L800AF6B0
    addiu       $s0, $s0, 0x1
    addiu       $v0, $zero, 0x30
    sb          $v0, 0x0($s0)
    addiu       $s0, $s0, 0x1
.L800AF6B0:
    jal         func_800167FC
    addu        $a1, $s0, $zero
    lw          $ra, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x20
    jr          $ra
    nop
.end func_800AF614
