.text
.align 2
.set noreorder
.globl func_8003F060
.ent func_8003F060
func_8003F060:
    lui         $v0, 0x8007
    lh          $v0, 0x40CA($v0)
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    addu        $s0, $a0, $zero
    sw          $s1, 0x14($sp)
    addu        $s1, $s0, $zero
    sw          $s2, 0x18($sp)
    addu        $s2, $a1, $zero
    sw          $s3, 0x1C($sp)
    addu        $s3, $a2, $zero
    beqz        $v0, .L8003F148
    sw          $ra, 0x20($sp)
    jal         func_8003FE94
    andi        $a0, $s1, 0xFFFF
    addu        $a3, $v0, $zero
    sll         $v0, $a3, 16
    sra         $a2, $v0, 16
    addiu       $v0, $zero, -0x1
    beq         $a2, $v0, .L8003F148
    sll         $a0, $s0, 16
    sra         $a0, $a0, 16
    sll         $v1, $a0, 5
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $a0
    sll         $v1, $v1, 2
    andi        $a1, $s2, 0xFFFF
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0xCFC
    sll         $a1, $a1, 1
    addu        $a0, $v1, $a0
    addu        $a1, $a1, $a0
    lhu         $a1, 0x0($a1)
    sll         $a0, $a2, 2
    addu        $a0, $a0, $v1
    addiu       $v1, $zero, 0xE0
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $s3, 0x2D86($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sb          $v1, 0x2D87($at)
    lui         $at, 0x8008
    sb          $s1, 0x7AFC($at)
    lui         $at, 0x8008
    sb          $a3, 0x76F4($at)
    lui         $at, 0x8009
    sb          $s2, -0x49D8($at)
    lui         $at, 0x8008
    addu        $at, $at, $a0
    sh          $a1, 0x2D84($at)
    j .L8003F14C
    addiu       $v0, $zero, 0x1
.L8003F148:
    addu        $v0, $zero, $zero
.L8003F14C:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_8003F060
