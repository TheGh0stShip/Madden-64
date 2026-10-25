.text
.align 2
.set noreorder
.globl func_800B3310
.ent func_800B3310
func_800B3310:
    addiu       $sp, $sp, -0x38
    sw          $ra, 0x34($sp)
    sw          $s4, 0x30($sp)
    sw          $s3, 0x2C($sp)
    sw          $s2, 0x28($sp)
    sw          $s1, 0x24($sp)
    sw          $s0, 0x20($sp)
    lw          $s1, 0x4($a0)
    lw          $s2, 0x8($a0)
    lui         $a0, 0x8007
    addiu       $a0, $a0, -0x4698
    jal         func_8001AEA8
    andi        $s4, $s1, 0xFFFF
    lui         $at, 0x8007
    sw          $zero, -0x4694($at)
    sll         $v0, $s1, 5
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    addu        $v0, $v0, $s1
    sll         $v0, $v0, 2
    subu        $v0, $v0, $s1
    sll         $s3, $v0, 2
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lw          $v0, 0x2DCC($at)
    addu        $a0, $s4, $zero
    lui         $at, 0x8007
    sw          $zero, -0x468C($at)
    lui         $at, 0x8007
    sw          $v0, -0x4690($at)
    jal         func_800397C8
    andi        $a1, $s2, 0xFFFF
    andi        $s0, $v0, 0xFFFF
    beql        $s0, $zero, .L800B33A4
    addiu       $s0, $zero, 0x631
.L800B33A4:
    jal         func_800AEAD0
    nop
    jal         func_800AE65C
    nop
    andi        $v0, $v0, 0xFFFF
    beql        $s0, $v0, .L800B33D4
    addu        $a0, $s1, $zero
    jal         func_800AE5C4
    addu        $a0, $s0, $zero
    jal         func_800AEAD0
    nop
    addu        $a0, $s1, $zero
.L800B33D4:
    addu        $a1, $s2, $zero
    lui         $at, 0x8008
    addu        $at, $at, $s3
    lw          $a3, 0x2DD4($at)
    lui         $s2, 0x8007
    addiu       $s2, $s2, -0x4674
    addiu       $v0, $zero, 0x4
    lui         $s1, 0x8008
    addiu       $s1, $s1, 0xD6A
    addu        $s1, $s3, $s1
    sll         $s0, $a1, 2
    addu        $s0, $s0, $a1
    sll         $s0, $s0, 3
    addu        $s1, $s1, $s0
    sw          $v0, 0x0($s2)
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0x5A80
    addiu       $v1, $v0, 0x28
    lui         $at, 0x8007
    sw          $s1, -0x4670($at)
    sw          $v0, 0x8($s2)
    addiu       $v0, $v0, 0x50
    lui         $at, 0x8007
    sw          $v1, -0x4668($at)
    lui         $at, 0x8007
    sw          $v0, -0x4664($at)
    lui         $at, 0x8007
    sw          $a3, -0x468C($at)
    jal         func_8002B1B8
    addiu       $a2, $sp, 0x10
    addiu       $a1, $zero, 0x3
    addu        $s0, $s0, $s3
    lui         $at, 0x8008
    addu        $at, $at, $s0
    lbu         $a0, 0xD78($at)
    addiu       $a2, $s2, 0x8
    addiu       $a3, $sp, 0x10
    jal         func_8002AC68
    andi        $a0, $a0, 0x3F
    addu        $a0, $zero, $zero
    jal         func_8001F2B4
    addu        $a1, $s1, $zero
    addu        $a0, $zero, $zero
    jal         func_8001F81C
    addu        $a1, $s4, $zero
    addiu       $a0, $zero, 0xB0
    addu        $a1, $s2, $zero
    jal         func_800AEB2C
    addiu       $a2, $zero, 0x3
    lui         $at, 0x8007
    sh          $v0, -0x463E($at)
    jal         func_800AEA9C
    addiu       $a0, $zero, 0x1
    lw          $ra, 0x34($sp)
    lw          $s4, 0x30($sp)
    lw          $s3, 0x2C($sp)
    lw          $s2, 0x28($sp)
    lw          $s1, 0x24($sp)
    lw          $s0, 0x20($sp)
    addiu       $sp, $sp, 0x38
    jr          $ra
    nop
.end func_800B3310
