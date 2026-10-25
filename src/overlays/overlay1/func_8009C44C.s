.text
.align 2
.set noreorder
.globl func_8009C44C
.ent func_8009C44C
func_8009C44C:
    addiu       $sp, $sp, -0x30
    sw          $ra, 0x2C($sp)
    sw          $s4, 0x28($sp)
    sw          $s3, 0x24($sp)
    sw          $s2, 0x20($sp)
    sw          $s1, 0x1C($sp)
    sw          $s0, 0x18($sp)
    lw          $s2, 0x8($a0)
    addu        $s3, $a1, $zero
    lw          $v0, 0xC($s2)
    lw          $v1, 0x4($s2)
    addu        $s4, $a2, $zero
    or          $v0, $v0, $s4
    beqz        $v1, .L8009C4B4
    sw          $v0, 0xC($s2)
    addiu       $a0, $zero, 0x5
    jal         func_8000D8DC
    addu        $a1, $zero, $zero
    lui         $a0, 0x8009
    lw          $a0, -0x6CE4($a0)
    lw          $a2, 0x8($v0)
    lw          $v1, 0x4($s2)
    addu        $a1, $v0, $zero
    sw          $v1, 0x4($a2)
    jal         func_8000D834
    sw          $zero, 0x4($s2)
.L8009C4B4:
    beqz        $s3, .L8009C59C
    andi        $v0, $s4, 0x2
    bnez        $v0, .L8009C4D8
    addu        $a0, $s3, $zero
    lui         $a1, 0x8006
    lw          $a1, 0x5450($a1)
    addu        $a2, $zero, $zero
    j           func_80097DC4
    addiu       $a3, $zero, 0x9
.L8009C4D8:
    lui         $a1, 0x8006
    lw          $a1, 0x5454($a1)
    addu        $a2, $zero, $zero
    addu        $a3, $zero, $zero
    jal         func_8001E820
    nop
    andi        $v0, $v0, 0xFFFF
    addiu       $a2, $v0, 0x2
    sltiu       $v0, $a2, 0x40
    beql        $v0, $zero, .L8009C504
    addiu       $a2, $zero, 0x40
.L8009C504:
    addu        $v1, $a2, $zero
    addiu       $a2, $a2, 0xF
    addiu       $v0, $zero, -0x10
    and         $a2, $a2, $v0
    addu        $v0, $a2, $zero
    addiu       $a1, $zero, 0x7
    sh          $v0, 0x0($s2)
    sh          $v0, 0x14($sp)
    sh          $a1, 0x2($s2)
    lh          $s1, 0x14($sp)
    addiu       $v0, $zero, 0x7
    .word       0x02220018  # mult        $s1, $v0
    .word       0x00008812  # mflo        $s1
    addu        $a0, $zero, $zero
    subu        $v1, $a2, $v1
    srl         $v1, $v1, 1
    addiu       $v1, $v1, 0x2
    sh          $a1, 0x16($sp)
    sh          $v1, 0x10($sp)
    addiu       $v0, $zero, 0x6
    sh          $v0, 0x12($sp)
    sra         $s1, $s1, 1
    jal         func_80032E00
    addu        $a1, $s1, $zero
    addu        $a0, $zero, $zero
    addu        $s0, $v0, $zero
    addu        $a1, $s0, $zero
    addu        $a2, $s1, $zero
    addiu       $a3, $zero, 0x11
    jal         func_80033308
    sw          $s0, 0x4($s2)
    addiu       $a0, $sp, 0x10
    addu        $a1, $s0, $zero
    addu        $a2, $s3, $zero
    lui         $at, 0x8008
    sb          $zero, 0x5027($at)
    jal         func_80097E9C
    addu        $a3, $s4, $zero
.L8009C59C:
    lw          $ra, 0x2C($sp)
    lw          $s4, 0x28($sp)
    lw          $s3, 0x24($sp)
    lw          $s2, 0x20($sp)
    lw          $s1, 0x1C($sp)
    lw          $s0, 0x18($sp)
    addiu       $sp, $sp, 0x30
    jr          $ra
    nop
.end func_8009C44C
