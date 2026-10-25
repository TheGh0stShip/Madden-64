.text
.align 2
.set noreorder
.globl func_800ADA5C
.ent func_800ADA5C
func_800ADA5C:
    addu        $s2, $a0, $zero
    sw          $s3, 0x24($sp)
    addu        $s3, $a1, $zero
    sw          $s0, 0x18($sp)
    addu        $s0, $s2, $zero
    sw          $s5, 0x2C($sp)
    andi        $s5, $s3, 0xFFFF
    sw          $ra, 0x30($sp)
    sw          $s4, 0x28($sp)
    beqz        $s5, .L800ADA8C
    sw          $s1, 0x1C($sp)
    addiu       $s3, $zero, 0x1
.L800ADA8C:
    lui         $a3, 0x8008
    lw          $a3, 0x69C8($a3)
    lui         $a0, 0x8008
    lw          $a0, -0x5E94($a0)
    addu        $a1, $zero, $zero
    xori        $s2, $s2, 0x1
    andi        $s2, $s2, 0xFFFF
    lui         $v0, 0x8008
    lw          $v0, -0x5E90($v0)
    sll         $s2, $s2, 6
    addiu       $s4, $zero, 0x10
    andi        $s3, $s3, 0xFFFF
    andi        $s0, $s0, 0xFFFF
    sll         $s1, $s0, 3
    addu        $s1, $s1, $s0
    sll         $s1, $s1, 2
    sll         $s3, $s3, 5
    sh          $zero, 0x4($v0)
    sh          $s4, 0x6($v0)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $v1, -0x4808($at)
    addu        $a3, $a3, $s2
    addu        $a3, $a3, $s3
    sw          $a3, 0x8($v0)
    jal         func_8000DBA4
    sw          $v1, 0x0($v0)
    lui         $v0, 0x8008
    lw          $v0, 0x69C8($v0)
    lui         $a0, 0x8008
    lw          $a0, -0x5E94($a0)
    addu        $a1, $zero, $zero
    lui         $v1, 0x8008
    lw          $v1, -0x5E90($v1)
    addiu       $a3, $v0, 0x80
    sll         $v0, $s0, 1
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 7
    addu        $a3, $a3, $v0
    addiu       $v0, $zero, 0x40
    sll         $s0, $s0, 2
    sh          $v0, 0x6($v1)
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lw          $a2, -0x5F44($at)
    sll         $v0, $s5, 7
    addu        $a3, $a3, $v0
    sw          $a3, 0x8($v1)
    jal         func_8000DBA4
    sw          $a2, 0x0($v1)
    lui         $a3, 0x8008
    lw          $a3, 0x69C8($a3)
    lui         $a0, 0x8008
    lw          $a0, -0x5E94($a0)
    lui         $v0, 0x8008
    lw          $v0, -0x5E90($v0)
    addu        $a1, $zero, $zero
    addiu       $a3, $a3, 0x380
    sh          $zero, 0x4($v0)
    sh          $s4, 0x6($v0)
    lui         $at, 0x8007
    addu        $at, $at, $s1
    lw          $v1, -0x47FC($at)
    addu        $a3, $a3, $s2
    addu        $a3, $a3, $s3
    sw          $a3, 0x8($v0)
    jal         func_8000DBA4
    sw          $v1, 0x0($v0)
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
.end func_800ADA5C
