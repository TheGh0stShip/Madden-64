.text
.align 2
.set noreorder
.globl func_800B20C0
.ent func_800B20C0
func_800B20C0:
    addu        $s2, $v0, $zero
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    slti        $v0, $v0, 0x4
    bnez        $v0, . + 4 + (-0x4D << 2)
    sll         $v0, $s2, 16
    jal         func_80031A1C
    addiu       $a0, $zero, 0x5
    lui         $a0, 0x8009
    lhu         $a0, -0x7B8E($a0)
    lui         $a2, 0x8007
    lw          $a2, -0x462C($a2)
    andi        $v0, $v0, 0xFFFF
    jal         func_800363F4
    addiu       $a1, $v0, 0x2
    jal         func_800AE680
    nop
    lhu         $t1, 0x16($sp)
    sll         $a1, $s3, 16
    sra         $a1, $a1, 16
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x4674
    lui         $v1, 0x8007
    lw          $v1, -0x4674($v1)
    lw          $t0, 0x4($s7)
    addu        $a3, $v0, $zero
    sll         $a0, $t1, 16
    sll         $v1, $v1, 2
    lui         $at, 0x8007
    addu        $at, $at, $v1
    sw          $t0, -0x4674($at)
    jal         func_800AEFF8
    sra         $a0, $a0, 16
    sll         $v0, $v0, 16
    sra         $v0, $v0, 16
    lw          $ra, 0x44($sp)
    lw          $fp, 0x40($sp)
    lw          $s7, 0x3C($sp)
    lw          $s6, 0x38($sp)
    lw          $s5, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x48
    jr          $ra
    nop
.end func_800B20C0
