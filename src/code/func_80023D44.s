.text
.align 2
.set noreorder
.globl func_80023D44
.ent func_80023D44
func_80023D44:
    addiu       $sp, $sp, -0x28
    sw          $s0, 0x10($sp)
    andi        $s0, $a0, 0xFFFF
    sll         $v0, $s0, 5
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s0
    sll         $v0, $v0, 2
    sw          $s2, 0x18($sp)
    andi        $s2, $a1, 0xFFFF
    lui         $a0, 0x8008
    addiu       $a0, $a0, 0xCFC
    sll         $v1, $s2, 1
    addu        $v0, $v0, $a0
    addu        $v1, $v1, $v0
    sw          $ra, 0x20($sp)
    sw          $s3, 0x1C($sp)
    sw          $s1, 0x14($sp)
    lhu         $v1, 0x0($v1)
    ori         $v0, $zero, 0xFFFF
    bne         $v1, $v0, .L80023DB4
    addu        $s3, $a2, $zero
    j .L80023E38
    addiu       $v0, $zero, -0x8000
.L80023DB4:
    addu        $a0, $s0, $zero
    addu        $a1, $s2, $zero
    jal         func_80023C60
    andi        $a2, $a3, 0xFFFF
    sll         $v0, $v0, 16
    sra         $s1, $v0, 16
    beqz        $s1, .L80023E34
    addu        $a0, $s0, $zero
    addu        $a1, $s2, $zero
    jal         func_80023C60
    andi        $a2, $s3, 0xFFFF
    sll         $v1, $v0, 16
    sra         $v1, $v1, 16
    sll         $v0, $v1, 1
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 3
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    .word       0x0051001A  # div         $zero, $v0, $s1
    bnez        $s1, .L80023E0C
    nop
    break       7
.L80023E0C:
    addiu       $at, $zero, -0x1
    bne         $s1, $at, .L80023E24
    lui         $at, 0x8000
    bne         $v0, $at, .L80023E24
    nop
    break       6
.L80023E24:
    .word       0x00001012  # mflo        $v0
    sll         $v0, $v0, 16
    j .L80023E38
    sra         $v0, $v0, 16
.L80023E34:
    addu        $v0, $zero, $zero
.L80023E38:
    lw          $ra, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x28
    jr          $ra
    nop
.end func_80023D44
