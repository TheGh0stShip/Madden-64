.text
.align 2
.set noreorder
.globl func_80097200
.ent func_80097200
func_80097200:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lw          $v0, 0x2DB4($at)
    lw          $v0, 0x24($v0)
    lui         $v1, 0x8009
    lw          $v1, -0x6A24($v1)
    addu        $v0, $s0, $v0
    lhu         $v0, 0x0($v0)
    lui         $at, 0x8007
    sh          $v0, -0x4854($at)
    andi        $v0, $v0, 0x1FFF
    sll         $v0, $v0, 2
    addu        $v0, $v0, $v1
    lw          $v0, 0x4($v0)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sw          $v0, 0x2DBC($at)
    jal         func_80092830
    sra         $a0, $s7, 16
    addiu       $a1, $zero, 0x1
    addiu       $s0, $s0, 0x2
    addiu       $s3, $s3, 0x1
    sltiu       $v0, $a1, 0x1
    slti        $v1, $s3, 0x4
    and         $v0, $v0, $v1
    bnez        $v0, . + 4 + (-0x31 << 2)
    addiu       $s2, $s2, 0x4
    addiu       $v0, $zero, 0x1
    bne         $a1, $v0, .L80097284
    addu        $v0, $zero, $zero
    jal         func_800AE87C
    andi        $a0, $fp, 0xFFFF
    addiu       $v0, $zero, 0x1
.L80097284:
    lw          $ra, 0x34($sp)
    lw          $fp, 0x30($sp)
    lw          $s7, 0x2C($sp)
    lw          $s6, 0x28($sp)
    lw          $s5, 0x24($sp)
    lw          $s4, 0x20($sp)
    lw          $s3, 0x1C($sp)
    lw          $s2, 0x18($sp)
    lw          $s1, 0x14($sp)
    lw          $s0, 0x10($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_80097200
