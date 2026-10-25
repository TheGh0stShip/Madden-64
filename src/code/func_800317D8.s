.text
.align 2
.set noreorder
.globl func_800317D8
.ent func_800317D8
func_800317D8:
    sll         $v0, $a0, 16
    sra         $t1, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $t1
    lb          $a3, 0x6DE4($at)
    sll         $v0, $a3, 2
    lui         $at, 0x8009
    addu        $at, $at, $v0
    lw          $v1, -0x49A0($at)
    andi        $v0, $v1, 0x1
    beqz        $v0, .L800318D8
    addu        $t2, $a2, $zero
    sll         $v0, $a1, 24
    sra         $v0, $v0, 27
    beqz        $v0, .L800318D8
    addu        $t0, $v0, $zero
    andi        $v0, $v1, 0x6
    beqz        $v0, .L8003187C
    sll         $v0, $a0, 16
    lui         $at, 0x8009
    addu        $at, $at, $a3
    lb          $v1, -0x6A2C($at)
    slti        $v0, $v1, 0x2
    bnez        $v0, .L8003187C
    sll         $v0, $a0, 16
    sll         $v0, $a2, 24
    sra         $v0, $v0, 24
    slt         $v0, $v1, $v0
    beqz        $v0, .L800318D8
    nop
    lui         $at, 0x8008
    addu        $at, $at, $t1
    lb          $v0, 0x6DE4($at)
    lui         $at, 0x8009
    addu        $at, $at, $a3
    sb          $t2, -0x6A2C($at)
    lui         $at, 0x8009
    addu        $at, $at, $v0
    sb          $t0, -0x6D2C($at)
    j .L800318D8
    nop
.L8003187C:
    sra         $v0, $v0, 16
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lb          $a0, 0x6DE4($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lb          $v1, 0x6DE4($at)
    lui         $at, 0x8008
    addu        $at, $at, $v0
    lb          $a1, 0x6DE4($at)
    lui         $v0, 0x8009
    addiu       $v0, $v0, -0x49A0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    lui         $at, 0x8009
    addu        $at, $at, $a0
    sb          $t0, -0x6D2C($at)
    lui         $at, 0x8009
    addu        $at, $at, $a1
    sb          $t2, -0x6A2C($at)
    lw          $v0, 0x0($v1)
    ori         $v0, $v0, 0x4
    sw          $v0, 0x0($v1)
.L800318D8:
    jr          $ra
    nop
.end func_800317D8
