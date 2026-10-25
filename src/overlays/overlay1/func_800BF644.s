.text
.align 2
.set noreorder
.globl func_800BF644
.ent func_800BF644
func_800BF644:
    lui         $v0, 0x8008
    lw          $v0, 0xC1C($v0)
    bnel        $v0, $zero, . + 4 + (0x5A << 2)
    addu        $v0, $zero, $zero
    andi        $v1, $s2, 0x2
    beqz        $v1, .L800BF670
    addu        $a0, $s0, $zero
    jal         func_800BD6F8
    addiu       $a1, $zero, -0x1
    j           func_800BB094
    addiu       $v0, $zero, 0x1
.L800BF670:
    lui         $v0, 0x8008
    lh          $v0, 0x5024($v0)
    slt         $v0, $v1, $v0
    beqz        $v0, . + 4 + (0x4D << 2)
    addu        $s1, $zero, $zero
    lui         $s3, 0x8007
    addiu       $s3, $s3, 0x26D8
    sll         $v0, $s1, 16
    sra         $v1, $v0, 16
    sll         $v0, $v1, 2
    addu        $v0, $v0, $s3
    lw          $a0, 0x0($v0)
    and         $v0, $s2, $a0
    beqz        $v0, . + 4 + (0x11 << 2)
    addiu       $v0, $s1, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lb          $v0, 0x7FE4($at)
    beqz        $v0, . + 4 + (0xC << 2)
    addiu       $v0, $s1, 0x1
    lui         $v0, 0x8008
    lw          $v0, 0xC1C($v0)
    or          $v0, $v0, $a0
    lui         $at, 0x8008
    sw          $v0, 0xC1C($at)
    lui         $at, 0x8008
    addu        $at, $at, $v1
    lb          $a1, 0x79A4($at)
    jal         func_800BD6F8
    addu        $a0, $s0, $zero
.end func_800BF644
