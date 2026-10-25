.text
.align 2
.set noreorder
.globl func_80034D30
.ent func_80034D30
func_80034D30:
    addiu       $sp, $sp, -0x30
    sw          $s0, 0x18($sp)
    addu        $s0, $a0, $zero
    sw          $s2, 0x20($sp)
    addu        $s2, $a1, $zero
    addiu       $a1, $sp, 0x10
    sw          $ra, 0x28($sp)
    sw          $s3, 0x24($sp)
    jal         func_800349FC
    sw          $s1, 0x1C($sp)
    lh          $s1, 0x10($sp)
    addu        $v1, $v0, $zero
    addiu       $v0, $zero, -0x1
    bne         $s1, $v0, .L80034E38
    andi        $v0, $v1, 0xFFFF
    andi        $v0, $s0, 0xFF00
    srl         $s0, $v0, 8
    lui         $a0, 0x8009
    lhu         $a0, -0x6D04($a0)
    andi        $s3, $s0, 0xFFFF
    jal         func_80035598
    addu        $a1, $s3, $zero
    andi        $a0, $v0, 0xFFFF
    jal         func_80034CB4
    andi        $a1, $s2, 0xFFFF
    sh          $v0, 0x10($sp)
    sll         $v0, $v0, 16
    sra         $a0, $v0, 16
    bne         $a0, $s1, .L80034DB0
    sll         $v0, $a0, 2
    j .L80034E38
    addu        $v0, $zero, $zero
.L80034DB0:
    lui         $v1, 0x8007
    lw          $v1, 0x24DC($v1)
    addu        $v0, $v0, $a0
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    sb          $s0, 0xD($v0)
    lh          $a1, 0x10($sp)
    lui         $a2, 0x8007
    lw          $a2, 0x24DC($a2)
    addiu       $a0, $zero, 0x3
    addiu       $v1, $zero, 0x1
    sw          $v1, 0x8($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x79E0($v1)
    sll         $v0, $a1, 2
    addu        $v0, $v0, $a1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a2
    addiu       $a1, $v0, 0x8
    jal         func_80036464
    sw          $v1, 0x10($v0)
    lh          $v1, 0x10($sp)
    lui         $a0, 0x8009
    lhu         $a0, -0x6D04($a0)
    lui         $a1, 0x8007
    lw          $a1, 0x24DC($a1)
    sll         $v0, $v1, 2
    addu        $v0, $v0, $v1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $a1
    lw          $a2, 0x4($v0)
    jal         func_800363F4
    addu        $a1, $s3, $zero
    addiu       $v0, $zero, 0x1
.L80034E38:
    lw          $ra, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_80034D30
