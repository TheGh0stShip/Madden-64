.text
.align 2
.set noreorder
.globl func_800A1DD0
.ent func_800A1DD0
func_800A1DD0:
    lh          $v1, 0x4($s0)
    slti        $v0, $v1, -0x320
    bnez        $v0, .L800A1E28
    lui         $t0, 0xFC40
    sll         $v0, $v1, 16
    lui         $at, 0x8008
    sw          $v0, 0x78E4($at)
    lui         $at, 0x8008
    sw          $zero, 0x78E0($at)
    j           func_8009D710
    addiu       $t0, $zero, -0x1
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x4($s2)
    lh          $v0, 0x4($s0)
    slti        $v0, $v0, -0x320
    beqz        $v0, .L800A1E8C
    addiu       $s4, $zero, 0x5
    lui         $t0, 0xFC40
.L800A1E28:
    sw          $t0, 0x4($s2)
    addiu       $t0, $zero, 0x1
    sw          $zero, 0x0($s2)
    lui         $at, 0x8008
    sh          $t0, 0x7AF0($at)
    j           func_8009D79C
    addu        $s1, $s3, $zero
    lh          $v0, 0x2($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x0($s2)
    lh          $v0, 0x4($s0)
    sll         $v0, $v0, 16
    sw          $v0, 0x4($s2)
    lh          $v0, 0x4($s0)
    slti        $v0, $v0, -0x320
    beqz        $v0, .L800A1E8C
    addiu       $s4, $zero, 0x5
    lui         $t0, 0xFC40
    sw          $t0, 0x4($s2)
    addiu       $t0, $zero, 0x1
    sw          $zero, 0x0($s2)
    lui         $at, 0x8008
    sh          $t0, 0x7AF0($at)
    jal         func_8004192C
    addiu       $a0, $zero, 0x1
.L800A1E8C:
    j           func_8009D79C
    addu        $s1, $s3, $zero
.end func_800A1DD0
