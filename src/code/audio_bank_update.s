.text
.align 2
.set noreorder
.globl audio_bank_update
.ent audio_bank_update
audio_bank_update:
    addiu       $sp, $sp, -0x78
    addu        $v1, $zero, $zero
    lui         $a2, 0x8007
    addiu       $a2, $a2, -0x461C
    sw          $s7, 0x6C($sp)
    lui         $s7, 0x8007
    lhu         $s7, -0x4620($s7)
    addiu       $a3, $sp, 0x10
    addiu       $v0, $zero, 0x1E
    sw          $ra, 0x70($sp)
    sw          $s6, 0x68($sp)
    sw          $s5, 0x64($sp)
    sw          $s4, 0x60($sp)
    sw          $s3, 0x5C($sp)
    sw          $s2, 0x58($sp)
    sw          $s1, 0x54($sp)
    sw          $s0, 0x50($sp)
    lui         $at, 0x8007
    sh          $v0, -0x4620($at)
.L8003E6B4:
    lhu         $v0, 0x0($a2)
    sh          $v0, 0x0($a3)
    sh          $v1, 0x0($a2)
    addiu       $a2, $a2, 0x2
    addiu       $v1, $v1, 0x1
    sltiu       $v0, $v1, 0x1F
    bnez        $v0, .L8003E6B4
    addiu       $a3, $a3, 0x2
    addu        $s2, $zero, $zero
    lui         $v0, 0x8008
    addiu       $v0, $v0, 0xC90
    addu        $s4, $v0, $zero
    addiu       $s6, $s4, 0x6C
    addiu       $s5, $s4, 0xDA
    sb          $a0, 0x0($s4)
    lui         $at, 0x8008
    sb          $a1, 0x2DDC($at)
    andi        $v0, $s2, 0xFFFF
.L8003E6FC:
    sll         $v1, $v0, 5
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    addu        $v1, $v1, $v0
    sll         $v1, $v1, 2
    subu        $v1, $v1, $v0
    sll         $s1, $v1, 2
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $v0, 0xC90($at)
    sltiu       $v0, $v0, 0x1E
    beqz        $v0, .L8003E750
    addu        $s3, $zero, $zero
    addiu       $s3, $zero, 0x1
    addiu       $a0, $zero, 0x1
    jal         func_8003A600
    addu        $a1, $zero, $zero
    jal         func_80024694
    nop
.L8003E750:
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $a0, 0xC90($at)
    jal         func_8003A7DC
    addu        $a1, $s1, $s4
    lui         $at, 0x8008
    addu        $at, $at, $s1
    lbu         $a0, 0xC90($at)
    addu        $s0, $s1, $s6
    jal         func_8003A8CC
    addu        $a1, $s0, $zero
    addu        $a0, $s0, $zero
    jal         func_8003AE80
    addu        $a1, $s1, $s5
    addiu       $v0, $zero, 0x3
    andi        $v1, $s3, 0xFF
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $v0, 0x2D96($at)
    addiu       $v0, $zero, 0x1
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $zero, 0x2D94($at)
    lui         $at, 0x8008
    addu        $at, $at, $s1
    sh          $zero, 0x2DB0($at)
    bnel        $v1, $v0, .L8003E7D4
    addiu       $s2, $s2, 0x1
    addu        $a0, $zero, $zero
    jal         func_8003A600
    addu        $a1, $zero, $zero
    jal         func_80024E9C
    addiu       $s2, $s2, 0x1
.L8003E7D4:
    andi        $v0, $s2, 0xFFFF
    sltiu       $v0, $v0, 0x2
    bnez        $v0, .L8003E6FC
    andi        $v0, $s2, 0xFFFF
    jal         func_8003E9B0
    nop
    lui         $at, 0x8007
    sh          $s7, -0x4620($at)
    addu        $v1, $zero, $zero
    lui         $a1, 0x8007
    addiu       $a1, $a1, -0x461C
    addiu       $a0, $sp, 0x10
.L8003E804:
    lhu         $v0, 0x0($a0)
    addiu       $a0, $a0, 0x2
    addiu       $v1, $v1, 0x1
    sh          $v0, 0x0($a1)
    sltiu       $v0, $v1, 0x1F
    bnez        $v0, .L8003E804
    addiu       $a1, $a1, 0x2
    lw          $ra, 0x70($sp)
    lw          $s7, 0x6C($sp)
    lw          $s6, 0x68($sp)
    lw          $s5, 0x64($sp)
    lw          $s4, 0x60($sp)
    lw          $s3, 0x5C($sp)
    lw          $s2, 0x58($sp)
    lw          $s1, 0x54($sp)
    lw          $s0, 0x50($sp)
    addiu       $sp, $sp, 0x78
    jr          $ra
    nop
.end audio_bank_update
