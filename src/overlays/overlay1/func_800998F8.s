.text
.align 2
.set noreorder
.globl func_800998F8
.ent func_800998F8
func_800998F8:
    beqz        $v0, .L800999F4
    addu        $t1, $v0, $zero
    lw          $v0, 0x18($t1)
    sw          $v0, 0x18($s2)
    lw          $v0, 0x18($s3)
    sw          $v0, 0x1C($s2)
    lw          $v0, 0x1C($s3)
    sw          $v0, 0x20($s2)
    lw          $v1, 0x20($s3)
    addiu       $v0, $zero, 0x1
    sw          $zero, 0x34($s2)
    sw          $zero, 0x30($s2)
    sw          $zero, 0x2C($s2)
    sw          $v0, 0x14($s2)
    sw          $v1, 0x24($s2)
    lw          $a2, 0x8($t1)
    or          $v0, $a2, $s1
    andi        $v0, $v0, 0x3
    beqz        $v0, .L800999A0
    addu        $a3, $s1, $zero
    addiu       $t0, $a2, 0x80
.L8009994C:
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    lwl         $v1, 0x4($a2)
    lwr         $v1, 0x7($a2)
    lwl         $a0, 0x8($a2)
    lwr         $a0, 0xB($a2)
    lwl         $a1, 0xC($a2)
    lwr         $a1, 0xF($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    swl         $v1, 0x4($a3)
    swr         $v1, 0x7($a3)
    swl         $a0, 0x8($a3)
    swr         $a0, 0xB($a3)
    swl         $a1, 0xC($a3)
    swr         $a1, 0xF($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L8009994C
    addiu       $a3, $a3, 0x10
    j           func_800952AC
    nop
.L800999A0:
    addiu       $t0, $a2, 0x80
.L800999A4:
    lw          $v0, 0x0($a2)
    lw          $v1, 0x4($a2)
    lw          $a0, 0x8($a2)
    lw          $a1, 0xC($a2)
    sw          $v0, 0x0($a3)
    sw          $v1, 0x4($a3)
    sw          $a0, 0x8($a3)
    sw          $a1, 0xC($a3)
    addiu       $a2, $a2, 0x10
    bne         $a2, $t0, .L800999A4
    addiu       $a3, $a3, 0x10
    lwl         $v0, 0x0($a2)
    lwr         $v0, 0x3($a2)
    swl         $v0, 0x0($a3)
    swr         $v0, 0x3($a3)
    lhu         $v0, 0x68($s1)
    sw          $t1, 0x70($s1)
    ori         $v0, $v0, 0x2
    j           func_80095430
    sh          $v0, 0x68($s1)
.L800999F4:
    lw          $v1, 0x0($s3)
    lw          $v0, 0xC($v1)
    sw          $v0, 0x18($s1)
    lw          $v0, 0x14($v1)
    sw          $v0, 0x1C($s1)
    lw          $v0, 0x18($v1)
    addiu       $v1, $zero, 0x100
    sh          $v1, 0x78($s1)
    sh          $v1, 0x7A($s1)
    addiu       $v0, $v0, 0x4
    sw          $v0, 0x20($s1)
    lhu         $s0, 0xA($s3)
    lhu         $v0, 0xC($s3)
    .word       0x02020018  # mult        $s0, $v0
    .word       0x00008012  # mflo        $s0
    addiu       $v0, $zero, -0x8
    addiu       $s0, $s0, 0x7
    and         $s0, $s0, $v0
    jal         func_800969D8
    sll         $a0, $s0, 1
    lui         $v1, 0x8006
    lw          $v1, 0x5428($v1)
    addu        $v0, $v0, $v1
    sw          $v0, 0x4C($s1)
    lw          $v1, 0x4C($s1)
    sh          $zero, 0x48($s1)
    addu        $v0, $v0, $s0
    sw          $v0, 0x50($s1)
    sw          $v1, 0x54($s1)
    lhu         $v0, 0xE($s3)
    sw          $v0, 0x18($s2)
    sh          $v0, 0x60($s1)
    lw          $v0, 0x18($s3)
    sw          $v0, 0x1C($s2)
    lw          $v0, 0x1C($s3)
    sw          $v0, 0x20($s2)
    lw          $v0, 0x20($s3)
    sw          $v0, 0x24($s2)
    lhu         $v0, 0x8($s3)
    sh          $v0, 0x12($s1)
    lw          $v0, 0x14($s3)
    sw          $v0, 0x64($s1)
    lw          $v0, 0x0($s3)
    sw          $zero, 0x4($s1)
    sw          $v0, 0x0($s1)
    lw          $a1, 0x4($s3)
    jal         func_80034388
    addu        $a0, $s2, $zero
    addu        $a0, $s2, $zero
    jal         func_80033B20
.end func_800998F8
