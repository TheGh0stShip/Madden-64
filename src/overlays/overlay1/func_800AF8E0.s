.text
.align 2
.set noreorder
.globl func_800AF8E0
.ent func_800AF8E0
func_800AF8E0:
    sll         $v1, $v1, 16
    sra         $v1, $v1, 16
    addu        $v1, $s1, $v1
    addiu       $v0, $v0, 0x4
    sb          $a2, 0x0($v1)
    sll         $v1, $v0, 16
    sra         $v1, $v1, 16
    addu        $v1, $s1, $v1
    addu        $s3, $v0, $zero
    jal         func_800B93D0
    sb          $zero, 0x0($v1)
    addu        $s2, $v0, $zero
    sll         $v0, $s2, 16
    sra         $v0, $v0, 16
    addiu       $v1, $zero, 0x32
    bne         $v0, $v1, .L800AF938
    nop
    jal         func_8004DF94
    addu        $a0, $s1, $zero
    addiu       $a0, $zero, 0x32
    j           func_800AB2A4
    addu        $a1, $s1, $v0
.L800AF938:
    bgez        $s0, .L800AF948
    xori        $v0, $s4, 0x1
    j           func_800AB228
    sll         $v0, $s4, 16
.L800AF948:
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xCE5
    addu        $a1, $v1, $v0
    sll         $a0, $s3, 16
    sra         $a0, $a0, 16
    jal         func_8002E65C
    addu        $a0, $s1, $a0
    jal         func_8004DF94
    addu        $a0, $s1, $zero
    sll         $a0, $s2, 16
    sra         $a0, $a0, 16
    addiu       $a1, $v0, 0x1
    sll         $a1, $a1, 16
    sra         $a1, $a1, 16
    addu        $a1, $s1, $a1
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    addu        $v0, $s1, $v0
    addiu       $v1, $zero, 0x20
    sb          $v1, 0x0($v0)
    sb          $zero, 0x0($a1)
    jal         func_800167FC
    nop
    lw          $ra, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_800AF8E0
